using ServerSide.Gamemode.Elements;
using Shared.Rpc;
using Slipe.Server.Elements;
using Slipe.Server.Events;
using Slipe.Server.Game;
using Slipe.Server.IO;
using Slipe.Server.Peds;
using Slipe.Server.Rpc;
using Slipe.Server.Vehicles;
using Slipe.Server.Vehicles.Events;
using Slipe.Shared.Rendering;
using Slipe.Shared.Vehicles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading;
using System.Timers;

namespace ServerSide.GameMode
{
    class Race
    {
        private Spawnpoint[] spawnpoints;
        private int finishedCount;
        private int disqualifiedCount;
        private bool hasStarted;

        private List<RacePlayer> racers;
        private List<Checkpoint> checkpoints;

        private int startTicks;

        private bool InProgress
        {
            get
            {
                foreach (RacePlayer player in this.racers)
                {
                    if (!player.HasFinished)
                    {
                        return true;
                    }
                }
                return ! this.hasStarted;
            }
        }

        public Race(Spawnpoint[] spawnpoints)
        {
            this.spawnpoints = spawnpoints;
            this.hasStarted = false;
            this.racers = new List<RacePlayer>();
            this.checkpoints = new List<Checkpoint>();
            this.finishedCount = 0;
            this.disqualifiedCount = 0;
        }

        public void AddRacer(RacePlayer racer)
        {
            if (spawnpoints.Length <= racers.Count)
            {
                ChatBox.WriteLine(string.Format("There are only {0} positions available for this race!", this.spawnpoints.Length), racer, 0xff0000);
            }
            racers.Add(racer);
            racer.OnQuit += HandleQuit;
        }

        public void RemoveRacer(RacePlayer racer)
        {
            racers.Remove(racer);
            racer.CheckpointTimes.Clear();
            if (racer.Vehicle != null)
            {
                racer.Vehicle.Destroy();
            }
        }

        private void HandleQuit(Player source, Slipe.Server.Peds.Events.OnQuitEventArgs eventArgs)
        {
            RemoveRacer((RacePlayer)source);
        }

        public void AddCheckpoint(Checkpoint checkpoint)
        {
            checkpoints.Add(checkpoint);

            if (checkpoints.Count > 1)
            {
                checkpoints[checkpoints.Count - 2].Next = checkpoint;
            }
            checkpoint.OnRacerHit += HandleCheckpointHit;

        }

        public void Start()
        {
            if (racers.Count == 0)
            {
                OnEnd?.Invoke();
                return;
            }

            UpdateLeaderboards();

            Checkpoint start = checkpoints[0];
            foreach(RacePlayer player in this.racers)
            {
                start.SetRaceVisibility(player, true, true);
            }

            SpawnVehicles();

            System.Timers.Timer timer = new System.Timers.Timer(500);
            timer.AutoReset = false;
            timer.Elapsed += (object source, ElapsedEventArgs args) =>
            {
                WarpPlayersIntoVehicles();
            };
            timer.Start();

            this.hasStarted = true;
        }

        private void SpawnVehicles()
        {
            for (int i = 0; i < racers.Count; i++)
            {
                RacePlayer player = racers[i];
                Spawnpoint spawnpoint = spawnpoints[i];

                Vehicle vehicle = new Vehicle(VehicleModel.FromId(spawnpoint.VehicleModel), spawnpoint.Position);
                player.Vehicle = vehicle;

                vehicle.FaceElement(checkpoints.FirstOrDefault());
                vehicle.OnExplode += (BaseVehicle source, OnExplodeEventArgs eventArgs) =>
                {
                    DisqualifyPlayer(player);
                };
                vehicle.OnStartExit += (BaseVehicle source, OnStartExitEventArgs eventArgs) =>
                {
                    Event.Cancel();
                };
            }
        }

        private void WarpPlayersIntoVehicles()
        {
            foreach(RacePlayer player in racers)
            {
                player.WarpIntoVehicle();
                player.Camera.Fade(CameraFade.In);
            }

            startTicks = GameServer.TickCount;
        }

        public void HandleCheckpointHit(Checkpoint checkpoint, RacePlayer player)
        {
            player.HitCheckpoint(checkpoint);
            UpdateLeaderboards();
            if (checkpoint.IsFinish)
            {
                this.finishedCount++;
                ChatBox.WriteLine(string.Format("{0} came in place {1}", player.Name, this.finishedCount), 0xffffff);

                player.Vehicle.Destroy();
                player.HasFinished = true;

                CheckForFinish();
            }
        }

        public void UpdateLeaderboards()
        {
            long[] times = new long[this.racers.Count];
            List<RacePlayer> sortRacers = new List<RacePlayer>(this.racers);

            sortRacers.Sort((RacePlayer a, RacePlayer b) =>
            {
                return (int)(a.CheckpointScore - b.CheckpointScore);
            });

            RacePlayer[] players = sortRacers.ToArray();
            for (int i = 0; i < players.Length; i++)
            {
                RacePlayer player = players[i];

                times[i] = player.LastCheckpointHit == null ?
                    startTicks :
                    player.CheckpointTimes[player.LastCheckpointHit];
            }

            LeaderboardRPC rpc = new LeaderboardRPC(players, times);
            foreach(RacePlayer player in this.racers)
            {
                RpcManager.Instance.TriggerRPC(player, "SlipeRace.UpdateLeaderboard", rpc);
            }
        }

        public void CheckForFinish()
        {
            if (!InProgress)
            {
                Cleanup();

                string message = string.Format("The race has ended, {0} players finished, {1} were disqualified!", this.finishedCount, this.disqualifiedCount);
                for (int i = racers.Count - 1; i >= 0; i--)
                {
                    RacePlayer racer = racers[i];
                    ChatBox.WriteLine(message, racer, 0xffffff);
                    racers.Remove(racer);
                }

                OnEnd?.Invoke();
            }
        }

        public void DisqualifyPlayer(RacePlayer player)
        {
            disqualifiedCount++;
            player.Vehicle.Destroy();
            player.HasFinished = true;

            CheckForFinish();
        }

        public void Cleanup()
        {
            foreach(Checkpoint checkpoint in this.checkpoints)
            {
                checkpoint.Destroy();
            }
        }

        public event Action OnEnd;
    }
}

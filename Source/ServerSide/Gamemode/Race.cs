using ServerSide.GameMode.Elements;
using ServerSide.RPCs;
using Slipe.Server.Elements;
using Slipe.Server.Events;
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
        private Vector3[] startPositions;
        private int finishedCount;
        private int disqualifiedCount;
        private bool hasStarted;

        private List<RacePlayer> racers;
        private List<Checkpoint> checkpoints;

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

        public Race(Vector3[] startPositions)
        {
            this.startPositions = startPositions;
            this.hasStarted = false;
            this.racers = new List<RacePlayer>();
            this.checkpoints = new List<Checkpoint>();
            this.finishedCount = 0;
            this.disqualifiedCount = 0;
        }

        public void AddRacer(RacePlayer racer)
        {
            if (startPositions.Length <= racers.Count)
            {
                ChatBox.WriteLine(string.Format("There are only {0} positions available for this race!", this.startPositions.Length), racer, 0xff0000);
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

        public void Start(VehicleModel model = null)
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

            SpawnVehicles(model ?? VehicleModel.Cars.Alpha);

            System.Timers.Timer timer = new System.Timers.Timer(500);
            timer.AutoReset = false;
            timer.Elapsed += (object source, ElapsedEventArgs args) =>
            {
                WarpPlayersIntoVehicles();
            };
            timer.Start();

            this.hasStarted = true;
        }

        private void SpawnVehicles(VehicleModel model)
        {
            for (int i = 0; i < racers.Count; i++)
            {
                RacePlayer player = racers[i];
                Vehicle vehicle = new Vehicle(model, startPositions[i]);
                player.Vehicle = vehicle;

                vehicle.FaceElement(checkpoints[0]);
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
        }

        public void HandleCheckpointHit(Checkpoint checkpoint, RacePlayer player)
        {
            player.CheckpointTimes[checkpoint] = DateTime.Now.Ticks;
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
                return (int)(a.CheckpointTimes.Count * a.CheckpointTimes.Max((kvPair) => kvPair.Value) - b.CheckpointTimes.Count * a.CheckpointTimes.Max((kvPair) => kvPair.Value));
            });

            RacePlayer[] players = sortRacers.ToArray();
            for (int i = 0; i < sortRacers.Count; i++)
            {
                if (sortRacers[i].CheckpointTimes.Count == 0)
                {
                    times[i] = DateTime.Now.Ticks;
                } else
                {
                    times[i] = sortRacers[i].CheckpointTimes.Max(kvPair => kvPair.Value);
                }
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

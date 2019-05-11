using ServerSide.GameMode.Elements;
using Slipe.Server.Elements;
using Slipe.Server.Events;
using Slipe.Server.IO;
using Slipe.Server.Peds;
using Slipe.Server.Vehicles;
using Slipe.Shared.Rendering;
using Slipe.Shared.Vehicles;
using System;
using System.Collections.Generic;
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
                return false;
            }
        }

        public Race(Vector3[] startPositions)
        {
            this.startPositions = startPositions;
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
        }

        public void RemoveRacer(RacePlayer racer)
        {
            racers.Remove(racer);
            if (racer.Vehicle != null)
            {
                racer.Vehicle.Destroy();
            }
        }

        public void AddCheckpoint(Checkpoint checkpoint)
        {
            checkpoints.Add(checkpoint);

            if (checkpoints.Count > 1)
            {
                checkpoints[checkpoints.Count - 2].Next = checkpoint;
                checkpoint.OnRacerHit += HandleCheckpointHit;
            }

        }

        public void Start(VehicleModel model = null)
        {
            Checkpoint start = checkpoints[0];
            foreach(RacePlayer player in this.racers)
            {
                start.SetRaceVisibility(player, true, true);
            }

            SpawnVehicles(model != null ? model : VehicleModel.Alpha);

            System.Timers.Timer timer = new System.Timers.Timer(500);
            timer.AutoReset = false;
            timer.Elapsed += (object source, ElapsedEventArgs args) =>
            {
                WarpPlayersIntoVehicles();
            };
            timer.Start();
        }

        private void SpawnVehicles(VehicleModel model)
        {
            for (int i = 0; i < racers.Count; i++)
            {
                RacePlayer player = racers[i];
                Vehicle vehicle = new Vehicle(model, startPositions[i]);
                player.Vehicle = vehicle;

                vehicle.FaceElement(checkpoints[0]);
                vehicle.OnExplode += () =>
                {
                    DisqualifyPlayer(player);
                };
                vehicle.OnStartExit += (Player exitingPlayer, Seat seat, Player jacked, Door door) =>
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
            if (checkpoint.IsFinish)
            {
                this.finishedCount++;
                ChatBox.WriteLine(string.Format("{0} came in place {1}", player.Name, this.finishedCount), 0xffffff);

                player.Vehicle.Destroy();
                player.HasFinished = true;

                CheckForFinish();
            }
        }

        public void CheckForFinish()
        {
            if (!InProgress)
            {
                string message = string.Format("The race has ended, {0} players finished, {1} were disqualified!", this.finishedCount, this.disqualifiedCount);
                ChatBox.WriteLine(message, 0xffffff);
                Cleanup();
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

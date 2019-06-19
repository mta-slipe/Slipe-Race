using Slipe.MtaDefinitions;
using Slipe.Server.Game;
using Slipe.Server.Peds;
using Slipe.Server.Vehicles;
using Slipe.Shared.Elements;
using System;
using System.Collections.Generic;
using System.Text;

namespace ServerSide.Gamemode.Elements
{
    [DefaultElementClass(ElementType.Player)]
    public class RacePlayer : Player
    {
        public Vehicle Vehicle { get; set; }
        public bool HasFinished { get; set; }
        public Checkpoint LastCheckpointHit { get; set; }
        public Dictionary<Checkpoint, long> CheckpointTimes { get; set; }

        public long CheckpointScore
        {
            get
            {
                if (LastCheckpointHit == null)
                {
                    return 0;
                }
                return CheckpointTimes[LastCheckpointHit];
            }
        }

        public RacePlayer(MtaElement mtaElement) : base(mtaElement)
        {
            this.CheckpointTimes = new Dictionary<Checkpoint, long>();
        }

        public void WarpIntoVehicle()
        {
            WarpIntoVehicle(Vehicle);
        }

        public void HitCheckpoint(Checkpoint checkpoint)
        {
            this.LastCheckpointHit = checkpoint;
            this.CheckpointTimes[checkpoint] = GameServer.TickCount;
        }
    }
}

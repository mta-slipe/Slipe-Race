using Slipe.MtaDefinitions;
using Slipe.Server.Peds;
using Slipe.Server.Vehicles;
using Slipe.Shared.Elements;
using System;
using System.Collections.Generic;
using System.Text;

namespace ServerSide.GameMode.Elements
{
    [DefaultElementClass(ElementType.Player)]
    public class RacePlayer : Player
    {
        public Vehicle Vehicle { get; set; }
        public bool HasFinished { get; set; }
        public Dictionary<Checkpoint, long> CheckpointTimes { get; set; }

        public RacePlayer(MtaElement mtaElement) : base(mtaElement)
        {
            this.CheckpointTimes = new Dictionary<Checkpoint, long>();
        }

        public void WarpIntoVehicle()
        {
            WarpIntoVehicle(Vehicle);
        }
    }
}

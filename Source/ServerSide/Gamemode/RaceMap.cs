using ServerSide.Gamemode.Elements;
using ServerSide.GameMode;
using Slipe.MtaDefinitions;
using Slipe.Server.Game;
using Slipe.Server.IO;
using Slipe.Server.Resources;
using Slipe.Shared.Elements;
using System;
using System.Collections.Generic;
using System.Text;

namespace ServerSide.Gamemode
{
    class RaceMap : Resource
    {
        public RaceMap(string name) : base(name)
        {
        }

        public Race GetRace()
        {
            Console.WriteLine(this.State);
            if (this.State != "running")
            {
                return null;
            }

            List<Spawnpoint> spawnpoints = ElementManager.Instance.GetByType<Spawnpoint>();
            Race race = new Race(spawnpoints.ToArray());

            List<MapCheckpoint> checkpoints = ElementManager.Instance.GetByType<MapCheckpoint>();
            foreach(MapCheckpoint mapCheckpoint in checkpoints)
            {
                Checkpoint checkpoint = mapCheckpoint.GetCheckpoint();
                Console.WriteLine("{0}, {1}, {2}", checkpoint.Position.X, checkpoint.Position.Y, checkpoint.Position.Z);
                race.AddCheckpoint(checkpoint);
            }

            return race;
        }

        public void Start()
        {
            base.Start();
        }
    }
}

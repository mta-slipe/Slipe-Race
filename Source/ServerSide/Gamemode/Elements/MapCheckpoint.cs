using Slipe.MtaDefinitions;
using Slipe.Server.Vehicles;
using Slipe.Shared.Elements;
using System;
using System.Collections.Generic;
using System.Numerics;
using System.Text;

namespace ServerSide.Gamemode.Elements
{
    [DefaultElementClass("checkpoint")]
    public class MapCheckpoint: Element
    {
        public MapCheckpoint(MtaElement element) : base(element)
        {
        }

        public Checkpoint GetCheckpoint()
        {
            Vector3 position = new Vector3(
                float.Parse(GetData<string>("posX")),
                float.Parse(GetData<string>("posY")),
                float.Parse(GetData<string>("posZ"))
            );
            return new Checkpoint(position);
        }
    }
}

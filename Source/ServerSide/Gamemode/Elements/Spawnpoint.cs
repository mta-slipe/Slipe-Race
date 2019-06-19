using Slipe.MtaDefinitions;
using Slipe.Server.Vehicles;
using Slipe.Shared.Elements;
using System;
using System.Collections.Generic;
using System.Numerics;
using System.Text;

namespace ServerSide.Gamemode.Elements
{
    [DefaultElementClass("spawnpoint")]
    class Spawnpoint: Element
    {
        public Spawnpoint(MtaElement element): base(element)
        {

        }

        public Spawnpoint(Vector3 position) : base()
        {
            this.Position = position;
        }

        public Vector3 Position
        {
            get
            {
                float x = float.Parse(GetData("posX"));
                float y = float.Parse(GetData("posY"));
                float z = float.Parse(GetData("posZ"));

                return new Vector3(x, y, z);
            }
            set
            {
                SetData("posX", value.X);
                SetData("posY", value.Y);
                SetData("posZ", value.Z);
            }
        }

        public float Rotation
        {
            get
            {
                return float.Parse(GetData("rotation"));
            }
            set
            {
                SetData("rotation", value);
            }
        }

        public int VehicleModel
        {
            get
            {
                return Int32.Parse(GetData<string>("vehicle"));
            }
            set
            {
                SetData("vehicle", value);
            }
        }
    }
}

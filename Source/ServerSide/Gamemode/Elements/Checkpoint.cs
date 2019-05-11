using Slipe.MtaDefinitions;
using Slipe.Server.Elements;
using Slipe.Server.Markers;
using Slipe.Server.Radar;
using Slipe.Server.Vehicles;
using System;
using System.Collections.Generic;
using System.Numerics;
using System.Text;

namespace ServerSide.GameMode.Elements
{
    class Checkpoint: Marker
    {
        private Blip blip;
        private Checkpoint next;
        public Checkpoint Next
        {
            get => next;
            set
            {
                next = value;
                this.Target = next.Position;
            }
        }

        public bool IsFinish
        {
            get
            {
                return this.next == null;
            }
        }

        public Checkpoint(Vector3 position): base(position, Slipe.Shared.Markers.MarkerType.Checkpoint)
        {
            this.OnHit += HandleHit;
            this.SetVisibleTo(Root, false);

            this.blip = new Blip(this.Position, Slipe.Shared.Radar.BlipType.RunwayLight, 0xff0000, 2, 0, 16383, null);
            this.blip.SetVisibleTo(Root, false);
        }

        private void HandleHit(Slipe.Shared.Elements.PhysicalElement hitElement, bool matchingDimension)
        {
            if (! (hitElement is Vehicle))
            {
                return;
            }

            Vehicle vehicle = (Vehicle)hitElement;
            try
            {
                if (vehicle.Controler == null)
                {
                    return;
                }

                RacePlayer player = (RacePlayer)vehicle.Controler;
                if (!this.IsVisibleTo(player))
                {
                    return;
                }

                this.SetRaceVisibility(player, false, false);
                if (this.next != null)
                {
                    this.Next.SetRaceVisibility(player, true, true);
                }

                OnRacerHit?.Invoke(this, player);
            } catch (MtaException)
            {

            }
        }

        public void SetRaceVisibility(RacePlayer player, bool value, bool isNext)
        {
            if (value)
            {
                this.blip.SetVisibleTo(player, value);
                if (isNext)
                {
                    this.SetVisibleTo(player, value);
                    if (this.next != null)
                    {
                        this.next.SetRaceVisibility(player, value, false);
                    }
                }
            } else
            {
                this.SetVisibleTo(player, value);
                this.blip.SetVisibleTo(player, value);
            }
        }

        public override bool Destroy()
        {
            this.blip.Destroy();
            return base.Destroy();
        }

        public event Action<Checkpoint, RacePlayer> OnRacerHit;
    }
}

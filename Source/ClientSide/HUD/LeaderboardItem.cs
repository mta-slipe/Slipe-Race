using Slipe.Client.Dx;
using Slipe.Client.Elements;
using Slipe.Client.Peds;
using Slipe.Client.Rendering.Events;
using Slipe.Shared.Utilities;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Numerics;
using System.Text;

namespace ClientSide.HUD
{
    class LeaderboardItem : IDrawable
    {
        public Player Player { get; set; }
        public long Time { get; set; }
        public Vector2 Position { get; set; }
        public Vector2 Dimensions { get; set; }

        private Rectangle backgroundDrawable;
        private Text nameDrawable;
        private Text timeDrawable;

        public LeaderboardItem(Player player)
        {
            this.Player = player;

            this.backgroundDrawable = new Rectangle(Vector2.Zero, Vector2.Zero, new Color(255, 255, 255, 100), false, false);
            this.nameDrawable = new Text(Player.Name, Vector2.Zero, Vector2.Zero, Color.Black, new Vector2(2, 2), StandardFont.Default, HorizontalAlign.Left, VerticalAlign.Center, 0, Vector2.Zero, true, false, false, false);
            this.timeDrawable = new Text("", Vector2.Zero, Vector2.Zero, Color.White, new Vector2(2, 2), StandardFont.Default, HorizontalAlign.Right, VerticalAlign.Center, 0, Vector2.Zero, true, false, false, false);
        }

        private void UpdateDrawables()
        {
            backgroundDrawable.Position = Position;
            backgroundDrawable.Dimensions = Dimensions;

            nameDrawable.Position = backgroundDrawable.Position + new Vector2(20, 0);
            nameDrawable.BottomRight = nameDrawable.Position + backgroundDrawable.Dimensions - new Vector2(60, 0);
            nameDrawable.Content = Player.Name;

            timeDrawable.Position = nameDrawable.BottomRight - new Vector2(0, 40);
            timeDrawable.BottomRight = backgroundDrawable.Position + backgroundDrawable.Dimensions;
            timeDrawable.Color = Time > 0 ? Color.Red : Color.Green;
            timeDrawable.Content = (Time > 0 ? "+" : "") + Time.ToString();
        }

        public bool Draw(RootElement source, OnRenderEventArgs eventArgs)
        {
            UpdateDrawables();
            backgroundDrawable.Draw(source, eventArgs);
            nameDrawable.Draw(source, eventArgs);
            timeDrawable.Draw(source, eventArgs);

            return true;
        }
    }
}

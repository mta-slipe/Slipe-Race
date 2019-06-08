using ClientSide.RPCs;
using Slipe.Client.Dx;
using Slipe.Client.Elements;
using Slipe.Client.IO;
using Slipe.Client.Peds;
using Slipe.Client.Rendering;
using Slipe.Client.Rendering.Events;
using Slipe.Client.Rpc;
using Slipe.Shared.Elements;
using System;
using System.Collections.Generic;
using System.Numerics;
using System.Text;
using static Slipe.Client.Rendering.Renderer;

namespace ClientSide.HUD
{
    class RaceLeaderboard : IDrawable
    {
        private Player[] players;
        private Dictionary<Player, long> times;
        private Vector2 screenDimensions;
        private readonly Dictionary<Player, LeaderboardItem> playerItems;

        private readonly RenderTarget target;
        private readonly Image image;
        private readonly OnRenderHandler renderHandler;


        public RaceLeaderboard()
        {
            this.screenDimensions = Renderer.ScreenSize;
            RpcManager.Instance.RegisterRPC<LeaderboardRPC>("SlipeRace.UpdateLeaderboard", UpdateLeaderboard);

            this.target = new RenderTarget(this.screenDimensions, true);
            this.image = new Image(Vector2.Zero, this.screenDimensions, this.target);

            this.renderHandler = (RootElement source, OnRenderEventArgs eventArgs) => Draw(source, eventArgs);
            this.playerItems = new Dictionary<Player, LeaderboardItem>();
            this.players = new Player[] { };

            Show();
        }

        public void Show()
        {
            Renderer.OnRender += this.renderHandler;
        }

        public void Hide()
        {
            Renderer.OnRender -= this.renderHandler;
        }

        private void UpdateLeaderboard(LeaderboardRPC rpc)
        {
            this.players = rpc.players;
            this.times = new Dictionary<Player, long>();
            for (int i = 0; i < players.Length; i++)
            {
                this.times[this.players[i]] = rpc.times[i];
            }
            DrawToRenderTarget();
        }

        public void DrawToRenderTarget()
        {
            Renderer.SetRenderTarget(target, true);

            Vector2 margin = new Vector2(10, 10);
            Vector2 padding = new Vector2(0, 10);
            Vector2 itemDimensions = new Vector2(300, 40);
            Vector2 fullDimensions = (itemDimensions + padding) * new Vector2(1, players.Length);

            Vector2 topleft = this.screenDimensions - (fullDimensions + margin);

            for (int i = 0; i < players.Length; i++)
            {
                Player player = players[i];
                if (!playerItems.TryGetValue(player, out LeaderboardItem item))
                {
                    item = new LeaderboardItem(player);
                    playerItems[player] = item;
                }
                item.Position = topleft + i * (itemDimensions + padding);
                item.Dimensions = itemDimensions;
                item.Time = this.times[player] - this.times[Player.Local];
                item.Draw(null, null);
            }

            Renderer.RevertRenderTargetToScreen();
        }

        public bool Draw(RootElement source, OnRenderEventArgs eventArgs)
        {
            this.image.Draw(source, eventArgs);
            return true;
        }
    }
}

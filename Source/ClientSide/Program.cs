using ClientSide.HUD;
using Slipe.Client.Elements;
using Slipe.Client.IO;
using Slipe.Client.Peds;
using Slipe.Shared.Elements;

namespace ClientSide
{
    class Program
    {
        static void Main(string[] args)
        {
            new Program();
        }

        public Program()
        {
            LocalPlayer localPlayer = LocalPlayer.Instance;
            new RaceLeaderboard();
        }
    }
}

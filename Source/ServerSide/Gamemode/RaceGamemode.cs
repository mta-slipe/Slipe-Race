using ServerSide.GameMode.Elements;
using Slipe.Server.IO;
using Slipe.Server.Peds;
using Slipe.Shared.Elements;
using System;
using System.Collections.Generic;
using System.Numerics;
using System.Text;

namespace ServerSide.GameMode
{
    class RaceGamemode
    {
        private Race race;
        private List<RacePlayer> players;

        public RaceGamemode()
        {
            players = new List<RacePlayer>();

            Player.OnJoin += HandlePlayerJoin;
            foreach (Player player in ElementManager.Instance.GetByType<Player>(Element.Root))
            {
                HandlePlayerJoin(player);
            }

            StartDemoRace();
        }

        private void HandlePlayerJoin(Player player)
        {
            ChatBox.WriteLine(string.Format("Welcome to Slipe racing {0}!", player.Name), 0x00AA00);
            HandlePlayerJoin((RacePlayer)player);
        }

        private void HandlePlayerJoin(RacePlayer player)
        {
            players.Add(player);

            player.OnQuit += (Slipe.Shared.Peds.QuitType quitType, string reason, Player responsiblePlayer) =>
            {
                HandlePlayerQuit(player);
            };
        }

        private void HandlePlayerQuit(RacePlayer player)
        {
            players.Remove(player);
        }

        private void StartDemoRace()
        {
            race = new Race(new Vector3[]{
                new Vector3(0, 4, 3),
                new Vector3(0, 0, 3),
                new Vector3(0, -4, 3),
            });
            race.AddCheckpoint(new Checkpoint(new Vector3(25, 0, 3)));
            race.AddCheckpoint(new Checkpoint(new Vector3(25, 25, 3)));
            race.AddCheckpoint(new Checkpoint(new Vector3(0, 25, 3)));
            race.AddCheckpoint(new Checkpoint(new Vector3(0, 0, 3)));

            foreach (RacePlayer player in players)
            {
                race.AddRacer(player);
            }
            StartRace(race);
        }

        private void StartRace(Race race)
        {
            race.Start();
            race.OnEnd += () =>
            {
                this.race = null;
                StartNewRace();
            };
        }

        private void StartNewRace()
        {

        }
    }
}

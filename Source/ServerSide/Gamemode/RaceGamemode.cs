using ServerSide.Gamemode;
using ServerSide.Gamemode.Elements;
using Slipe.Server.IO;
using Slipe.Server.Peds;
using Slipe.Server.Vehicles;
using Slipe.Shared.Elements;
using System;
using System.Collections.Generic;
using System.Numerics;
using System.Text;
using System.Timers;

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
            foreach (RacePlayer player in ElementManager.Instance.GetByType<RacePlayer>())
            {
                HandlePlayerJoin(player);
            }

            Timer timer = new Timer()
            {
                Interval = 1250,
                AutoReset = false
            };
            //timer.Elapsed += (object sender, ElapsedEventArgs e) => StartDemoRace();
            timer.Elapsed += (object sender, ElapsedEventArgs e) => StartRace("race-suburbanspeedway");
            timer.Start();            
        }

        private void HandlePlayerJoin(Player source, Slipe.Server.Peds.Events.OnJoinEventArgs eventArgs)
        {
            ChatBox.WriteLine(string.Format("Welcome to Slipe racing {0}!", source.Name), source, 0x00AA00);
            HandlePlayerJoin((RacePlayer)source);
        }

        private void HandlePlayerJoin(RacePlayer player)
        {
            players.Add(player);

            player.OnQuit += HandlePlayerQuit;
        }

        private void HandlePlayerQuit(Player source, Slipe.Server.Peds.Events.OnQuitEventArgs eventArgs)
        {
            players.Remove((RacePlayer)source);
        }

        private void StartRace(string mapName)
        {
            RaceMap map = new RaceMap(mapName);
            map.Start();

            this.race = map.GetRace();
            for (int i = players.Count - 1; i >= 0; i--)
            {
                AddPlayerToRace(players[i], race);
            }
            StartRace(race);
        }


        private void StartDemoRace()
        {
            race = new Race(
                new Spawnpoint[] {
                    new Spawnpoint(new Vector3(0, 4, 3))
                    {
                        VehicleModel = VehicleModel.Cars.Alpha.Id,
                        Rotation = 0
                    },
                    new Spawnpoint(new Vector3(0, 0, 3))
                    {
                        VehicleModel = VehicleModel.Cars.Alpha.Id,
                        Rotation = 0
                    },
                    new Spawnpoint(new Vector3(0, -4, 3))
                    {
                        VehicleModel = VehicleModel.Cars.Alpha.Id,
                        Rotation = 0
                    },
                }
            );

            race.AddCheckpoint(new Checkpoint(new Vector3(25, 0, 3)));
            race.AddCheckpoint(new Checkpoint(new Vector3(25, 25, 3)));
            race.AddCheckpoint(new Checkpoint(new Vector3(0, 25, 3)));
            race.AddCheckpoint(new Checkpoint(new Vector3(0, 0, 3)));

            for (int i = players.Count - 1; i >= 0; i--)
            {
                AddPlayerToRace(players[i], race);
            }
            StartRace(race);
        }

        private void AddPlayerToRace(RacePlayer player, Race race)
        {
            this.race.AddRacer(player);
            this.players.Remove(player);
        }

        private void StartRace(Race race)
        {
            race.OnEnd += () =>
            {
                this.race = null;
                StartNewRace();
            };

            race.Start();
        }

        private void StartNewRace()
        {

        }
    }
}

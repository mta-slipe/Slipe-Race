﻿using System;
using System.Collections.Generic;
using System.Text;
using Slipe.MtaDefinitions;
using Slipe.Shared.Elements;
using Slipe.Server.Peds;
using ServerSide.Gamemode.Elements;
using Slipe.Shared.RPC;

namespace ServerSide.RPCs
{
    public class LeaderboardRPC: BaseRPC
    {
        public MtaElement[] players;
        public long[] times;

        public LeaderboardRPC(RacePlayer[] players, long[] times)
        {
            this.players = CreateElementArray(players);
            this.times = times;
        }
    }
}

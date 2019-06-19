using System;
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

        public MtaElement[] CreateElementArray(Element[] elements)
        {
            MtaElement[] mtaElements = new MtaElement[elements.Length];

            for (int i = 0; i < elements.Length; i++)
            {
                mtaElements[i] = elements[i].MTAElement;
            }

            return mtaElements;
        }

        public LeaderboardRPC(RacePlayer[] players, long[] times)
        {
            this.players = CreateElementArray(players);
            this.times = times;
        }
    }
}

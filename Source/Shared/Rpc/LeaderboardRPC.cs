using System;
using System.Collections.Generic;
using System.Text;
using Slipe.MtaDefinitions;
using Slipe.Shared.Elements;
using Slipe.Shared.Rpc;
using System.Runtime.CompilerServices;

namespace Shared.Rpc
{
    public class LeaderboardRPC: BaseRpc
    {
        public MtaElement[] players;
        public long[] times;

        public LeaderboardRPC()
        {

        }

        public LeaderboardRPC(Element[] players, long[] times)
        {
            this.players = CreateElementArray(players);
            this.times = times;
        }

        public override void Parse(dynamic value)
        {
            players = GetElementArray<Element>(value.players);
            times = MtaShared.GetArrayFromTable<long>(value.times, "System.Int64");
        }
    }
}

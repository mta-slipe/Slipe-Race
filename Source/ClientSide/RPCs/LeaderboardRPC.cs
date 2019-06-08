using Slipe.Client.Peds;
using System;
using System.Collections.Generic;
using System.Text;
using Slipe.MtaDefinitions;
using Slipe.Shared.Elements;
using Slipe.Shared.RPC;

namespace ClientSide.RPCs
{
    public class LeaderboardRPC
    {
        //public List<Player> players;
        public Player[] players;
        //public List<long> times;
        public long[] times;


        public T[] GetElementArray<T>(dynamic table) where T : Element
        {
            MtaElement[] mtaElements = Slipe.MtaDefinitions.MtaShared.GetArrayFromTable<MtaElement>(table, "");

            T[] elements = new T[mtaElements.Length];
            for (int i = 0; i < mtaElements.Length; i++)
            {
                elements[i] = ElementManager.Instance.GetElement<T>(mtaElements[i]);
            }
            return elements;
        }

        public LeaderboardRPC(dynamic data)
        {
            players = GetElementArray<Player>(data.players);

            //players = new List<Player>();
            //foreach(dynamic player in MtaShared.GetArrayFromTable<Player>(data.players, "Slipe.Client.Peds.Player"))
            //{
            //    players.Add((Player)ElementManager.Instance.GetElement(player));
            //}

            times = MtaShared.GetArrayFromTable<long>(data.times, "System.Int64");
        }
    }
}

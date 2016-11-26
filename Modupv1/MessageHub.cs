using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace Modupv1
{
    public class MessageHub : Hub
    {
        public void Send(string name, string message, string date, string attachment)
        {
            

            

            Clients.All.broadcast(name,message,date,attachment);

        }
    }
}
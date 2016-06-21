using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using System.Threading.Tasks;

namespace WebRole2
{
    public class WebRole : RoleEntryPoint
    {
        public override bool OnStart()
        {
            Task.Factory.StartNew(StartQuartzJob);
            return base.OnStart();
        }

        private void StartQuartzJob()
        {
            // Do work here.            
        }
    }
}

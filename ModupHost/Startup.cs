using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ModupHost.Startup))]
namespace ModupHost
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

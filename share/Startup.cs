using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(share.Startup))]
namespace share
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

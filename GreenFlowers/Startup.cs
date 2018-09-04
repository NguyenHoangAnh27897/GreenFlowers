using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GreenFlowers.Startup))]
namespace GreenFlowers
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

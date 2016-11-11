using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BTL_Zoo.Startup))]
namespace BTL_Zoo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

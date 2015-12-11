using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WidgetStore.Web.Startup))]
namespace WidgetStore.Web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

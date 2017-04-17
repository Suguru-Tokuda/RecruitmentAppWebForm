using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RecruitmentAppWebForm.Startup))]
namespace RecruitmentAppWebForm
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

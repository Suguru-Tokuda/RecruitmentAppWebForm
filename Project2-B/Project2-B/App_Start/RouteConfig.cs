using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using Microsoft.AspNet.FriendlyUrls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;

namespace Project2_B
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            // set up basic FriendlyUrls functionality
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Temporary;
            routes.EnableFriendlyUrls(settings, new MyUrlResolver());

            // map custom static routes for Customer Support
            routes.MapPageRoute("CustomerSupportRegisterProducts", "CustomerSupport/RegisterProducts", "~/RegisterProducts.aspx");
            routes.MapPageRoute("CustomerSupportCustomerSurvey", "CustomerSupport/CustomerSurvey", "~/CustomerSurvey.aspx");
            routes.MapPageRoute("CustomerSupportSurveyComplete", "CustomerSupport/SurveyComplete", "~/SurveyComplete.aspx");

            // map custom static routes for Technician Support
            routes.MapPageRoute("TechnicianSupportDisplayCustomerIncidents", "Tech/CustomerIncidentDisplay", "~/CustomerIncidentDisplay.aspx");
            routes.MapPageRoute("TechnicianSupportUpdateIncidents", "Tech/UpdateIncidents", "~/UpdateIncidents.aspx");

            // map custom static routes for Administration
            routes.MapPageRoute("AdministrationMaintainProducts", "Administration/MaintainProducts", "~/ProductMaintenance.aspx");
            routes.MapPageRoute("AdministrationMaintainCustomers", "Administration/CustomerMaintenance", "~/MaintainCustomers.aspx");
            routes.MapPageRoute("AdministrationMaintainTechnicians", "Administration/TechnicianMaintenance", "~/MaintainTechnicians.aspx");
            routes.MapPageRoute("AdministrationDisplayIncidents", "Administration/DisplayIncidents", "~/DisplayIncidents.aspx");
            routes.MapPageRoute("AdministrationDisplayCustomers", "Administration/DisplayCustomers", "~/DisplayCustomers.aspx");
            routes.MapPageRoute("AdministrationDisplayContact", "Administration/DisplayContacts", "~/ContactDisplay.aspx");
            routes.MapPageRoute("AdministrationDisplayIncidentsByTechnician", "Administration/DisplayIncidentsByTechnician", "~/DisplayIncidentsByTechnician.aspx");

        }

        public class MyUrlResolver : WebFormsFriendlyUrlResolver
        {
            protected override bool TrySetMobileMasterPage(HttpContextBase httpContext, Page page, string mobileSuffix)
            {
                return false;
            }

            //called when url is traditional(e.g. /RegisterProducts.aspx)
            public override string ConvertToFriendlyUrl(string path)
            {
                if (path.Contains("RegisterProducts") || path.Contains("CustomerSurvey") || path.Contains("SurveyComplete"))
                {
                    return "~/CustomerSupport" + path.Replace(".aspx", "");
                }
                else if (path.Contains("CustomerIncidentDisplay") || path.Contains("UpdateIncidents"))
                {
                    return "~/Tech" + path.Replace(".aspx", "");
                }
                else if (path.Contains("MaintainProducts") || path.Contains("MaintainCustomers") || path.Contains("MaintainTechnicians") || path.Contains("DisplayIncidents") || path.Contains("DisplayCustomers") || path.Contains("DisplayIncidentsByTechnician"))
                {
                    return "~/Administration" + path.Replace(".aspx", "");
                }
                return base.ConvertToFriendlyUrl(path);
            }

            public override void PreprocessRequest(HttpContextBase ctx, IHttpHandler hdlr)
            {
                string path = ctx.Request.CurrentExecutionFilePath;
                if (path.Contains("RegisterProducts") || path.Contains("CompleteCustomerSurvey") || path.Contains("SurveyComplete"))
                {
                    ctx.Response.Redirect("~/CustomerSupport" + path);
                }
                else if (path.Contains("CustomerIncidentDisplay") || path.Contains("UpdateIncidents"))
                {
                    ctx.Response.Redirect("~/Tech" + path);
                }
                else if (path.Contains("MaintainProducts") || path.Contains("MaintainCustomers") || path.Contains("MaintainTechnicians") || path.Contains("DisplayIncidents") || path.Contains("DisplayCustomers") || path.Contains("DisplayContacts") || path.Contains("DisplayIncidentsByTechnician"))
                {
                    ctx.Response.Redirect("~/Administration" + path);
                }
                base.PreprocessRequest(ctx, hdlr);
            }
        }


    }
}

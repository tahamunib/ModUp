using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Modupv1
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Browse",
                url: "{controller}/{action}/{page}/{budget}/{skill}/{q}",
                defaults: new { controller = "Developer", action = "Browse", page = UrlParameter.Optional,budget = UrlParameter.Optional,skill = UrlParameter.Optional,q = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "submitProposal",
                url: "{controller}/{action}/{id}/{page}",
                defaults: new { controller = "Developer", action = "submitProposal", id = UrlParameter.Optional, page = UrlParameter.Optional}
            );
            routes.MapRoute(
                name: "Download",
                url: "{controller}/{action}/{filename}",
                defaults: new { controller = "PM", action = "Download", filename = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Submission",
                url: "{controller}/{action}/{id}/{accept}/{modID}",
                defaults: new { controller = "PM", action = "Submission", id = UrlParameter.Optional ,accept = UrlParameter.Optional,modID = UrlParameter.Optional}
            );
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace RecruitmentAppWebForm.Models
{
    public class Administrator : User
    {
        static Administrator admin;
        public static void checkAdminLogin(Page page)
        {
            admin = (Administrator)HttpContext.Current.Session["admin"];
            if (user == null)
            {
                page.Session["admin.loggedIn"] = false;
            }
            else
            {
                if (user.loggedIn != false)
                {
                    page.Session["admin.loggedIn"] = true;
                }
            }
        }


    }
}
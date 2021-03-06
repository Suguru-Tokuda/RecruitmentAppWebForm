﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace RecruitmentAppWebForm.Models
{
    public class User
    {
        public static User user;
        public bool loggedIn { get; set; }

        public static void checkUserLogin(Page page, HttpResponse response)
        {
            user = (User)HttpContext.Current.Session["user"];
            if (user == null)
            {
                response.Redirect("/Default.aspx", false);
            }
            else
            {
                if (user.loggedIn != false)
                {
                    page.Session["loggedIn"] = true;
                }
            }
        }
    }
}
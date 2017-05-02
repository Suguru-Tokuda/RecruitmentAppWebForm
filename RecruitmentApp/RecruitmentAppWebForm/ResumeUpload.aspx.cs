using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm
{
    public partial class ResumeUpload : System.Web.UI.Page
    {
        Applicant applicant;
        protected void Page_Load(object sender, EventArgs e)
        {
            applicant = (Applicant)HttpContext.Current.Session["applicant"];
            if (applicant == null)
            {
                Session["loggedIn"] = false;
            }
            else
            {
                if (applicant.loggedIn != false)
                {
                    Session["loggedIn"] = true;
                }
            }
        }
    }
}
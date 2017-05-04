using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
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

        protected void resumeUploadBtn_Click(object sender, EventArgs e)
        {
            //get applicant_id from the session
            //int applicant_id = (int)HttpContext.Current.Session["applicant_id"];
            int applicant_id = 1000;
            //put data into the DB
            ResumesDB.uploadResume(resumeData, applicant_id);
        }
    }
}
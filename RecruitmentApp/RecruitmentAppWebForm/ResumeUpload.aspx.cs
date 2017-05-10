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
        protected void Page_Load(object sender, EventArgs e)
        {
            Models.User.checkUserLogin(Page);

            if (!IsPostBack)
            {
                int applicant_id = (int)HttpContext.Current.Session["applicant_id"];
                currentResumeName.Text = ResumesDB.getResumeName(applicant_id);
            }

        }

        protected void resumeUploadBtn_Click(object sender, EventArgs e)
        {
            //get applicant_id from the session
            int applicant_id = (int)HttpContext.Current.Session["applicant_id"];
            //int applicant_id = 1000;
            //put data into the DB
            ResumesDB.uploadResume(resumeData, applicant_id);
        }

        protected void currentResume_Click(object sender, EventArgs e)
        {

        }
    }
}
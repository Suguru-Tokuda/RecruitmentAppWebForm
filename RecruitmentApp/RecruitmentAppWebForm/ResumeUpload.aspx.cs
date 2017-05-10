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
            //Models.User.checkUserLogin(Page, Response);

            if (!IsPostBack)
            {
                int applicant_id = (int)HttpContext.Current.Session["applicant_id"];
                try {
                    currentResumeName.Text = ResumesDB.getResumeName(applicant_id);
                } catch (SqlException sqlEx)
                {
                    currentResumeName.Text = "";
                } catch (NullReferenceException nullEx)
                {
                    Response.Redirect("/Default.aspx", false);
                }

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
            int applicant_id = (int)HttpContext.Current.Session["applicant_id"];
            try
            {
                byte[] data = ResumesDB.retrieveResumeData(applicant_id);
                string fileName = ResumesDB.getResumeName(applicant_id);

                Response.Clear();
                Response.AddHeader("Cache-Control", "no-cache, must-revalidate, post-check=0, pre-check=0");
                Response.AddHeader("Pragma", "no-cache");
                Response.AddHeader("Content-Description", "File Download");
                Response.AddHeader("Content-Type", "application/force-download");
                Response.AddHeader("Content-Transfer-Encoding", "binary\n");
                Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
                Response.BinaryWrite(data);
                Response.End();
                //ResumesDB.getResume(applicant_id);
            } catch (SqlException sqlEx)
            {

            }
        }
    }
}
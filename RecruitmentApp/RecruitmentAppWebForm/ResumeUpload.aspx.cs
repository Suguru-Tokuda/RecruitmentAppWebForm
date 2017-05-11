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
            string resumeName = null;
            int applicant_id = 0;

            if (!IsPostBack)
            {
                applicant_id = (int)HttpContext.Current.Session["applicant_id"];
                try
                {
                    resumeExists.Text = "no";
                    resumeName = ResumesDB.getResumeName(applicant_id);

                    if (resumeName != null)
                    {
                        if (!resumeName.Equals(""))
                        {
                            resumeExists.Text = "yes";
                            currentResumeName.Text = resumeName;
                        }
                    }
                }
                catch (SqlException sqlEx)
                {
                    currentResumeName.Text = "";
                }
                catch (NullReferenceException nullEx)
                {
                    Response.Redirect("/Default.aspx", false);
                }
            }
            applicant_id = (int)HttpContext.Current.Session["applicant_id"];
            resumeName = ResumesDB.getResumeName(applicant_id);
        }

        protected void resumeUploadBtn_Click(object sender, EventArgs e)
        {
            string st = "SuguruTokudaResume.docx.docx";
            st.Replace(".docx", "");
            try
            {
                int applicant_id = (int)HttpContext.Current.Session["applicant_id"];
                ResumesDB.uploadResume(resumeData, applicant_id);
                this.Page_Load(sender, e);
            } catch (SqlException sqlEx)
            {
                msg.Text = "There was a Database error";
            } catch (NullReferenceException nullEx)
            {

            }

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
            }
            catch (SqlException sqlEx)
            {

            }
        }

        protected void deleteResume_Click(object sender, EventArgs e)
        {
            int applicant_id = (int)HttpContext.Current.Session["applicant_id"];
            try
            {
                ResumesDB.deleteResume(applicant_id);
                msg.Text = "Resume removed";
                msg.ForeColor = System.Drawing.Color.Green;
                currentResumeName.Text = "";
                this.Page_Load(sender, e);
            }
            catch (SqlException sqlEx)
            {
                msg.Text = "There was a Database error";
            }
        }

        protected void updateResumeBtn_Click(object sender, EventArgs e)
        {
            int applicant_id = (int)HttpContext.Current.Session["applicant_id"];
            try
            {
                ResumesDB.updateResume(resumeData, applicant_id);
                msg.Text = "Resume updated";
                msg.ForeColor = System.Drawing.Color.Green;
                currentResumeName.Text = resumeData.PostedFile.FileName;
                if (resumeData.PostedFile.FileName.IndexOf(".docx") != -1)
                {
                    currentResumeName.Text = resumeData.PostedFile.FileName.Replace(".docx", "");
                    currentResumeName.Text += ".docx";
                }
                this.Page_Load(sender, e);
            } catch (SqlException sqlEx)
            {
                msg.Text = "There was a Database error";
            }
        }
    }
}
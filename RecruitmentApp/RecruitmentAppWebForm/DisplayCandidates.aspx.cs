using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Word;
using System.Globalization;

namespace RecruitmentAppWebForm
{
    public partial class DisplayCandidates : System.Web.UI.Page
    {
        int applicantID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Models.User.checkUserLogin(Page, Response);
                
                jobDropDown.DataSource = JobsDB.getAllOpenJobs();
                jobDropDown.DataBind();
                Panel1.Visible = false;
                Session["job_id"] = jobDropDown.SelectedValue;
            }
        }

        protected void applicantID_Click(object sender, EventArgs e)
        {
            DataListCommandEventArgs f = (DataListCommandEventArgs)e;
            int index = f.Item.ItemIndex;
        }

        private void showApplicantDetails()
        {
            List<Applicant> list = new List<Applicant>();
            list.Add(ApplicantDB.getApplicant(applicantID));
            candidateDetails.DataSource = list;
            candidateDetails.DataBind();
            Panel1.Visible = true;
        }

        private void showResume()
        {

        }

        protected void applicantList_SelectedIndexChanged(object sender, EventArgs e)
        {
            applicantID = Convert.ToInt32(((System.Web.UI.WebControls.Label)applicantList.Items[applicantList.SelectedIndex].FindControl("applicantID")).Text);
            Session["applicant_id_for_interview"] = applicantID;
            this.showApplicantDetails();
            Panel1.Visible = true;
        }

        protected void jobDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["job_id"] = jobDropDown.SelectedValue;
            applicantList.DataSource = ApplicantDB.getApplicants(Convert.ToInt32(jobDropDown.SelectedValue));
            applicantList.DataBind();
            Panel1.Visible = false;

        }

        protected void chkInterview_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.CheckBox check = (System.Web.UI.WebControls.CheckBox)Page.FindControl("chkInterview");
            if (chkInterview.Checked)
            {
                
                string  date = txtCalendar.Text;
                 DateTime loadedDate = DateTime.ParseExact(date, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                int applicant_id = Convert.ToInt32(HttpContext.Current.Session["applicant_id_for_interview"]);
                int job_id = Convert.ToInt32(HttpContext.Current.Session["job_id"]);
                ApplicantDB.updateApplication(job_id, applicant_id, loadedDate);
                Models.Email.sendInterviewEmail(applicant_id, job_id, loadedDate);
                jobDropDown.DataSource = JobsDB.getAllOpenJobs();
                jobDropDown.DataBind();
                jobDropDown.SelectedIndex = 0;
                applicantList.DataSource = ApplicantDB.getApplicants(Convert.ToInt32(jobDropDown.SelectedValue));
                applicantList.DataBind();
                Panel1.Visible = false;



            }
        }


    }
}
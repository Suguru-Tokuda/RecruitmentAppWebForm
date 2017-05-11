using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm
{
    public partial class ExtendOffer : System.Web.UI.Page
    {
        int applicantID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                jobDropDown.DataSource = JobsDB.getAllOpenJobs();
                jobDropDown.DataBind();
                jobDropDown.SelectedIndex = 0;
                applicantList.DataSource = ApplicantDB.getApplicants(Convert.ToInt32(jobDropDown.SelectedValue));
                Session["job_id"] = jobDropDown.SelectedValue;
                applicantList.DataBind();
                offerBtn.Visible = false;
            }
        }

        protected void applicantID_Click(object sender, EventArgs e)
        {
            DataListCommandEventArgs f = (DataListCommandEventArgs)e;
            int index = f.Item.ItemIndex;
        }

        protected void jobDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["job_id"] = jobDropDown.SelectedValue;
            applicantList.DataSource = ApplicantDB.getApplicants(Convert.ToInt32(jobDropDown.SelectedValue));
            applicantList.DataBind();
            offerBtn.Visible = false;
        }

        private void showApplicantDetails()
        {
            List<Applicant> list = new List<Applicant>();
            list.Add(ApplicantDB.getApplicant(applicantID));
            candidateDetails.DataSource = list;
            candidateDetails.DataBind();
        }

        protected void extendOfferClick(object sender, EventArgs e)
        {
            int applicant_id = Convert.ToInt32(HttpContext.Current.Session["applicant_id_for_offer"]);
            int job_id = Convert.ToInt32(HttpContext.Current.Session["job_id"]);

            Email.sendOfferEmail(applicant_id, job_id);
            JobsDB.closeJob(job_id);
            jobDropDown.DataSource = JobsDB.getAllOpenJobs();
            jobDropDown.DataBind();
            jobDropDown.SelectedIndex = 0;
            applicantList.DataSource = ApplicantDB.getApplicants(Convert.ToInt32(jobDropDown.SelectedValue));
            applicantList.DataBind();
            offerBtn.Visible = false;
        }

        protected void applicantList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            applicantID = Convert.ToInt32(((System.Web.UI.WebControls.Label)applicantList.Items[applicantList.SelectedIndex].FindControl("applicantID")).Text);
            Session["applicant_id_for_offer"] = applicantID;
            this.showApplicantDetails();
            offerBtn.Visible = true;
        }
    }
}

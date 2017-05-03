using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm
{
    public partial class DisplayCandidates : System.Web.UI.Page
    {
        Applicant applicant;
        int applicantID;

        protected void Page_Load(object sender, EventArgs e)
        {
            applicant = (Applicant)HttpContext.Current.Session["applicant"];
            if (applicant == null)
            {
                Session["loggedIn"] = true;
            }
            else
            {
                if (applicant.loggedIn != false)
                {
                    Session["loggedIn"] = true;
                }
            }

            //int job_id = (int)HttpContext.Current.Session["job_id"];

            jobTitle.Text = JobsDB.getJobTitle(1);

            applicantList.DataSource = ApplicantDB.getApplicants(1);
            applicantList.DataBind();

        }

        protected void applicantID_Click(object sender, EventArgs e)
        {
            DataListCommandEventArgs f = (DataListCommandEventArgs)e;
            int index = f.Item.ItemIndex;

            //int index = (int)applicantList.SelectedValue;
            
            //Control id = applicantList.Items[applicantList.SelectedIndex].FindControl("applicantID");
            //Session["applicant_id"] = Convert.ToInt32(applicantList.Items[applicantList.SelectedIndex].FindControl("applicantID"));
        }

        private void showApplicantDetails()
        {
            List<Applicant> list = ApplicantDB.getApplicant(applicantID);
            candidateDetails.DataSource = list;
            candidateDetails.DataBind();
        }

        protected void applicantList_SelectedIndexChanged(object sender, EventArgs e)
        {
            applicantID = Convert.ToInt32(((System.Web.UI.WebControls.Label)applicantList.Items[applicantList.SelectedIndex].FindControl("applicantID")).Text);
        }
    }
}
using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Word;

namespace RecruitmentAppWebForm
{
    public partial class DisplayCandidates : System.Web.UI.Page
    {
        int applicantID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Models.User.checkUserLogin(Page);

                jobDropDown.DataSource = JobsDB.getAllOpenJobs();
                jobDropDown.DataBind();
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
        }

        private void showResume()
        {

        }

        protected void applicantList_SelectedIndexChanged(object sender, EventArgs e)
        {
            applicantID = Convert.ToInt32(((System.Web.UI.WebControls.Label)applicantList.Items[applicantList.SelectedIndex].FindControl("applicantID")).Text);
            this.showApplicantDetails();
        }

        protected void jobDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = jobDropDown.SelectedIndex;

            applicantList.DataSource = ApplicantDB.getApplicants(index);
            applicantList.DataBind();

        }
    }
}
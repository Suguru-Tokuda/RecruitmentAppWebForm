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
            this.showApplicantDetails();
        }

        protected void jobDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
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
   

            }
        }


    }
}
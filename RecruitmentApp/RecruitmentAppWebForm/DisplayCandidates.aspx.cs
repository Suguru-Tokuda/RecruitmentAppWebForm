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
            List<Applicant> list = new List<Applicant>();
            list.Add(ApplicantDB.getApplicant(applicantID));
            candidateDetails.DataSource = list;
            //candidateDetails.DataSource = ApplicantDB.getApplicant(applicantID);
            candidateDetails.DataBind();
        }

        private void showResume()
        {
            
        }

        //private void ConvertHTMLFromWord(object Source, object Target)
        //{
        //    if (Word == null)                         // Check for the prior instance of the OfficeWord Object
        //        Word = new Microsoft.Office.Interop.Word.ApplicationClass();

        //    try
        //    {
        //        // To suppress window display the following code will help
        //        Word.Visible = false;
        //        Word.Application.Visible = false;
        //        Word.WindowState = Microsoft.Office.Interop.Word.WdWindowState.wdWindowStateMinimize;



        //        Word.Documents.Open(ref Source, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown);

        //        object format = Microsoft.Office.Interop.Word.WdSaveFormat.wdFormatHTML;

        //        Word.ActiveDocument.SaveAs(ref Target, ref format, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown, ref Unknown);

        //        Status = StatusType.SUCCESS;
        //        Message = Status.ToString();
        //    }
        //    catch (Exception e)
        //    {
        //        Message = "Error :" + e.Message.ToString().Trim();
        //    }
        //    finally
        //    {
        //        if (Word != null)
        //        {
        //            Word.Documents.Close(ref Unknown, ref Unknown, ref Unknown);
        //            Word.Quit(ref Unknown, ref Unknown, ref Unknown);
        //        }
        //    }
        //}

        protected void applicantList_SelectedIndexChanged(object sender, EventArgs e)
        {
            applicantID = Convert.ToInt32(((System.Web.UI.WebControls.Label)applicantList.Items[applicantList.SelectedIndex].FindControl("applicantID")).Text);
            this.showApplicantDetails();
        }
    }
}
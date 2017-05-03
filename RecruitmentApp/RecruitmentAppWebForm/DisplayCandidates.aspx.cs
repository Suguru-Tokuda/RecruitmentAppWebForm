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
        protected void Page_Load(object sender, EventArgs e)
        {
            int job_id = (int)HttpContext.Current.Session["job_id"];

            jobTitle.Text = JobsDB.getJobTitle(job_id);

            applicantsListView.DataSource = ApplicantDB.getApplicants(job_id);
            applicantsListView.DataBind();

        }









    }
}
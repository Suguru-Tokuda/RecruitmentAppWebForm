using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Job> jobList = new List<Job>();
            jobList = (List<Job>)Session["jobList"];
            lstViewJobs.DataSource = jobList;
            lstViewJobs.DataBind();

        }


    }
}
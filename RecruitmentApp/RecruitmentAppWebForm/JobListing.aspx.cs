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
            frmViewJobs.DataSource = null;
            frmViewJobs.DataSource = jobList;
            frmViewJobs.DataBind();


        }
        protected void searchJobs(object sender, EventArgs e)
        {
            string keywordsString = keywords.Text;
            string[] keywordsArray;

            Session["keywords"] = keywordsString;
            Session["location"] = location.Text;

            //Splits String into string array
            if (keywordsString.IndexOf(" ") != -1)
            {
                keywordsArray = keywordsString.Split(' ');
            }
            else if ((keywordsString == "") || (keywordsString.Trim() == ""))
            {
                //Do nothing if we have empty string
                keywordsArray = new string[0];
            }
            else
            {
                keywordsArray = new string[1];
                keywordsArray[0] = keywordsString;
            }


            List<Job> jobList = JobsDB.searchJobs(keywordsArray, location.Text);

            if (jobList.Count() != 0)
            {
                Session["jobList"] = jobList;
                Response.Redirect("JobListing.aspx", false);
            }
            else
            {
                sqlErrorMessage.Text = "No result";
            }

        }


    }
}
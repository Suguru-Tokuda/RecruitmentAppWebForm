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
            lstViewJobs.DataSource = null;
            lstViewJobs.DataSource = jobList;
            lstViewJobs.DataBind();
            int a = lstViewJobs.SelectedIndex;



        }

        
        protected void searchJobs(object sender, EventArgs e)
        {
          
            string keywordsString = keywords.Text.Trim();
            string[] keywordsArray;

            Session["keywords"] = keywordsString;
            Session["location"] = location.Text;
            Session["job_id"] = 1;

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
                sqlErrorMessage.Text = "No results";
            }

        }

        protected void lstViewJobs_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {
            if (lstViewJobs.SelectedIndex != -1)
            {
                lstViewJobs.SelectedIndex = e.NewSelectedIndex;
                int index = lstViewJobs.SelectedIndex;
                string id = lstViewJobs.SelectedDataKey.Value.ToString();
                Session["job_id"] = id;
                //int myId = Convert.ToInt32(lstViewJobs.Items[lstViewJobs.SelectedIndex].FindControl("jobID"));

            }
           

        }
    }
}
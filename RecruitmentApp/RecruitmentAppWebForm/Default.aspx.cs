using Microsoft.AspNet.Identity;
using RecruitmentAppWebForm.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Models.User.checkUserLogin(this.Page);
            Session["applicant_id"] = ApplicantDB.getRegisteredApplicant(Context.User.Identity.GetUserName());
        }

        protected void searchJobs(object sender, EventArgs e)
        {
            string keywordsString = keywords.Text;
            string[] keywordsArray;

            Session["keywords"] = keywordsString.Trim();
            Session["location"] = location.Text;

            //Splits String into string array
            if (keywordsString.IndexOf(" ") != -1)
            {
                keywordsArray = keywordsString.Split(' ');
            } else if((keywordsString=="") || (keywordsString.Trim() == ""))
            {
                //Do nothing if we have empty string
                keywordsArray =  new string[0];
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
            } else
            {
                sqlErrorMessage.Text = "No result";
            }
            
        }





    }
}
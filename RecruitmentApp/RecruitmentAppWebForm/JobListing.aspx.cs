using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
            lblApplication.Visible = false;



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
                Session["job_id"] = Convert.ToInt32(id);
                //int myId = Convert.ToInt32(lstViewJobs.Items[lstViewJobs.SelectedIndex].FindControl("jobID"));

            }
           

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            //if (Session["applicant_id"] != null)
            //{

            //}
            int job_id = (int)Session["job_id"];
            int applicant_id = (int)Session["applicant_id"];
            lblApplication.Visible = true;
            insertApplication(job_id, applicant_id);
        }

        private void insertApplication(int job_id, int applicant_id)
        {
            string sql = "INSERT INTO applications VALUES (@job_id, @applicant_id, NULL, NULL)";
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("job_id", job_id);
                    cmd.Parameters.AddWithValue("applicant_id", applicant_id);
                    int result = cmd.ExecuteNonQuery();
                }
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }
    }
}
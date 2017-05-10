using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm.Account
{
    public partial class Profile : System.Web.UI.Page
    {
        int applicant_id;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Models.User.checkUserLogin(Page, Response);
            Applicant applicant;
            
            if (!IsPostBack)
            {
                //get the applicant_id from the session.
                applicant_id = Convert.ToInt32(HttpContext.Current.Session["applicant_id"].ToString());
                //if the ID isn't null it process
                if (applicant_id != 0)
                {
                    applicant = ApplicantDB.getApplicant(applicant_id);
                    firstName.Text = applicant.first_name;
                    lastName.Text = applicant.last_name;
                    phone.Text = applicant.phone;
                    email.Text = applicant.email;
                    street.Text = applicant.street;
                    city.Text = applicant.city;
                    state.Text = applicant.state;
                    zip.Text = applicant.zip;
                    skills.Text = applicant.skills;
                    preference.Text = applicant.preference;
                    currentSalary.Text = applicant.current_salary.ToString();
                    desiredSalary.Text = applicant.desired_salary.ToString();
                    //applicantList.Add(applicant);
                    //applicantFormView.DataSource = applicantList;
                    //applicantFormView.DataBind();
                }
            }

        }

        protected void updateProfile(object sender, EventArgs e)
        {
            try
            {
                ApplicantDB.updateApplicant(applicant_id, firstName.Text, lastName.Text, phone.Text, email.Text, street.Text, city.Text, zip.Text, skills.Text, preference.Text, Convert.ToInt32(currentSalary.Text), Convert.ToInt32(desiredSalary.Text));
                updateMsg.Text = "Profile updated";
                updateMsg.ForeColor = System.Drawing.Color.Green;
            } catch (SqlException sqlEx)
            {
                updateMsg.Text = sqlEx.ToString();
            }


        }

    }
}
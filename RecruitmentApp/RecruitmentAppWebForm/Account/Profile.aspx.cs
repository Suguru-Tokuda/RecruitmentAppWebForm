using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm.Account
{
    public partial class Profile : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {

            Applicant applicant;
            applicant = (Applicant)HttpContext.Current.Session["applicant"];
            if (applicant == null)
            {
                Session["loggedIn"] = false;
            }
            else
            {
                if (applicant.loggedIn != false)
                {
                    Session["loggedIn"] = true;
                }
            }

            //Applicant applicant;
            List<Applicant> applicantList = new List<Applicant>(1);
            //get the applicant_id from the session.
            //int applicant_id = (int)HttpContext.Current.Session["applicant_id"];
            //if the ID isn't null it process
            //if (applicant_id != 0)
            //{
                applicant = ApplicantDB.getApplicant(1);
                applicantList.Add(applicant);
                applicantFormView.DataSource = applicantList;
                applicantFormView.DataBind();
            //}


            
        }
    }
}
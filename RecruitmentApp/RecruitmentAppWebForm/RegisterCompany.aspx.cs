using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm
{
    public partial class RegisterCompany : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                sqlErrorMsg.Text = "";
                state.SelectedIndex = 0;
            }
        }

        protected void registerCompanyBtn_Click(object sender, EventArgs e)
        {
            if (CompanyDB.confirmCompanyExists(companyName.Text))
            {
                CompanyDB.registerCompany(companyName.Text, street.Text, city.Text, zip.Text);
                Response.Redirect("/RegisterJob.aspx", false);
            } else
            {
                sqlErrorMsg.Text = "Company name already exists";
            }
            

        }
    }
}
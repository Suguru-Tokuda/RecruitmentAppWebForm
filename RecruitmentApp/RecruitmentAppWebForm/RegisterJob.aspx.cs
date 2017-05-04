using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm
{
    public partial class RegisterJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Models.User.checkUserLogin(this.Page);
            companyList.DataSource = CompanyDB.getAllCompanies();
            companyList.DataBind();
            industry.DataSource = this.getIndustries();
            industry.DataBind();
            jobLevel.DataSource = this.getJobLevels();
            jobLevel.DataBind();
            if (!this.IsPostBack)
            this.companyName.Enabled = false;
        }

        protected List<string> getIndustries()
        {
            List<string> industries = new List<string>();
            industries.Add("--Select industry--");
            industries.Add("Agriculture, Forestry, Fishing");
            industries.Add("Mining");
            industries.Add("Manufacturing");
            industries.Add("Electricity, Gas, Water, Waste Services");
            industries.Add("Construction");
            industries.Add("Wholesale Trade");
            industries.Add("Retail Trade");
            industries.Add("Accommodation and Food Services");
            industries.Add("Transport, Postal and Warehousing");
            industries.Add("Information Media and Telecommunications");
            industries.Add("Financial and Insurance Services");
            industries.Add("Rental, Hiring and Real Estate Services");
            industries.Add("Professional, Scientific, Technical Services");
            industries.Add("Administrative and Support Services");
            industries.Add("Public Administration and Safety");
            industries.Add("Education and Training");
            industries.Add("Health Care and Social Assistance");
            industries.Add("Arts and Recreation Services");
            industries.Add("Other Services");
            return industries;
        }

        private List<string> getJobLevels()
        {
            List<string> jobLevels = new List<string>();
            jobLevels.Add("--Select job level--");
            jobLevels.Add("Entry");
            jobLevels.Add("Experienced");
            jobLevels.Add("Manager");
            jobLevels.Add("Executive");
            return jobLevels;
        }



        protected void companyNotInList_CheckedChanged(object sender, EventArgs e)
        {
            if (companyName.Enabled == false)
            {
                companyName.Enabled = true;
                companyList.Enabled = false;
            } else if (companyName.Enabled == true)
            {
                companyName.Enabled = false;
                companyList.Enabled = true;
            }
            
        }

        protected void registerCompanyBtn_Click(object sender, EventArgs e)
        {

        }
    }
}
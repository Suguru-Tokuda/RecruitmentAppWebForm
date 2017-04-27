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

        }

        protected void searchJobs(object sender, EventArgs e)
        {
            JobsDB jobsDB = new JobsDB();

            string keywordsString = keywords.Text;
            string[] keywordsArray = keywordsString.Split(' ');

            



            jobsDB.


        }





    }
}
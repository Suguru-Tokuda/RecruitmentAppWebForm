using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitmentAppWebForm.Models
{
    public class Applicant : User
    {
        public int applicant_id { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string street { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string zip { get; set; }
        public string skills { get; set; }
        public string preference { get; set; }
        public int current_salary { get; set; }
        public int desired_salary { get; set; }
        public string password { get; set;}

    }
}
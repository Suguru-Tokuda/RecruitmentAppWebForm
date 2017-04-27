using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitmentAppWebForm.Models
{
    public class Job
    {
        public int job_id { get; set; }
        public int company_id { get; set; }
        public string company_name { get; set; }
        public string position { get; set; }
        public string category { get; set; }
        public string zip { get; set; }
        public int emp_id { get; set; }
        public int salary_min { get; set; }
        public int salary_max { get; set; }
        public string level { get; set; }
        public string description { get; set; }
        public string responsibility { get; set; }
        public string qualification { get; set; }
        public DateTime posting_date { get; set; }
        public bool filled { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitmentAppWebForm.Models
{
    public class Company
    {
        public int company_id { get; set; }
        public string company_name { get; set; }
        public string street { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string zip { get; set; }
    }
}
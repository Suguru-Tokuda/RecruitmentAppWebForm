using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitmentAppWebForm.Models
{
    public class Application
    {
        public int job_id { get; set; }
        public int applicant_id { get; set; }
        public DateTime interview_date { get; set; }
        public int resume_id { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitmentAppWebForm.Models
{
    public class Resume
    {
        public int resume_id { get; set; }
        public int applicant_id { get; set; }
        public string title { get; set; }
        public Byte data { get; set; }
    }
}
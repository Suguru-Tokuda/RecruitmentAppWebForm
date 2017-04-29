using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2_B.Models
{
    public class Technician
    {
        public int TechID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set;  }
        public byte[] RowVersion { get; set; }
    }
}
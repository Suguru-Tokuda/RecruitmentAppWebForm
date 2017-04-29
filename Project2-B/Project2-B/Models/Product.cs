using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2_B.Models
{
    public class Product
    {
        public string productCode { get; set; }
        public string name { get; set; }
        public decimal version { get; set;  }
        public DateTime releaseDate { get; set; }
    }
}
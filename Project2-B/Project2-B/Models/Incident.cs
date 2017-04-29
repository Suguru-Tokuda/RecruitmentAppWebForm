using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2_A.Models
{
    public class Incident
    {
        //Constructor with arguments
        public Incident(int incidentID, int customerID, string productCode, int techID, DateTime dateOpened, DateTime dateClosed, string title, string description)
        {
            this.incidentID = incidentID;
            this.customerID = customerID;
            this.productCode = productCode;
            this.techID = techID;
            this.dateOpened = dateOpened;
            this.dateClosed = dateClosed;
            this.title = title;
            this.description = description;
        }

        //Default constructor
        public Incident() { }

        public int incidentID { get; set; }
        public int customerID { get; set; }
        public string productCode { get; set; }
        public int techID { get; set; }
        public DateTime dateOpened { get; set; }
        public DateTime dateClosed { get; set; }
        public string title { get; set; }
        public string description { get; set; }

        public string customerIncidentDisplay()
        {
           return "Incident for product " + productCode + " closed " + dateClosed + " (" + title + ")";
        }

    }


}
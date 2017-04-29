using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2_A.Models
{
    public class Survey
    {

        public int customerID { get; set; }
        public int incidentID { get; set; }
        public int responseTime { get; set; }
        public int techEfficiency { get; set; }
        public int resolution { get; set; }
        public string comments { get; set; }
        public bool contact { get; set; }
        public string contactBy { get; set; }

        //Default constructor
        public Survey() { }

        //Constrcutor w/ arguments
        public Survey(int customerID, int incidentID, int responseTime, int techEfficiency, int resolution, string comments, bool contact, string contactBy)
        {
            this.customerID = customerID;
            this.incidentID = incidentID;
            this.responseTime = responseTime;
            this.techEfficiency = techEfficiency;
            this.resolution = resolution;
            this.comments = comments;
            this.contact = contact;
            this.contactBy = contactBy;
        }

        public static Survey getSurvey()
        {
            Survey survey = (Survey)HttpContext.Current.Session["survey"];
            if (survey == null)
            {
                HttpContext.Current.Session["survey"] = new Survey();
            }
            return (Survey)HttpContext.Current.Session["survey"];
        }

        public static void submitSurvey(Survey survey)
        {
            HttpContext.Current.Session["survey"] = survey;
        }
    }
}
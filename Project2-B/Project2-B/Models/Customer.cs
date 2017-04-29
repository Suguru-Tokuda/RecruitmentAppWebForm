using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project1_B.Models
{
    public class Customer
    {
        //Constructor
        public Customer(int customerID, string name, string address, string city, string state, string zipCode, string phone, string email)
        {
            this.customerID = customerID;
            this.name = name;
            this.address = address;
            this.city = city;
            this.state = state;
            this.zipCode = zipCode;
            this.phone = phone;
            this.email = email;
        }

        //Default constructor
        public Customer() { }

        public int customerID { get; set; }
        public string name { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string zipCode { get; set; }
        public string phone { get; set; }
        public string email { get; set; }

    }

}
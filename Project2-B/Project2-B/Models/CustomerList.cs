using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project1_B.Models
{
    public class CustomerList
    {
        public List<Customer> customerList;

        //constructor
        public CustomerList()
        {
            customerList = new List<Customer>();
        }

        public int count
        {
            get { return customerList.Count; }
        }

        public Customer this[int index]
        {
            get { return customerList[index]; }
        }

        public Customer this[string name]
        {
            get
            {
                foreach (Customer c in customerList)
                    if (c.name == name) return c;
                return null;
            }
        }
 
        public static CustomerList getCustomerList()
        {
            CustomerList customerList
                = (CustomerList)HttpContext.Current.Session["customerList"];
            if (customerList == null)
            {
                HttpContext.Current.Session["customerList"] = new CustomerList();
            }
            return (CustomerList)HttpContext.Current.Session["customerList"];
        }

        public void addItem(Customer customer)
        {
            customerList.Add(customer);
        }

        public void removeAt(int index)
        {
            customerList.RemoveAt(index);

        }

        public void clear()
        {
            customerList.Clear();
        }

    }
}
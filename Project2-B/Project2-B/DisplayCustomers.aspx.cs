using Project1_B.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project2_B
{
    public partial class DisplayCustomers : System.Web.UI.Page
    {
        private Customer selectedCustomer;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) customers.DataBind();

            selectedCustomer = this.getSelectedCustomer();
            address.Text = selectedCustomer.address + "\n" + selectedCustomer.city + ", " + selectedCustomer.state + " " + selectedCustomer.zipCode;
            phone.Text = selectedCustomer.phone;
            email.Text = selectedCustomer.email;
        }

        private Customer getSelectedCustomer()
        {
            //get row from SqlDataSource based on value in in drop-down list
            DataView customersTable = (DataView)
                SqlCustomerDataSource.Select(DataSourceSelectArguments.Empty);
            customersTable.RowFilter =
                "customerID = '" + customers.SelectedValue + "'";
            DataRowView row = customersTable[0];

            //create a new product object and load with data from row
            Customer customer = new Customer();
            customer.customerID = Int32.Parse(row["customerID"].ToString());
            customer.name = row["name"].ToString();
            customer.address = row["address"].ToString();
            customer.city = row["city"].ToString();
            customer.state = row["state"].ToString();
            customer.phone = row["phone"].ToString();
            customer.email = row["email"].ToString();
            return customer;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //get cart from session and selected customer from list
                CustomerList customerList = CustomerList.getCustomerList();
                Customer customer = customerList[selectedCustomer.name];

                //if customer isn't in customerList, add it
                if (customer == null)
                {
                    customerList.addItem(selectedCustomer);
                    Response.Redirect("/Administration/DisplayContacts", false);
                }
                else
                {
                    contactAlreadyExistsMsg.Text = "The customer alread exists in the list";
                }
            }
        }

        protected void btnDisplay_Click(object sender, EventArgs e)
        {

        }
    }
}
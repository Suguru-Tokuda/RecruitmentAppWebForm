using Project1_B.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project2_B
{
    public partial class ContactDisplay : System.Web.UI.Page
    {
        private CustomerList customerList;

        protected void Page_Load(object sender, EventArgs e)
        {
            customerList = CustomerList.getCustomerList();
            if (!IsPostBack)
            {
                this.displayList();
            }
        }

        private void displayList()
        {
            cusList.Items.Clear();
            Customer customer;
            for (int i = 0; i < customerList.count; i++)
            {

                customer = customerList[i];
                cusList.Items.Add(customer.name + ": " + customer.phone + "; " + customer.email);
            }

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (customerList.count > 0)
            {
                if (cusList.SelectedIndex > -1)
                {
                    customerList.removeAt(cusList.SelectedIndex);
                    this.displayList();
                }
                else
                {
                    lblMessage.Text = "Please select a customer contact you want to remove";
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (customerList.count > 0)
            {
                customerList.clear();
                this.displayList();
            }
            else
            {
                lblMessage.Text = "The list is already empty";
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Administration/DisplayCustomers", false);
        }
    }
}
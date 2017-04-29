using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project2_B
{
    public partial class MaintainCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.EnableViewState = false;
        }

        protected void customerDetailsViewItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {

                sqlErrorMessage.Text = e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                sqlErrorMessage.Text = "error message you created";
            }
            else
            {
                customerGridView.DataBind();
            }
        }

        protected void customerDetailsViewItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {

                sqlErrorMessage.Text = e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                sqlErrorMessage.Text = "error message you created";
            }
            else
            {
                customerGridView.DataBind();
            }
        }

        protected void customerDetailsViewItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {

                sqlErrorMessage.Text = e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                sqlErrorMessage.Text = "error message you created";
            }
            else
            {
                customerGridView.DataBind();
            }
        }
    }
}
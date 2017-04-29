using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project2_B
{
    public partial class MaintainTechnicians : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void itemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {

                sqlErrorMessage.Text = e.Exception.Message; 
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                sqlErrorMessage.Text = "error message you created";
            } else
            {
                technicianName.DataBind();
            }
        }

        protected void itemInserted(object sender, FormViewInsertedEventArgs e)
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
                technicianName.DataBind();
            }
            
        }

        protected void itemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            technicianName.DataBind();
        }
    }
}
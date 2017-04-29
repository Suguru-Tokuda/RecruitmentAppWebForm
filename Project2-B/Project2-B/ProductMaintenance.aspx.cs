using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project2_B
{
    public partial class ProductMaintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.EnableViewState = false;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["productCode"].DefaultValue = productCode.Text;
                parameters["name"].DefaultValue = productName.Text;
                parameters["version"].DefaultValue = version.Text;
                parameters["releaseDate"].DefaultValue = releaseDate.Text;

                try
                {
                    SqlDataSource1.Insert();
                    productCode.Text = "";
                    productName.Text = "";
                    version.Text = "";
                    releaseDate.Text = "";
                }
                catch (Exception ex)
                {
                    sqlErrorMsg.Text = "A problem with inserting data into the table";
                }
            }
            //if (IsValid)
            //{
            //    var parameters = ProductDataSource1.InsertParameters;
            //    parameters["productCode"].DefaultValue = productCode.Text;
            //    parameters["name"].DefaultValue = productName.Text;
            //    parameters["version"].DefaultValue = version.Text;
            //    parameters["releaseDate"].DefaultValue = releaseDate.Text;

            //    try
            //    {
            //        ProductDataSource1.Insert();
            //        productCode.Text = "";
            //        productName.Text = "";
            //        version.Text = "";
            //        releaseDate.Text = "";
            //    } catch (Exception ex)
            //    {
            //        lblErrorMessage.Text = "A problem with inserting data into the table";
            //    }
            //}
        }
    }
}
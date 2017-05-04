using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm
{
    public partial class TestIframe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var bytes = System.IO.File.ReadAllBytes(Server.MapPath("~/Images/sampleResume.jpg"));
            Response.ContentType = "image/jpeg";
            Response.AddHeader("Content-disposition", "inline");
            Response.BinaryWrite(bytes.ToArray());
        }
    }
}
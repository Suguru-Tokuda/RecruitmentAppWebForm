using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm.Models
{
    public class ResumesDB
    {

        public static void uploadResume(FileUpload resumeData, string applicant_id)
        {
            string title = Path.GetFileName(resumeData.PostedFile.FileName);
            string contentType = resumeData.PostedFile.ContentType;
            using (Stream fs = resumeData.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "INSERT INTO resumes VALUES (@applicant_id, @title, @data)";

                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@applicant_id", applicant_id);
                            cmd.Parameters.AddWithValue("@title", title);
                            cmd.Parameters.AddWithValue("@contentType", contentType);
                            cmd.Parameters.AddWithValue("@data", bytes);
                        }
                    }
                }
            }

        }
    }
}
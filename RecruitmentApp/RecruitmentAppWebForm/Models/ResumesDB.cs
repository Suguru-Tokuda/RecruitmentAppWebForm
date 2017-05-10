using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace RecruitmentAppWebForm.Models
{
    public class ResumesDB
    {

        public static void uploadResume(FileUpload resumeData, int applicant_id)
        {
            string title = Path.GetFileName(resumeData.PostedFile.FileName);
            string contentType = resumeData.PostedFile.ContentType;
            string ext = Path.GetExtension(title);
            string fileType = "application/vnd.ms-word";

            Stream fs = resumeData.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                    {
                        string query = "INSERT INTO resumes (applicant_id, title, data) VALUES (@applicant_id, @title, @data)";

                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            con.Open();
                            cmd.Parameters.AddWithValue("@applicant_id", applicant_id);
                            cmd.Parameters.AddWithValue("@title", title);
                            cmd.Parameters.Add("@data", SqlDbType.Binary).Value = bytes;
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
        }


        public static string getResumeName(int applicant_id)
        {
            string retVal = null;
            string sql = "SELECT title FROM resumes WHERE applicant_id = @applicant_id";

            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@applicant_id", applicant_id);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while(dr.Read())
                        {
                            retVal = dr["title"].ToString();
                        }
                    }
                }
            }
            return retVal;
        }

        public static byte[] retrieveResumeData(int applicant_id)
        {
            byte[] retVal = null;
            string sql = "SELECT data FROM resumes WHERE applicant_id = @applicant_id";

            //FileStream fs = null;

            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@applicant_id", applicant_id);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            //int size = 1024 * 1024;
                            //byte[] buffer = new byte[size];
                            retVal = (byte[])dr["data"];
                        }
                        con.Close();
                    }
                }
            }
            return retVal;

        }

    }
}
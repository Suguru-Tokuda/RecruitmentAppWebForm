using RecruitmentAppWebForm.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RecruitmentAppWebForm.Models
{

    public class CompanyDB
    {
        public static List<Company> getAllCompanies()
        {
            List<Company> retVal = new List<Company>();

            string sql = "SELECT * FROM companies";

            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    Company company;
                    while (dr.Read())
                    {
                        company = new Company();
                        company.company_id = (int)dr["company_id"];



                    }
                    dr.Close();
                }
            }



            return retVal;
        }





    }
}
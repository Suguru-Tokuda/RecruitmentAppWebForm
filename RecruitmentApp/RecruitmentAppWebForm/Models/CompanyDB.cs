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
                        company.company_id = Convert.ToInt32(dr["company_id"].ToString());
                        company.company_name = dr["company_name"].ToString();
                        company.street = dr["street"].ToString();
                        company.state = dr["state"].ToString();
                        company.zip = dr["zip"].ToString();
                        retVal.Add(company);
                    }
                    dr.Close();
                }
            }
            return retVal;
        }





    }
}
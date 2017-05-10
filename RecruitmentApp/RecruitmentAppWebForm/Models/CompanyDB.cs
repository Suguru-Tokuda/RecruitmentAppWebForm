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

        public static bool confirmCompanyExists(string company_name)
        {
            bool retVal = false;
            string sql = "SELECT * FROM companies WHERE UPPER(company_name) LIKE '%' + UPPER(@company_name) + '%'";
            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@company_name", company_name);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        retVal = true;
                    }
                    dr.Close();
                }
            }
            return retVal;
        }


        public static void registerCompany(string companyName, string street, string city, string zip)
        {
            string sql = "INSERT INTO companies (company_name, street, city, zip) VALUES (@company_name, @street, @city, @zip)";

            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@company_name", companyName);
                    cmd.Parameters.AddWithValue("@street", street);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@zip", zip);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }


    }
}
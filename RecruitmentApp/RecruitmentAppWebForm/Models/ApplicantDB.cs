﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RecruitmentAppWebForm.Models
{
    public class ApplicantDB
    {
        public static Applicant getApplicant(int applicant_id)
        {
           Applicant retVal = new Applicant();

            string sql = "SELECT * FROM applicants WHERE applicant_id = " + applicant_id;

            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        retVal.first_name = dr["first_name"].ToString();
                        retVal.last_name = dr["last_name"].ToString();
                        retVal.phone = dr["phone"].ToString();
                        retVal.email = dr["email"].ToString();
                        retVal.city = dr["city"].ToString();
                        retVal.state = dr["state"].ToString();
                        retVal.zip = dr["zip"].ToString();
                        retVal.skills = dr["skills"].ToString();
                        retVal.preference = dr["preference"].ToString();
                        retVal.current_salary = Convert.ToInt32(dr["current_salary"].ToString());
                        retVal.desired_salary = Convert.ToInt32(dr["desired_salary"].ToString());
                    }
                    dr.Close();
                }
            }
            return retVal;
        }

        private static string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }




    }
}
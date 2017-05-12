using RecruitmentAppWebForm.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RecruitmentAppWebForm.Models
{
    [DataObject(true)]
    public class ApplicantDB
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static Applicant getApplicant(int applicant_id)
        {
            Applicant retVal = new Applicant();

            string sql = "SELECT * FROM applicants WHERE applicant_id = " + applicant_id;

            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
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
                        retVal.street = dr["street"].ToString();
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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Applicant> getApplicants(int job_id)
        {

            List<Applicant> retVal = new List<Applicant>();

            string sql = "SELECT * FROM applicants AS a JOIN applications AS ap ON a.applicant_id = ap.applicant_id WHERE job_id = @job_id";
            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    Applicant applicant;
                    cmd.Parameters.AddWithValue("@job_id", job_id);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();                    
                    while (dr.Read())
                    {
                        applicant = new Applicant();
                        applicant.first_name = dr["first_name"].ToString();
                        applicant.last_name = dr["last_name"].ToString();
                        applicant.applicant_id = Convert.ToInt32(dr["applicant_id"].ToString());
                        retVal.Add(applicant);
                    }
                }
            }
            return retVal;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Applicant> getApplicantsForExtendOffer(int job_id)
        {
            List<Applicant> retVal = new List<Applicant>();

            string sql = "SELECT * FROM applicants AS a JOIN applications AS ap ON a.applicant_id = ap.applicant_id WHERE job_id = @job_id AND ap.interview_date IS NOT NULL";
            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    Applicant applicant;
                    con.Open();
                    cmd.Parameters.AddWithValue("@job_id", job_id);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        applicant = new Applicant();
                        applicant.first_name = dr["first_name"].ToString();
                        applicant.last_name = dr["last_name"].ToString();
                        applicant.applicant_id = Convert.ToInt32(dr["applicant_id"].ToString());
                        retVal.Add(applicant);
                    }
                }
            }
            return retVal;
        }


        public static int getApplicantIdByEmail(string email)
        {
            int retVal = 0;
            string sql = "SELECT applicant_id FROM applicants WHERE email = @email";
            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@email", email);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        retVal = Convert.ToInt32(dr["applicant_id"].ToString());
                    }
                    con.Close();
                }
            }
            return retVal;
        }

        public static string registerApplicant(string first_name, string last_name, string phone, string email, string street, string city, string state, string zip, string skills, string preference, int current_salary, int desired_salary)
        {
            string retVal = null;

            string sql = "INSERT INTO applicants (first_name, last_name, phone, email, street, city, state, zip, skills, preference, current_salary, desired_salary) VALUES (@first_name, @last_name, @phone, @email, @street, @city, @state, @zip, @skills, @preference, @current_salary, @desired_salary)";
            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@first_name", first_name);
                    cmd.Parameters.AddWithValue("@last_name", last_name);
                    cmd.Parameters.AddWithValue("@phone", phone);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@street", street);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@zip", zip);
                    cmd.Parameters.AddWithValue("@skills", skills);
                    cmd.Parameters.AddWithValue("@preference", preference);
                    cmd.Parameters.AddWithValue("@current_salary", current_salary);
                    cmd.Parameters.AddWithValue("@desired_salary", desired_salary);
                    con.Open();
                    try
                    {
                        cmd.ExecuteNonQuery();
                    } catch (SqlException e)
                    {
                        Console.Write(e + " was caught");
                        retVal = "unsuccessful";
                    }                    
                }
            }
            return retVal;
        }

        public static string login(string email, System.Web.UI.Page page)
        {
            string retVal = null;

            string sql = "SELECT * FROM applicants WHERE email = @email";

            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@email", email);
                    SqlDataReader dr = cmd.ExecuteReader();
                    int app_id=0;
                    while (dr.Read())
                    {
                        app_id = Convert.ToInt32(dr["applicant_id"].ToString());
                    }
                    if (app_id == 5000)
                    {
                        retVal = "admin";
                        page.Session["applicant_id"] = app_id;
                    } else
                    {
                        retVal = "applicant";
                        page.Session["applicant_id"] = app_id;
                    }
                    con.Close();
                }
            }
            return retVal;
        }
        public static int getRegisteredApplicant(string email)
        {
            int retval = 404;
            string sql = "SELECT applicant_id FROM applicants WHERE UPPER(email)= UPPER(@email)";
            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@email", email);
                    SqlDataReader dr = cmd.ExecuteReader();
                    
                    while (dr.Read())
                    {
                        retval= Convert.ToInt32(dr["applicant_id"].ToString());
                    }
                }
            }

                return retval;
        }

        public static void updateApplicant(int applicant_id, string first_name, string last_name, string phone, string email, string street, string city, string zip, string skills, string preference, int current_salary, int desired_salary)
        {
            string sql = "UPDATE applicants " +
                         "SET first_name = @first_name, last_name = @last_name, phone = @phone, email = @email, street = @street, city = @city, zip = @zip, skills = @skills, preference = @preference, current_salary = @current_salary, desired_salary = @desired_salary " +
                         "WHERE applicant_id = @applicant_id";
            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@applicant_id", applicant_id);
                    cmd.Parameters.AddWithValue("@first_name", first_name);
                    cmd.Parameters.AddWithValue("@last_name", last_name);
                    cmd.Parameters.AddWithValue("@phone", phone);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@street", street);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@zip", zip);
                    cmd.Parameters.AddWithValue("@skills", skills);
                    cmd.Parameters.AddWithValue("@preference", preference);
                    cmd.Parameters.AddWithValue("@current_salary", current_salary);
                    cmd.Parameters.AddWithValue("@desired_salary", desired_salary);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }


    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace RecruitmentAppWebForm.Models
{
    [DataObject(true)]
    public class JobsDB
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Job> getApplicantJobs(int applicantId)
        {
            List<Job> retVal = new List<Job>();
            string sql = "SELECT DISTINCT* FROM jobs AS j JOIN applications AS a "
                +"ON j.job_id = a.job_id JOIN companies c ON j.company_id = c.company_id WHERE applicant_id = @applicantId";
            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("applicantId", applicantId);
                    SqlDataReader dr = cmd.ExecuteReader();
                    Job job;
                    while (dr.Read())
                    {
                        job = new Models.Job();
                        job.job_id = Convert.ToInt32(dr["job_id"].ToString());
                        job.company_id = Convert.ToInt32(dr["company_id"].ToString());
                        job.company_name = dr["company_name"].ToString();
                        job.category = dr["category"].ToString();
                        job.position = dr["position"].ToString();
                        job.salary_min = Convert.ToInt32(dr["salary_min"].ToString());
                        job.salary_max = Convert.ToInt32(dr["salary_max"].ToString());
                        job.level = dr["level"].ToString();
                        job.description = dr["description"].ToString();
                        job.qualification = dr["qualification"].ToString();
                        job.posting_date = Convert.ToDateTime(dr["posting_date"].ToString());
                        job.filled = Convert.ToBoolean(dr["filled"].ToString());
                        job.jobCity = dr["city"].ToString();
                        job.jobState = dr["state"].ToString();
                        retVal.Add(job);
                    }

                    dr.Close();
                }

            }

            return retVal;

        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Job> displayJobs(int jobId)
        {
            List<Job> retVal = new List<Job>();
            string sql = "SELECT DISTINCT* FROM jobs AS j JOIN companies AS c ON j.company_id = c.company_id where j.job_id= @jobId AND j.filled = 0";
            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {

                    con.Open();
                    cmd.Parameters.AddWithValue("jobId", jobId);
                    SqlDataReader dr = cmd.ExecuteReader();
                    Job job;

                    while (dr.Read())
                    {
                        job = new Models.Job();
                        job.job_id = Convert.ToInt32(dr["job_id"].ToString());
                        job.company_id = Convert.ToInt32(dr["company_id"].ToString());
                        job.company_name = dr["company_name"].ToString();
                        job.category = dr["category"].ToString();
                        job.position = dr["position"].ToString();
                        job.salary_min = Convert.ToInt32(dr["salary_min"].ToString());
                        job.salary_max = Convert.ToInt32(dr["salary_max"].ToString());
                        job.level = dr["level"].ToString();
                        job.description = dr["description"].ToString();
                        job.qualification = dr["qualification"].ToString();
                        job.posting_date = Convert.ToDateTime(dr["posting_date"].ToString());
                        job.filled = Convert.ToBoolean(dr["filled"].ToString());
                        job.jobCity = dr["city"].ToString();
                        job.jobState = dr["state"].ToString();
                        retVal.Add(job);
                    }
                    dr.Close();

                }
            }
            return retVal;

        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Job> searchJobs(string[] keywords, string location)
        {

            List<Job> retVal = new List<Job>();
            string sql = null;
            //Checks for empty keywords and retrieves all results for empty ones
            if (keywords.Length == 0 && location.Equals(""))
            {
                sql = "SELECT DISTINCT * FROM jobs AS j JOIN companies AS c ON j.company_id = c.company_id ";
            }
            else if (keywords.Length > 0)
            {
                sql = "SELECT * FROM jobs AS j JOIN companies AS c ON j.company_id = c.company_id "
                    + "WHERE j.position LIKE '%" + keywords[0] + "%' "
                    + "OR j.description LIKE '%" + keywords[0] + "%' "
                    + "OR c.company_name LIKE '%" + keywords[0] + "%' ";
            }
            else if (keywords.Length > 1)
            {
                for (int i = 1; i < keywords.Length; i++)
                {
                    string tempSql = "OR j.position LIKE '%" + keywords[i] + "%' "
                                     + "OR j.description LIKE '%" + keywords[i] + "%' "
                                     + "OR c.company_name LIKE '%" + keywords[i] + "%' ";
                    sql += tempSql;
                }
            }
            else if (keywords.Length == 0 && !location.Equals(""))
            {
                sql = "SELECT * FROM jobs AS j JOIN companies AS c ON j.company_id = c.company_id "
                      + "WHERE c.city LIKE '%" + location + "%' "
                      + "OR c.state LIKE '%" + location + "%' "
                      + "OR c.zip = '" + location + "'; ";
            }
            else if (keywords.Length > 1)
            {
                for (int i = 1; i < keywords.Length; i++)
                {
                    string tempSql = "OR j.position LIKE '%" + keywords[i] + "%' "
                                     + "OR j.description LIKE '%" + keywords[i] + "%' "
                                     + "OR c.company_name LIKE '%" + keywords[i] + "%' ";
                    sql += tempSql;
                }
            }
            else if (!location.Equals(""))
            {
                sql += "AND c.city LIKE '%" + location + "%' "
                    + "OR c.state LIKE '%" + location + "%' "
                    + "OR c.zip = '" + location + "' ";
            }

            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    Job job;
                    while (dr.Read())
                    {
                        job = new Models.Job();
                        job.job_id = Convert.ToInt32(dr["job_id"].ToString());
                        job.company_id = Convert.ToInt32(dr["company_id"].ToString());
                        job.company_name = dr["company_name"].ToString();
                        job.category = dr["category"].ToString();
                        job.position = dr["position"].ToString();
                        job.salary_min = Convert.ToInt32(dr["salary_min"].ToString());
                        job.salary_max = Convert.ToInt32(dr["salary_max"].ToString());
                        job.level = dr["level"].ToString();
                        job.description = dr["description"].ToString();
                        job.qualification = dr["qualification"].ToString();
                        job.posting_date = Convert.ToDateTime(dr["posting_date"].ToString());
                        job.filled = Convert.ToBoolean(dr["filled"].ToString());
                        job.jobCity = dr["city"].ToString();
                        job.jobState = dr["state"].ToString();
                        retVal.Add(job);
                    }
                    dr.Close();
                }
            }
            return retVal;
        }

        public static List<Job> getAllOpenJobs()
        {
            List<Job> retVal = new List<Job>();
            string sql = "SELECT * FROM jobs AS j JOIN companies AS c ON j.company_id = c.company_id WHERE j.filled = 0";

            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    Job job;
                    while (dr.Read())
                    {
                        job = new Models.Job();
                        job.job_id = Convert.ToInt32(dr["job_id"].ToString());
                        job.company_id = Convert.ToInt32(dr["company_id"].ToString());
                        job.company_name = dr["company_name"].ToString();
                        job.category = dr["category"].ToString();
                        job.position = dr["position"].ToString();
                        job.salary_min = Convert.ToInt32(dr["salary_min"].ToString());
                        job.salary_max = Convert.ToInt32(dr["salary_max"].ToString());
                        job.level = dr["level"].ToString();
                        job.description = dr["description"].ToString();
                        job.qualification = dr["qualification"].ToString();
                        job.posting_date = Convert.ToDateTime(dr["posting_date"].ToString());
                        job.filled = Convert.ToBoolean(dr["filled"].ToString());
                        job.jobCity = dr["city"].ToString();
                        job.jobState = dr["state"].ToString();
                        retVal.Add(job);
                    }
                    dr.Close();
                }

            }
            return retVal;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static string getJobTitle(int job_id)
        {
            string retVal = null;
            string sql = "SELECT * FROM jobs WHERE job_id = " + job_id;

            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        retVal = dr["position"].ToString();
                    }
                    dr.Close();
                }
            }
            return retVal;
        }

        public static void enterJob(string position, string industry, int salary_min, int salary_max, string level, string description, string responsibility, string qualification, DateTime posting_date)
        {
            string sql = "INSERT INTO jobs (company_id, position, category, salary_min, salary_max, level, description, responsibility, qualification, posting_date, filled) VALUES (@position, @category, @salary_min, @salary_max, @level, @description, @responsibility, @qualification, @posting_date, @filled)";

            using (SqlConnection con = new SqlConnection(DBConnection.getConnection()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@position", position);
                    cmd.Parameters.AddWithValue("@category", industry);
                    cmd.Parameters.AddWithValue("@salary_min", salary_min);
                    cmd.Parameters.AddWithValue("@salary_max", salary_max);
                    cmd.Parameters.AddWithValue("@level", level);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@responsibility", responsibility);
                    cmd.Parameters.AddWithValue("@qualification", qualification);
                    cmd.Parameters.AddWithValue("@posting_date", posting_date);
                    cmd.Parameters.AddWithValue("@filled", 0);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}
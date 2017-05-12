using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace RecruitmentAppWebForm.Models
{
    public class Email
    {
        public static void sendProductRegistrationEmail(int applicant_id, int job_id)
        {
            string jobname = JobsDB.getJobTitle(job_id);
            MailAddress from = new MailAddress("recruitmentapp2017@gmail.com", "Recruiters Network");
            MailMessage msg = new MailMessage(from.ToString(), ApplicantDB.getApplicant(applicant_id).email, "Job Application Confirmation - "+ job_id,
                "Thank you for applying for the position: " + JobsDB.getJobTitle(job_id) + " \nYou will be notified of any future updates.\n\nThank you,\n Recruitment team");

            SmtpClient client = new SmtpClient("smtp.gmail.com");
            msg.Sender= new MailAddress("recruitmentapp2017@gmail.com", "Recruiters Network");
            client.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "recruitmentapp2017@gmail.com",
                Password = "!RecruitmentApp17"
            };
            client.EnableSsl = true;//using https:// instead of http:
            client.Send(msg);
        }

        public static void sendOfferEmail(int applicant_id, int job_id)
        {
            string jobname = JobsDB.getJobTitle(job_id);
            string companyName = JobsDB.getCompanyName(job_id);
            MailAddress from = new MailAddress("recruitmentapp2017@gmail.com", "Recruiters Network");
            MailMessage msg = new MailMessage(from.ToString(), ApplicantDB.getApplicant(applicant_id).email, "Job Offer - " + job_id,
                "Congratuations! You recieved a job offer for " + JobsDB.getJobTitle(job_id) + "!!!! \nYou will be notified from the employer for further details from " + companyName + "!!\n\nThank you,\n Recruitment team");
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            msg.Sender = new MailAddress("recruitmentapp2017@gmail.com", "Recruiters Network");
            client.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "recruitmentapp2017@gmail.com",
                Password = "!RecruitmentApp17"
            };
            client.EnableSsl = true;//using https:// instead of http:
            client.Send(msg);
        }

        public static void sendInterviewEmail(int applicant_id, int job_id, DateTime interview_date)
        {
            string jobname = JobsDB.getJobTitle(job_id);
            string companyName = JobsDB.getCompanyName(job_id);
            MailAddress from = new MailAddress("recruitmentapp2017@gmail.com", "Recruiters Network");
            MailMessage msg = new MailMessage(from.ToString(), ApplicantDB.getApplicant(applicant_id).email, "Job Interview Request- " + job_id,
                "You have been offered an interview for " + JobsDB.getJobTitle(job_id) + " from " + companyName + ".\n The Interview date is: " + interview_date.Date + "\n\nYou should get a follow up shortly.\nThank you,\n Recruitment team");
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            msg.Sender = new MailAddress("recruitmentapp2017@gmail.com", "Recruiters Network");
            client.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "recruitmentapp2017@gmail.com",
                Password = "!RecruitmentApp17"
            };
            client.EnableSsl = true;//using https:// instead of http:
            client.Send(msg);
        }


    }
}
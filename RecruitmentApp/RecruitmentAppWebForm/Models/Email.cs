using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace RecruitmentAppWebForm.Models
{
    public class Email
    {
        public static void sendProductRegistrationEmail(int applicantID, int jobID)

        {
            string jobname = JobsDB.getJobTitle(jobID);
            MailAddress from = new MailAddress("recruitmentapp2017@gmail.com", "Recruiters Network");
            MailMessage msg = new MailMessage(from.ToString(), ApplicantDB.getApplicant(applicantID).email, "Job Application Confirmation - "+ jobID,
                "Thank you for applying for the position: " + JobsDB.getJobTitle(jobID) + " \nYou will be notified of any future updates.\n\nThank you,\n Recruitment team");

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
    }
}
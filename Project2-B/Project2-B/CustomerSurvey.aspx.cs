using Project2_A.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project2_B
{
    public partial class CompleteSurvey : System.Web.UI.Page
    {

        DataView incidentsTable;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetIncidents_Click(object sender, EventArgs e)
        {
            errorMsg.Text = null;
            incidents.Items.Clear();
            //get row from SqlDataSource based on value in the text box;
            incidentsTable = (DataView)SqlIncidentDataSoruce.Select(DataSourceSelectArguments.Empty);
            incidentsTable.RowFilter = "customerID = '" + Int32.Parse(customerID.Text) + "' AND dateClosed IS NOT NULL";

            if (incidentsTable.Count > 0)
            {
                displayClosedIncidents();
                enableControls(true);
                incidents.Focus();
                errorMsg.Text = null;
            }
            else
            {
                errorMsg.Text = "There is no closed incident for the entered customer ID. Try again.";
                enableContactMethod(false);
            }
        }

        private void displayClosedIncidents()
        {
            incidents.Items.Add(new ListItem("--Select an incident-", "None"));

            foreach (DataRowView row in incidentsTable)
            {
                Incident incident = new Incident();
                incident.incidentID = Convert.ToInt32(row["incidentID"]);
                incident.productCode = row["productCode"].ToString();
                incident.dateClosed = Convert.ToDateTime(row["dateClosed"]);
                incident.title = row["title"].ToString();
                incidents.Items.Add(new ListItem(incident.customerIncidentDisplay(), incident.incidentID.ToString()));
            }

            incidents.SelectedIndex = 0;
        }

        private void enableControls(bool enable)
        {
            incidents.Enabled = enable;
            responseTime.Enabled = enable;
            technicianEfficiency.Enabled = enable;
            resolution.Enabled = enable;
            additionalComments.Enabled = enable;
            contactMe.Enabled = enable;
        }

        private void enableContactMethod(bool enable)
        {
            contactBy.Enabled = enable;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (incidents.SelectedValue != "None")
                {
                    //get row from SqlDataSource based on value in the text box;
                    incidentsTable = (DataView)SqlIncidentDataSoruce.Select(DataSourceSelectArguments.Empty);
                    incidentsTable.RowFilter = "incidentID = '" + Int32.Parse(incidents.SelectedValue) + "'";

                    DataRowView row = incidentsTable[0];

                    Survey survey = Survey.getSurvey();
                    survey.customerID = Int32.Parse(row["customerID"].ToString());
                    survey.incidentID = Int32.Parse(incidents.SelectedValue);
                    survey.responseTime = Int32.Parse(responseTime.SelectedValue);
                    survey.techEfficiency = Int32.Parse(technicianEfficiency.SelectedValue);
                    survey.resolution = Int32.Parse(resolution.SelectedValue);
                    survey.comments = additionalComments.Text;
                    survey.contact = false;
                    survey.contactBy = contactBy.SelectedValue;

                    Survey.submitSurvey(survey);

                    Response.Redirect("/CustomerSupport/SurveyComplete", false);
                }
                else
                {
                    sbmtMsg.Text = "Select an item";
                }
            }
        }

        protected void btnContactMe_Click(object sender, EventArgs e)
        {
            if (contactMe.Checked)
            {
                enableContactMethod(true);
            }
            else
            {
                enableContactMethod(false);
            }
        }

    }
}
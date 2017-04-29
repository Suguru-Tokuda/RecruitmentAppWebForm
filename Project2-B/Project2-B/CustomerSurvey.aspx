<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerSurvey.aspx.cs" Inherits="Project2_B.CompleteSurvey" MasterPageFile="~/Site1.Master" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder" >
    <main class="container">
            <div class="form-group">
                <%--<div class="form-inline row">--%>
                <label class="fomr-group col-md-2 col-sm-2 col-xs-2">Enter your customer ID:</label>
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <asp:TextBox ID="customerID" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <asp:Button ID="btnGetIncidents" Text="Get Incidents" runat="server" CssClass="form-group btn btn-primary" OnClick="btnGetIncidents_Click" ValidationGroup="cusIDGroup" />
                </div>
            </div>
            <%--ListBox to show incidents--%>
            <div class="form-group">
                <asp:ListBox runat="server" CssClass="col-md-6 col-ms-6 col-xs-6 form-control" ID="incidents" ValidationGroup="incidentsGroup" Enabled="false" />
                <asp:SqlDataSource ID="SqlIncidentDataSoruce" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Incidents]" />
            </div>
            <%--Validators--%>
            <div class="form-group">
                <asp:RequiredFieldValidator CssClass="text-danger validator col-md-12 col-ms-12 col-xs-12" ErrorMessage="Enter a customer ID" ID="customerIDRequiredValidator" ControlToValidate="customerID" runat="server" ValidationGroup="cusIDGroup" />
                <asp:CompareValidator CssClass="text-danger validator col-md-12 col-ms-12 col-xs-12" ErrorMessage="Has to be numeric." runat="server" ID="customerIDCompValidator" ControlToValidate="customerID" ValidationGroup="cusIDGroup" Type="Integer" Operator="DataTypeCheck" />
                <asp:Label ID="errorMsg" runat="server" CssClass="text-danger validator col-md-12 col-ms-12 col-xs-12" />
            </div>
            <%--Categories--%>
            <div class="form-group">
                <strong class="col-md-12 col-sm-12 col-xs-12">Please rate this incident by the following categories:</strong>
            </div>
            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-3">Response Time:</label>
                <asp:RadioButtonList CssClass="col-md-9 col-sm-9 col-xs-9 option" runat="server" ID="responseTime" Enabled="false" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Not satisfied" Value="1" />
                    <asp:ListItem Text="Somewhat satisfied" Value="2" />
                    <asp:ListItem Text="Satisfied" Value="3" />
                    <asp:ListItem Text="Completely satisifed" Value="4" />
                </asp:RadioButtonList>
            </div>
            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-3">Technician efficiency:</label>
                <asp:RadioButtonList CssClass="col-md-9 col-sm-9 col-xs-9 option" runat="server" ID="technicianEfficiency" Enabled="false" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Not satisfied" Value="1" />
                    <asp:ListItem Text="Somewhat satisfied" Value="2" />
                    <asp:ListItem Text="Satisfied" Value="3" />
                    <asp:ListItem Text="Completely satisifed" Value="4" />
                </asp:RadioButtonList>
            </div>
            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-3">Problem resolution:</label>
                <asp:RadioButtonList CssClass="col-md-9 col-sm-9 col-xs-9 option" runat="server" ID="resolution" Enabled="false" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Not satisfied" Value="1" />
                    <asp:ListItem Text="Somewhat satisfied" Value="2" />
                    <asp:ListItem Text="Satisfied" Value="3" />
                    <asp:ListItem Text="Completely satisifed" Value="4" />
                </asp:RadioButtonList>
            </div>
            <%--Additional comments--%>
            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-3">Additional comments:</label>
                <div class="col-md-9 col-sm-9 col-xs-9">
                    <asp:TextBox TextMode="MultiLine" Columns="50" Rows="5" runat="server" ID="additionalComments" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
            </div>

            <div class="form-group col-md-12 col-sm-12 col-xs-12">
                <asp:CheckBox AutoPostBack="true" runat="server" Text="Please contact me to discuss this incident" ID="contactMe" Enabled="false" OnCheckedChanged="btnContactMe_Click" />
                <div class="form=control">
                    <asp:RadioButtonList CssClass="col-md-offset-2 col-sm-offset-2 col-xs-offset-2 opton" runat="server" ID="contactBy" Enabled="false">
                        <asp:ListItem Text="Contact by email" Value="email" Selected="True" />
                        <asp:ListItem Text="Contact by phone" Value="phone" />
                    </asp:RadioButtonList>
                </div>
            </div>

            <div class="form-group col-md-12 col-sm-12 col-xs-12">
                <asp:Button runat="server" CssClass="btn btn-primary" Width="200px" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="incidentsGroup" />
            </div>

            <div class="form-group">
                <asp:Label runat="server" CssClass="text-danger validator col-md-3 col-sm-3 col-xs-3" ID="sbmtMsg" />
                <asp:RequiredFieldValidator CssClass="text-danger validator col-md-3 col-sm-3 col-xs-3" ErrorMessage="Select an incident to proceed" runat="server" ControlToValidate="incidents" ValidationGroup="incidentsGroup" />
                <asp:RequiredFieldValidator CssClass="text-danger validator col-md-12 col-ms-12 col-xs-12" ErrorMessage="Select for response time" ID="responseTimeRequiredFieldValidator" ControlToValidate="responseTime" runat="server" ValidationGroup="incidentsGroup" />
                <asp:RequiredFieldValidator CssClass="text-danger validator col-md-12 col-ms-12 col-xs-12" ErrorMessage="Select for technician efficiency" ID="technicianEfficiencyRequiredFieldValidator" ControlToValidate="technicianEfficiency" runat="server" ValidationGroup="incidentsGroup" />
                <asp:RequiredFieldValidator CssClass="text-danger validator col-md-12 col-ms-12 col-xs-12" ErrorMessage="Select for resolution" ID="resolutionRequiredFieldValidator" ControlToValidate="resolution" runat="server" ValidationGroup="incidentsGroup" />
            </div>
        </main>


</asp:Content>
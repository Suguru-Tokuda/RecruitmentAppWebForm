<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterJob.aspx.cs" Inherits="RecruitmentAppWebForm.RegisterJob" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">


    <div class="form-horizontal">
        <div class=" form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Company name:</asp:Label>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <asp:DropDownList runat="server" ID="companyList" DataTextField="company_name" DataValueField="company_id" CssClass="form-control" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Not in the list</asp:Label>
            <div class="col-md-10">
                <asp:CheckBox runat="server" ID="companyNotInList" OnCheckedChanged="companyNotInList_CheckedChanged" AutoPostBack="true" />
                <asp:TextBox runat="server" ID="companyText" Placeholder="Company name" CssClass="form-control" />
                <%if (companyNotInList.Checked)
                    { %>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="companyText" CssClass="text-danger" ErrorMessage="Company name is required" Diplay="dynamic" />
                <%} %>
            </div>
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Position:</asp:Label>
            <div class="col-md-4">
                <asp:TextBox runat="server" ID="position" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="position" CssClass="text-danger" ErrorMessage="Position is required" Diplay="dynamic" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Industry:</asp:Label>
            <div class="col-md-6 col-sm-6 col-xs-6">

                <asp:DropDownList runat="server" ID="industry" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" InitialValue="--Select industry--" ErrorMessage="Required" CssClass="text-danger" ControlToValidate="industry" Display="Dynamic" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Minimum salary:</asp:Label>
            <div class="col-md-4">
                <asp:TextBox runat="server" ID="salary_min" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="salary_min" CssClass="text-danger" ErrorMessage="Minimum salary is required" Diplay="dynamic" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Maximum salary:</asp:Label>
            <div class="col-md-4">
                <asp:TextBox runat="server" ID="salary_max" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="salary_max" CssClass="text-danger" ErrorMessage="Maximum salary is required" Diplay="dynamic" />
            </div>
        </div>



        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Job level:</asp:Label>
            <div class="col-md-6 col-sm-4 col-xs-6">
                <asp:DropDownList runat="server" ID="jobLevel" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" InitialValue="--Select job level--" ErrorMessage="Required" CssClass="text-danger" ControlToValidate="jobLevel" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="" CssClass="register col-md-2 control-label" runat="server">Description:</asp:Label>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <asp:TextBox runat="server" ID="description" TextMode="MultiLine" CssClass="form-control col-md-4 col-sm-4 col-xs-4" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="description" CssClass="text-danger" ErrorMessage="Descriptions are required" Diplay="dynamic" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Responsibilities:</asp:Label>
            <div class="col-md-6">
            <asp:TextBox runat="server" ID="responsibility" Placeholder="Separate by ;" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="responsibility" CssClass="text-danger" ErrorMessage="Responsibilities are required" Diplay="dynamic" />
                </div>
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Qualifications:</asp:Label>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <asp:TextBox runat="server" ID="qualification" Placeholder="Separate by ;" TextMode="MultiLine" CssClass="form-control col-md-6 col-sm-6 col-xs-6" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="qualification" CssClass="text-danger" ErrorMessage="Qualification is required" Diplay="dynamic" />
            </div>
        </div>

        <div class="form-group">
            <asp:Button CssClass="btn btn-secondary col-md-offset-2" Text="Register job" runat="server" ID="registerCompanyBtn" OnClick="registerCompanyBtn_Click" />
        </div>
    </div>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterJob.aspx.cs" Inherits="RecruitmentAppWebForm.RegisterJob" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">


    <div class="form-horizontal">
        <div class=" form-group col-md-6">
            <label class="col-md-2 col-sm-2 col-xs-2" style="color: white">Company name:</label>
            <div class="col-md-offset-4 col-md-4 col-sm-4 col-xs-4">
                <asp:DropDownList runat="server" ID="companyList" DataTextField="company_name" DataValueField="company_id" CssClass="form-control" />
            </div>
            <label style="color: white">Not in the list</label>
            <asp:CheckBox runat="server" ID="companyNotInList" OnCheckedChanged="companyNotInList_CheckedChanged" AutoPostBack="true" />
            <asp:TextBox runat="server" ID="companyName" Placeholder="Company name" CssClass="form-control" />
        </div>
        <%--shows only if there is no company already registered--%>

        <%--position--%>
        <div class="form-group col-md-6">
            <label class="col-md-2 col-sm-2 col-xs-2" style="color: white">Position</label>
            <asp:TextBox runat="server" ID="position" CssClass="form-control col-md-offset-4 col-md-4 col-sm-4 col-xs-4" />
        </div>

        <%--industry--%>
        <div class="form-group col-md-6">
            <label class="col-md-2 col-sm-2 col-xs-2" style="color: white">Industry</label>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <asp:DropDownList runat="server" ID="industry" CssClass="form-control"  />
                <asp:RequiredFieldValidator runat="server" InitialValue="--Select industry--" ErrorMessage="Required" CssClass="text-danger" ControlToValidate="industry" />
            </div>
        </div>

        <%--salary_min--%>
        <div class="form-group col-md-6">
            <label class="col-md-2 col-sm-2 col-xs-2" style="color: white">Minimum salary</label>
            <asp:TextBox runat="server" ID="salary_min" CssClass="form-control col-md-4 col-sm-4 col-xs-4"  />
        </div>

        <%--salary_max--%>
        <div class="form-group col-md-6">
            <label class="col-md-2 col-sm-2 col-xs-2" style="color: white">Maximum salary</label>
            <asp:TextBox runat="server" ID="salary_max" CssClass="form-control col-md-4 col-sm-4 col-xs-4"  />
        </div>

        <%--level--%>
        <div class="form-group">
            <label class="col-md-2 col-sm-2 col-xs-2" style="color: white">Job level</label>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <asp:DropDownList runat="server" ID="jobLevel" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" InitialValue="--Select job level--" ErrorMessage="Required" CssClass="text-danger" ControlToValidate="jobLevel" />
            </div>
        </div>

        <%--description--%>
        <div class="form-group">
            <label class="col-md-2 col-sm-2 col-xs-2" style="color: white">Description</label>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <asp:TextBox runat="server" ID="description" TextMode="MultiLine" CssClass="form-control col-md-4 col-sm-4 col-xs-4" />
            </div>
        </div>

        <%--responsibility--%>
        <div class="form-group">
            <label class="col-md-2 col-sm-2 col-xs-2" style="color: white">Maximum salary</label>
            <asp:TextBox runat="server" ID="responsibility" CssClass="form-control col-md-6 col-sm-6 col-xs-6" />
        </div>

        <%--qualification--%>
        <div class="form-group">
            <label class="col-md-2 col-sm-2 col-xs-2" style="color: white">Qualification</label>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <asp:TextBox runat="server" ID="qualification" TextMode="MultiLine" CssClass="form-control col-md-6 col-sm-6 col-xs-6" />
            </div>
        </div>

        <div class="form-group">
            <asp:Button CssClass="btn btn-secondary" Text="Register job" runat="server" ID="registerCompanyBtn" OnClick="registerCompanyBtn_Click" />
        </div>

    </div>
</asp:Content>

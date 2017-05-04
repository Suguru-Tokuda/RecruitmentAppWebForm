<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterJob.aspx.cs" Inherits="RecruitmentAppWebForm.RegisterJob" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:DropDownList runat="server" ID="companyList" />

    <%--shows only if there is no company already registered--%>
    <div class="row">
        <label class="col-md-2 col-sm-2 col-xs-2">Company name:</label>
        <asp:TextBox runat="server" ID="companyName" CssClass="form-control col-md-4 col-sm-4 col-xs-4" />
    </div>

    <%--position--%>
    <div class="row">
        <label class="col-md-2 col-sm-2 col-xs-2">Position</label>
        <asp:TextBox runat="server" ID="position" CssClass="form-control col-md-4 col-sm-4 col-xs-4" />
    </div>

    <%--category--%>
    <div class="row">
        <label class="col-md-2 col-sm-2 col-xs-2">Category</label>
        <asp:DropDownList runat="server" ID="category col-md-4 col-sm-4 col-xs-4" />
    </div>

    <%--salary_min--%>
    <div class="row">
        <label class="col-md-2 col-sm-2 col-xs-2">Minimum salary</label>
        <asp:TextBox runat="server" ID="salary_min" CssClass="form-control col-md-4 col-sm-4 col-xs-4" />
    </div>

    <%--salary_max--%>
    <div class="row">
        <label class="col-md-2 col-sm-2 col-xs-2">Maximum salary</label>
        <asp:TextBox runat="server" ID="salary_max" CssClass="form-control col-md-4 col-sm-4 col-xs-4" />
    </div>

    <%--level--%>
    <div class="row">
        <label class="col-md-2 col-sm-2 col-xs-2">Job level</label>
        <asp:DropDownList runat="server" ID="jobLevel" CssClass="form-control" />
    </div>

    <%--description--%>
    <div class="row">
        <label class="col-md-2 col-sm-2 col-xs-2">Description</label>
        <asp:TextBox runat="server" ID="description" TextMode="MultiLine" CssClass="form-control col-md-4 col-sm-4 col-xs-4" />
    </div>

    <%--responsibility--%>
    <div class="row">
        <label class="col-md-2 col-sm-2 col-xs-2">Maximum salary</label>
        <asp:TextBox runat="server" ID="responsibility" CssClass="form-control col-md-6 col-sm-6 col-xs-6" />
    </div>

    <%--qualification--%>
    <div class="row">
        <label class="col-md-2 col-sm-2 col-xs-2">Qualification</label>
        <asp:TextBox runat="server" ID="qualification" TextMode="MultiLine" CssClass="form-control col-md-6 col-sm-6 col-xs-6" />
    </div>
</asp:Content>

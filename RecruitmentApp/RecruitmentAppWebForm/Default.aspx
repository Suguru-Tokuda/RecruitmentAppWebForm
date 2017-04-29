<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RecruitmentAppWebForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="form-group">
            <%--<div class="col-md-6 col-sm-6 col-xs-6">--%>
                <asp:TextBox runat="server" ID="keywords" placeholder="Keywords: Job title, keywords, or company" CssClass="form-control col-md-6" />
            <%--</div>--%>
            <div class="col-md-2 col-sm-2 col-xs-2">
                <asp:TextBox runat="server" ID="location" placeholder="Location" CssClass="form-control" />
            </div>
            <asp:Button runat="server" Text="Search" CssClass="btn btn-primary col-md-1 col-sm-1 col-xs-1" OnClick="searchJobs" />
        </div>
    </div>
    <div class="row">
        <asp:Label runat="server" ID="sqlErrorMessage" CssClass="text-danger" Display="dynamic" />
    </div>


</asp:Content>

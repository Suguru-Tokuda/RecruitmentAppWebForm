<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RecruitmentAppWebForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="form-group">
        <div class="col-md-offset-3 col-sm-offset-3 xs-offset-3">
            <div class="homepage">
                <div class="row">
                    <asp:TextBox runat="server" ID="keywords" placeholder="Job title, keywords, or company" CssClass="form-control col-md-6 col-sm-6 col-xs-6" />
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <asp:TextBox runat="server" ID="location" placeholder="Location, Zip" CssClass="form-control" />
                    </div>
                    <asp:Button runat="server" Text="Search" CssClass="btn btn-secondary" OnClick="searchJobs" />
                    <asp:Label runat="server" ID="sqlErrorMessage" CssClass="text-danger" Display="dynamic" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

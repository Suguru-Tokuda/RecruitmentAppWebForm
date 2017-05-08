<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RecruitmentAppWebForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="form-group">
        <div class="col-md-offset-3 col-sm-offset-3 xs-offset-3">
            <div class="homepage ">
                <div class="row col-md-12 col-sm-12 col-xs-12">
                    <div class="col-md-8 col-sm-8 col-xs-8">
                    <asp:TextBox runat="server" ID="keywords" placeholder="Job title, keywords, or company" Height="45px" CssClass="form-control col-md-6 col-sm-6 col-xs-6" /></div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <asp:TextBox runat="server" ID="location" Height="45px" placeholder="Location, Zip" CssClass="form-control" />
                    </div>
                    <div class="col-md-1 col-sm-1 col-xs-1">
                    <asp:Button runat="server" Text="Search" Height="45px" BackColor="#1C5E55" Fore
                        
                        ="GhostWhite" CssClass="btn btn-secondary" OnClick="searchJobs" /></div>
                    <asp:Label runat="server" ID="sqlErrorMessage" CssClass="text-danger" Display="dynamic" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

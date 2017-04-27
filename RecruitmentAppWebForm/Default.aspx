<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RecruitmentAppWebForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class=".text-center">
        <div class="row">
            <div class="form-group col-md-12 col-sm-12 col-xs-12">
                <asp:TextBox runat="server" placeholder="Keywords" CssClass="form-control col-md-4 col-sm-4 col-xs-4" />
                <asp:TextBox runat="server" placeholder="Location" CssClass="form-control col-md-4 col-sm-4 col-xs-4" />
                <asp:Button runat="server" Text="Search" CssClass="btn btn-primary col-md-3 col-sm-3 col-xs-3" />
            </div>
        </div>
    </div>
</asp:Content>

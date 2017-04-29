<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Project2_B.ContactUs" MasterPageFile="~/Site2.Master" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder2">
    <div class="container">
        <div class="row">
            <h2 class="col-md-offset-1 col-md-3 col-sm-3 col-xs-3">How to contact us</h2>
        </div>
        <div class="row">
            <p class="col-md-offset-1 col-md-6 col-sm-6 col-xs-6">
                If you ever have any questions or comments about our products,<br />
                please be sure to contact us in whatever way is more convenient for you.
            </p>
        </div>
        <div class="row">
            <label class="col-md-offset-1 col-md-3 col-sm-3 col-xs-3">Phone:</label><label class="col-md-3 col-sm-3 col-xs-3">1-800-555-0400</label>
        </div>
        <div class="row">
            <label class="col-md-offset-1 col-md-3 col-sm-3 col-xs-3">E-mail:</label><label class="col-md-3 col-sm-3 col-xs-3"><asp:HyperLink runat="server" NavigateUrl="mailto:sportspro@sportsprosoftware.com">sportspro@sportsprosoftware.com</asp:HyperLink></label>
        </div>
        <div class="row">
            <label class="col-md-offset-1 col-md-3 col-sm-3 col-xs-3">Fax:</label><label class="col-md-3 col-sm-3 col-xs-3">1-559-555-2732</label>
        </div>
        <div class="row">
            <label class="col-md-offset-1 col-md-3 col-sm-3 col-xs-3">Address:</label><label class="col-md-3 col-sm-3 col-xs-3">SportsPro Software, Inc.<br />
                1500 N. Main Steet<br />
                Frescno, California 93710</label>
        </div>
    </div>
</asp:Content>

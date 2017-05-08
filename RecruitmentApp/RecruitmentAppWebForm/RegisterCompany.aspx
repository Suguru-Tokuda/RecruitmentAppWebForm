<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterCompany.aspx.cs" Inherits="RecruitmentAppWebForm.RegisterCompany" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Company name:</asp:Label>
            <asp:TextBox runat="server" ID="companyName" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="companyName" CssClass="text-danger" ErrorMessage="Company name is required" Diplay="dynamic" />
            <asp:Label runat="server" ID="sqlErrorMsg" CssClass="text-danger" />
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Street:</asp:Label>
            <asp:TextBox runat="server" ID="street" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="street" CssClass="text-danger" ErrorMessage="Street is required" Diplay="dynamic" />
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">City:</asp:Label>
            <asp:TextBox runat="server" ID="city" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="city" CssClass="text-danger" ErrorMessage="City is required" Diplay="dynamic" />
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">State:</asp:Label>
            <div class="col-md-2 col-sm-2 col-xs-2">
                <asp:DropDownList runat="server" ID="state" CssClass="form-control">
                    <asp:ListItem Text="--Select State--" Value="0" Selected="True" />
                    <asp:ListItem Text="AL" Value="1" />
                    <asp:ListItem Text="AK" Value="2" />
                    <asp:ListItem Text="AZ" Value="3" />
                    <asp:ListItem Text="AR" Value="4" />
                    <asp:ListItem Text="CA" Value="5" />
                    <asp:ListItem Text="CO" Value="6" />
                    <asp:ListItem Text="CT" Value="7" />
                    <asp:ListItem Text="DE" Value="8" />
                    <asp:ListItem Text="FL" Value="9" />
                    <asp:ListItem Text="GA" Value="10" />

                    <asp:ListItem Text="HI" Value="11" />
                    <asp:ListItem Text="ID" Value="12" />
                    <asp:ListItem Text="IL" Value="13" />
                    <asp:ListItem Text="IN" Value="14" />
                    <asp:ListItem Text="IA" Value="15" />
                    <asp:ListItem Text="KS" Value="16" />
                    <asp:ListItem Text="KY" Value="17" />
                    <asp:ListItem Text="LA" Value="18" />
                    <asp:ListItem Text="ME" Value="19" />
                    <asp:ListItem Text="MD" Value="20" />

                    <asp:ListItem Text="MA" Value="21" />
                    <asp:ListItem Text="MI" Value="22" />
                    <asp:ListItem Text="MN" Value="23" />
                    <asp:ListItem Text="MS" Value="24" />
                    <asp:ListItem Text="MO" Value="25" />
                    <asp:ListItem Text="MT" Value="26" />
                    <asp:ListItem Text="NE" Value="27" />
                    <asp:ListItem Text="NV" Value="28" />
                    <asp:ListItem Text="NH" Value="29" />
                    <asp:ListItem Text="NJ" Value="30" />

                    <asp:ListItem Text="NM" Value="31" />
                    <asp:ListItem Text="NY" Value="32" />
                    <asp:ListItem Text="NC" Value="33" />
                    <asp:ListItem Text="ND" Value="34" />
                    <asp:ListItem Text="OH" Value="35" />
                    <asp:ListItem Text="OK" Value="36" />
                    <asp:ListItem Text="OR" Value="37" />
                    <asp:ListItem Text="PA" Value="38" />
                    <asp:ListItem Text="RI" Value="39" />
                    <asp:ListItem Text="SC" Value="40" />

                    <asp:ListItem Text="SD" Value="41" />
                    <asp:ListItem Text="TN" Value="42" />
                    <asp:ListItem Text="TX" Value="43" />
                    <asp:ListItem Text="UT" Value="44" />
                    <asp:ListItem Text="VT" Value="45" />
                    <asp:ListItem Text="VA" Value="46" />
                    <asp:ListItem Text="WA" Value="47" />
                    <asp:ListItem Text="WV" Value="48" />
                    <asp:ListItem Text="WI" Value="49" />
                    <asp:ListItem Text="WY" Value="50" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" InitialValue="0" ControlToValidate="state" CssClass="text-danger" ErrorMessage="State is required" Diplay="dynamic" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label Font-Bold="true" ForeColor="#ffffff" CssClass="register col-md-2 control-label" runat="server">Zip:</asp:Label>
            <asp:TextBox runat="server" ID="zip" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="zip" CssClass="text-danger" ErrorMessage="Zip is required" Diplay="dynamic" />
            <asp:CustomValidator runat="server" ControlToValidate="zip" CssClass="text-danger" ErrorMessage="Enter 5 digits" ValidationExpression="\d{5}-?(\d{4})?$" />
        </div>

        <div class="form-group">
            <asp:Button CssClass="btn btn-secondary col-md-offset-2" Text="Register company" runat="server" ID="registerCompanyBtn" OnClick="registerCompanyBtn_Click" />
        </div>
    </div>
</asp:Content>

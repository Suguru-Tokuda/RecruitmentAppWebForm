<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="RecruitmentAppWebForm.Account.Profile" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <h1>Profile</h1>

    <asp:FormView runat="server" ID="applicantFormView">
        <ItemTemplate>
            <label>First name</label>
            <asp:TextBox runat="server" ID="firstName" CssClass="form-control" Text='<%# Eval("first_Name")%>' />

            <label>Last name</label>
            <asp:TextBox runat="server" ID="lastName" CssClass="form-control" Text='<%# Eval("first_Name")%>' />

            <label>Phone number</label>
            <asp:TextBox runat="server" ID="phone" CssClass="form-control" Text='<%# Eval("phone")%>' />

            <label>Email</label>
            <asp:TextBox runat="server" ID="email" CssClass="form-control" Text='<%# Eval("email")%>' />

            <label>Street</label>
            <asp:TextBox runat="server" ID="street" CssClass="form-control" Text='<%# Eval("street")%>' />

            <label>City</label>
            <asp:TextBox runat="server" ID="city" CssClass="form-control" Text='<%# Eval("city")%>' />

            <label>State</label>
            <asp:TextBox runat="server" ID="state" CssClass="form-control" Text='<%# Eval("state")%>' />

            <label>Zip</label>
            <asp:TextBox runat="server" ID="zip" CssClass="form-control" Text='<%# Eval("zip")%>' />

            <label>Skills</label>
            <asp:TextBox runat="server" ID="skills" CssClass="form-control" Text='<%# Eval("skills")%>' />

            <label>Preferences</label>
            <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" Text='<%# Eval("preference")%>' />

            <label>Current salary</label>
            <asp:TextBox runat="server" ID="currentSalary" CssClass="form-control" Text='<%# Eval("current_salary")%>' />

            <label>Desired salary</label>
            <asp:TextBox runat="server" ID="desiredSalary" CssClass="form-control" Text='<%# Eval("desired_salary")%>' />
        </ItemTemplate>
    </asp:FormView>





</asp:Content>

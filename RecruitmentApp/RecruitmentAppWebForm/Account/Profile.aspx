<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="RecruitmentAppWebForm.Account.Profile" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <h1>Profile</h1>
    <div class="form-group">
<%--        <asp:FormView runat="server" ID="applicantFormView">
            <ItemTemplate>--%>
                <label style="color: white">First name</label>
                <asp:TextBox runat="server" ID="firstName" CssClass="form-control" Text='<%# Eval("first_Name")%>' />

                <label style="color: white">Last name</label>
                <asp:TextBox runat="server" ID="lastName" CssClass="form-control" Text='<%# Eval("last_Name")%>' />

                <label style="color: white">Phone number</label>
                <asp:TextBox runat="server" ID="phone" CssClass="form-control" Text='<%# Eval("phone")%>' />

                <label style="color: white">Email</label>
                <asp:TextBox runat="server" ID="email" CssClass="form-control" Text='<%# Eval("email")%>' />

                <label style="color: white">Street</label>
                <asp:TextBox runat="server" ID="street" CssClass="form-control" Text='<%# Eval("street")%>' />

                <label style="color: white">City</label>
                <asp:TextBox runat="server" ID="city" CssClass="form-control" Text='<%# Eval("city")%>' />

                <label style="color: white">State</label>
                <asp:TextBox runat="server" ID="state" CssClass="form-control" Text='<%# Eval("state")%>' />

                <label style="color: white">Zip</label>
                <asp:TextBox runat="server" ID="zip" CssClass="form-control" Text='<%# Eval("zip")%>' />

                <label style="color: white">Skills</label>
                <asp:TextBox runat="server" ID="skills" CssClass="form-control" Text='<%# Eval("skills")%>' TextMode="MultiLine" />

                <label style="color: white">Preferences</label>
                <asp:TextBox runat="server" ID="preference" CssClass="form-control" Text='<%# Eval("preference")%>' TextMode="MultiLine" />

                <label style="color: white">Current salary</label>
                <asp:TextBox runat="server" ID="currentSalary" CssClass="form-control" Text='<%# Eval("current_salary")%>' />

                <label style="color: white">Desired salary</label>
                <asp:TextBox runat="server" ID="desiredSalary" CssClass="form-control" Text='<%# Eval("desired_salary")%>' />
<%--            </ItemTemplate>
        </asp:FormView>--%>
        </div>
            <div class="form-group">
                <asp:Button runat="server" CssClass="btn btn-secondary" Text="Update" OnClick="updateProfile" />
                <asp:Label runat="server" ID="updateMsg" CssClass="text-danger" Display="Dynamic" />
            </div>
            <div class="form-group">
                <asp:Button runat="server" CssClass="btn btn-secondary" Text="Back to Main" PostBackUrl="/Default.aspx" />
            </div>
</asp:Content>

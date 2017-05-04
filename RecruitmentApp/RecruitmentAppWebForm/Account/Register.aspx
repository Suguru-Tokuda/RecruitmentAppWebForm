<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RecruitmentAppWebForm.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4 class="register">Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <%--email--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="register col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>

        <%--first name--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="firstName" CssClass="register col-md-2 control-label">First name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="firstName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="firstName"
                    CssClass="text-danger" ErrorMessage="The first name field is required." />
            </div>
        </div>

        <%--last name--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="lastName" CssClass="register col-md-2 control-label">Last name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="lastName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="lastName"
                    CssClass="text-danger" ErrorMessage="The last name field is required." />
            </div>
        </div>

        <%--password--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="register col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>

        <%--confirm password--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="register col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

        <%--phone--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Phone" CssClass="register col-md-2 control-label">Phone</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Phone" TextMode="Phone" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Phone"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The phone field is required." />
            </div>
        </div>

        <%--street--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Street" CssClass="register col-md-2 control-label">Street</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" Placeholder="i.e. LA" ID="Street" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Street"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The street field is required." />
            </div>
        </div>

        <%--city--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="City" CssClass="register col-md-2 control-label">City</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="City" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="City"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The city field is required." />
            </div>
        </div>

        <%--state--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="State" CssClass="register col-md-2 control-label">State</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="State" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="State"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The state field is required." />
            </div>
        </div>

        <%--zip--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Zip" CssClass="register col-md-2 control-label">Zip</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Zip" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Zip"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
            </div>
        </div>


        <%--skills--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Skills" CssClass="register col-md-2 control-label">Skills</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Skills" TextMode="MultiLine" CssClass="form-control" Placeholder="Separate words by ;" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Skills"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The skills field is required." />
            </div>
        </div>


        <%--preference--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Preference" CssClass="register col-md-2 control-label">Preference</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Preference" TextMode="MultiLine" CssClass="form-control" Placeholder="Separate words by ;" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Preference"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The prefence field is required." />
            </div>
        </div>


        <%--current_salary--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Current_salary" CssClass="register col-md-2 control-label">Current salary</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Current_salary" TextMode="Number" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Current_salary"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The current salary field is required." />
            </div>
        </div>

        <%--desired_salary--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Desired_salary" CssClass="register col-md-2 control-label">Desired salary</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Desired_salary" TextMode="Number" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="desired_salary"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The desired salary field is required." />
            </div>
        </div>




        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>

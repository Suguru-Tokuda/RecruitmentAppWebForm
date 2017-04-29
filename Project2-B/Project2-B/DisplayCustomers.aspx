<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayCustomers.aspx.cs" Inherits="Project2_B.DisplayCustomers" MasterPageFile="~/Site1.Master" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div class="form-horizontal">
        <div class="form-horizontal">
            <main class="container">

                <%--Customer List--%>
                <div class="form-group">
                    <label class="text-left col-md-2 col-sm-2 col-xs-2 control-label" for="customer">Select a customer:</label>
                    <div class="col-md-3 col-ms-3 col-xs-3">
                        <asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="customers" DataTextField="name" runat="server" DataValueField="customerID" DataSourceID="SqlCustomerDataSource" />
                        <asp:SqlDataSource ID="SqlCustomerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
                    </div>
                </div>

                <%--Address--%>
                <div class="form-group">
                    <label class="text-left col-md-2 col-sm-2 col-xs-2 control-label" for="address">Address:</label>
                    <div class="col-md-3 col-ms-3 col-xs-3">
                        <asp:Label CssClass="control-label" ID="address" runat="server" />
                    </div>
                </div>

                <%--Phone--%>
                <div class="form-group">
                    <label class="text-left col-md-2 col-sm-2 col-xs-2 control-label" for="phone">Phone:</label>
                    <div class="col-md-3 col-ms-3 col-xs-3">
                        <asp:Label CssClass="control-label" ID="phone" runat="server" />
                    </div>
                </div>

                <%--Email--%>
                <div class="form-group">
                    <label class="text-left col-md-2 col-sm-2 col-xs-2 control-label" for="email">Email:</label>
                    <div class="col-md-3 col-ms-3 col-xs-3">
                        <asp:Label CssClass="control-label" ID="email" runat="server" />
                    </div>
                </div>

                <%--Buttons--%>
                <div class="form-group">
                    <div class="form-inline col-md-offset-1 col-sm-offset-1 col-xs-offset-1 ">
                        <asp:Button runat="server" CssClass="btn btn-primary col-md-2 col-ms-2 col-xs-2" ID="btnAdd" OnClick="btnAdd_Click" Text="Add to Contact List" />
                    </div>
                    <div class="form-inline">
                        <asp:Button runat="server" CssClass="btn btn-primary col-md-2 col-ms-2 col-xs-2" ID="btnDisplay" CausesValidation="false" PostBackUrl="~/ContactDisplay.aspx" Text="Display Contact List" OnClick="btnDisplay_Click" />
                    </div>
                </div>

                <%--Message label--%>
                <div class="row">
                    <asp:Label ID="contactAlreadyExistsMsg" runat="server" EnableViewState="true" CssClass="text-danger text-info col-sm-12" />
                </div>

            </main>
        </div>
    </div>
</asp:Content>

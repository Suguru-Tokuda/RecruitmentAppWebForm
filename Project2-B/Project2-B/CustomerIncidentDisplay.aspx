<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerIncidentDisplay.aspx.cs" Inherits="Project2_B.CustomerIncidentDisplay" MasterPageFile="~/Site1.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <div class="container">
        <div class="form-inline">
            <label class="col-md-3 col-sm-3 col-xs-3">Select a customer:</label>
            <asp:DropDownList AutoPostBack="true" CssClass="form-control col-md-3 col-sm-3 col-xs-3" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" ID="customerID" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <%--            <asp:GridView CssClass="table table-bordered" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Product/Incident" HeaderText="Product/Incident" SortExpression="Product/Incident" ReadOnly="True" />
                    <asp:BoundField DataField="Tech Name" HeaderText="Tech Name" SortExpression="Tech Name" />
                    <asp:BoundField DataField="Opened" HeaderText="Opened" SortExpression="Opened" />
                    <asp:BoundField DataField="Closed" HeaderText="Closed" SortExpression="Closed" />
                </Columns>
            </asp:GridView>--%>
            <asp:DataList runat="server" CssClass="table" DataSourceID="SqlDataSource2">
                <HeaderTemplate>
                    <lable class="col-md-5 col-sm-5 col-xs-5">Product/Incident</lable>
                    <lable class="col-md-2 col-sm-2 col-xs-2">Tech Name</lable>
                    <lable class="col-md-2 col-sm-2 col-xs-2">Opened</lable>
                    <lable class="col-md-2 col-sm-2 col-xs-2">Closed</lable>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="form-group col-md-offset-1 col-sm-offset-1 col-sx-offset-1 col-md-5 col-sm-5 col-xs-5">
                        <asp:Label CssClass="" ID="Product_Label" runat="server" Text='<%# Eval("Product") %>' /><br />
                        <asp:Label CssClass="" ID="Incident_Label" runat="server" Text='<%# Eval("Incident") %>' />
                    </div>
                    <asp:Label CssClass="col-md-2 col-sm-2 col-xs-2" ID="Tech_NameLabel" runat="server" Text='<%# Eval("[Tech Name]") %>' />
                    <asp:Label CssClass="col-md-2 col-sm-2 col-xs-2" ID="OpenedLabel" runat="server" Text='<%# Eval("Opened", "{0:MM/dd/yyyy}") %>' />
                    <asp:Label CssClass="col-md-2 col-sm-2 col-xs-2" ID="ClosedLabel" runat="server" Text='<%# Eval("Closed", "{0:MM/dd/yyyy}") %>' />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Products.Name AS [Product], Incidents.Description AS [Incident], Technicians.Name AS [Tech Name], Incidents.DateOpened AS Opened, Incidents.DateClosed AS Closed FROM Customers INNER JOIN Incidents ON Customers.CustomerID = Incidents.CustomerID INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID WHERE (Customers.CustomerID = @CustomerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="customerID" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

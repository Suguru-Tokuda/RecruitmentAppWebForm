<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainCustomers.aspx.cs" Inherits="Project2_B.MaintainCustomers" MasterPageFile="~/Site1.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-6 table-responsive">
            <asp:GridView runat="server" ID="customerGridView" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="customerDataSource1" CssClass="table col-md-6 col-sm-6 col-sx-6" AllowPaging="true" AllowSorting="true">
                <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                <FooterStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:CommandField ShowSelectButton="true" />
                </Columns>
                <PagerSettings FirstPageText="&lt;&lt;&nbsp;" LastPageText="&gt;&gt;" Mode="NextPreviousFirstLast" NextPageText="&gt;&nbsp;" PreviousPageText="&lt;&nbsp;" />
                <PagerStyle BackColor="Black" Font-Bold="true" ForeColor="White" HorizontalAlign="Center" />
            </asp:GridView>
        </div>

        <div class="col-md-6 col-sm-6 col-xs-6">
            <asp:DetailsView runat="server" AutoGenerateRows="False" DataKeyNames="CustomerID" CssClass="table col-md-6 col-sm-6 col-sx-6" DataSourceID="customerDataSource2" EnableViewState="False" OnItemUpdated="customerDetailsViewItemUpdated" OnItemInserted="customerDetailsViewItemInserted" OnItemDeleted="customerDetailsViewItemDeleted">
                <HeaderStyle BackColor="Black" ForeColor="White" />
                <HeaderTemplate>
                    Selected Customer
                </HeaderTemplate>
                <Fields>
                    <asp:BoundField ControlStyle-CssClass="form-control" DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                    <asp:BoundField ControlStyle-CssClass="form-control" DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField ControlStyle-CssClass="form-control" DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField ControlStyle-CssClass="form-control" DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField ControlStyle-CssClass="form-control" DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField ControlStyle-CssClass="form-control" DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                    <asp:BoundField ControlStyle-CssClass="form-control" DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField ControlStyle-CssClass="form-control" DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ShowInsertButton="true" />
                </Fields>
            </asp:DetailsView>

            <asp:SqlDataSource ID="customerDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID" InsertCommand="INSERT INTO [Customers] ([Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (@Name, @Address, @City, @State, @ZipCode, @Phone, @Email)" SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @CustomerID">
                <DeleteParameters>
                    <asp:Parameter Name="CustomerID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="customerGridView" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="CustomerID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>

        

        <asp:SqlDataSource ID="customerDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID" InsertCommand="INSERT INTO [Customers] ([Name], [City], [State]) VALUES (@Name, @City, @State)" SelectCommand="SELECT [CustomerID], [Name], [City], [State] FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [City] = @City, [State] = @State WHERE [CustomerID] = @CustomerID">
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="CustomerID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <div class="form-group">
        <asp:Label runat="server" ID="sqlErrorMessage" CssClass="text-danger" />
    </div>
</asp:Content>

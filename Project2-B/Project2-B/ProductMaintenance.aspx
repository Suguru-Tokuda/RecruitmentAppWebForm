<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="Project2_B.ProductMaintenance" MasterPageFile="~/Site1.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">

    <%--GridView--%>
    <asp:GridView ID="productGridView" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="ProductCode" DataSourceID="SqlDataSource1">
        <HeaderStyle BackColor="Black" ForeColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Product Code" ControlStyle-BackColor="Blue" ControlStyle-ForeColor="White">
                <ItemTemplate>
                    <%#Eval("productCode")%>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <%#Eval("name")%>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="editProductName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ID="editProductNameRequiredValidator" CssClass="text-danger" ControlToValidate="editProductName" ErrorMessage="Enter product name" Display="Dynamic" />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Version">
                <ItemTemplate>
                    <%#Eval("version")%>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="editVersion" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ID="editVersionRequiredValidator" CssClass="text-danger" ControlToValidate="editVersion" ErrorMessage="Enter version" Display="Dynamic" />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Release Date">
                <ItemTemplate>
                    <%#Eval("releaseDate", "{0:MM/dd/yyyy}")%>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="editReleaseDate" runat="server" CssClass="form-control" Placeholder="mm/dd/yyyy" />
                    <asp:RequiredFieldValidator runat="server" ID="editReleaseDateRequiredValidator" CssClass="text-danger" ControlToValidate="editReleaseDate" ErrorMessage="Enter release date" Display="Dynamic" />
                    <asp:CompareValidator runat="server" ID="editReleaseDateCompareValidator" CssClass="text-danger" ControlToValidate="editReleaseDate" ErrorMessage="Enter in the date format: mm/dd/yyyy" Display="Dynamic" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @ProductCode" InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" SelectCommand="SELECT * FROM [Products] ORDER BY [ProductCode]" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @ProductCode">
        <DeleteParameters>
            <asp:Parameter Name="ProductCode" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductCode" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="ProductCode" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <p>To add a new product, enter the product information and click Add Product</p>
    <%--<div class="form-group">--%>
    <div class="form-group">
        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-2">
                <asp:Label runat="server" CssClass="">Product code:</asp:Label>
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8">
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <asp:TextBox runat="server" ID="productCode" CssClass="form-control" />
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="productCode" runat="server" CssClass="text-danger" ErrorMessage="Enter Product Code" Display="Dynamic" />
                </div>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-2">
                <asp:Label runat="server">Name:</asp:Label>
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8">
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <asp:TextBox runat="server" ID="productName" CssClass="form-control" />
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <asp:RequiredFieldValidator ID="productNameRequiredValidator" ControlToValidate="productName" runat="server" CssClass="text-danger" ErrorMessage="Enter Product Name" Display="Dynamic" />
                </div>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-2">
                <asp:Label runat="server">Version:</asp:Label>
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8">
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <asp:TextBox runat="server" CssClass="form-control" ID="version" />
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <asp:RequiredFieldValidator ID="versionRequiredValidator" ControlToValidate="version" runat="server" CssClass="text-danger" ErrorMessage="Enter Version" Display="Dynamic" />
                    <asp:CompareValidator ID="versionCompareValidator" ControlToValidate="version" CssClass="text-danger" ErrorMessage="Enter decimal value for Version" runat="server" Type="Double" Operator="DataTypeCheck" Display="Dynamic" />
                </div>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-2">
                <asp:Label runat="server">Release date:</asp:Label>
            </div>
            <div class="col-md-8 col-sm-8 col-xs-8">
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <asp:TextBox runat="server" ID="releaseDate" CssClass="form-control" placeholder="mm/dd/yy"></asp:TextBox>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <asp:RequiredFieldValidator ID="releaseDateRequiredValidator" ControlToValidate="releaseDate" runat="server" CssClass="text-danger validator" ErrorMessage="Enter release date" Display="Dynamic" />
                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="releaseDate" CssClass="text-danger validator" ErrorMessage="Enter right format for date" runat="server" Type="Date" Operator="DataTypeCheck" Display="Dynamic" />
                </div>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-md-2 col-sm-2 col-xs-2">
            <asp:Label runat="server"></asp:Label>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
            <asp:Button runat="server" CssClass="btn btn-primary" Text="Add Product" OnClick="btnAdd_Click" />
        </div>
    </div>
    <div class="form-group">
        <asp:Label runat="server" ID="sqlErrorMsg" CssClass="text-danger validator" EnableViewState="false" />
    </div>
    <%--</div>--%>
</asp:Content>

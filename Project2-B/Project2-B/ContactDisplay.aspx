<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactDisplay.aspx.cs" Inherits="Project2_B.ContactDisplay" MasterPageFile="~/Site1.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <%--Contaxt List--%>
    <div class="row">
        <div class="col-sm-12">
            <%--row 1--%>
            <p>Contact List:</p>
        </div>
    </div>
    <div class="col-sm-6">
        <%--list display column--%>
        <div class="form-group">
            <div class="col-sm-12">
                <asp:ListBox ID="cusList" runat="server" CssClass="form-control"></asp:ListBox>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <%--list edit buttons column--%>
        <div class="form-group">
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnRemove" runat="server" Text="Remove Contact" OnClick="btnRemove_Click" CssClass="btn btn-primary" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnEmpty" Text="Empty List" runat="server" OnClick="btnEmpty_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>
    <%--end of row 1--%>
    <div class="row">
        <%--row 2--%>

        <%--button--%>
        <div class="col-sm-6">
            <asp:Button ID="btnContinue" runat="server" PostBackUrl="Administration/DisplayCustomers" Text="Select Additional Customers" CssClass="btn btn-primary" OnClick="btnContinue_Click" />
        </div>
        <div class="col-sm-12">
            <div class="form-grup">
                <%--message label--%>
                <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="text-info col-sm-12" />
            </div>
        </div>
        <div class="form-group">
        </div>
    </div>
</asp:Content>

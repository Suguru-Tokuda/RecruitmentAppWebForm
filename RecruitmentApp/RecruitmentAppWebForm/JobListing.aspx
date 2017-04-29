<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobListing.aspx.cs" Inherits="RecruitmentAppWebForm.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="lstViewJobs" runat="server" >
        <ItemTemplate>
            <table>
                <tr>
                   <td>
                       Job Name
                   </td>
                    <asp:TextBox ID="CustName" Text= '<%# Eval("company_name") %>' visible="true" runat="server"/>
                </tr>
            </table>
        </ItemTemplate>
     </asp:ListView>


    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>


</asp:Content>

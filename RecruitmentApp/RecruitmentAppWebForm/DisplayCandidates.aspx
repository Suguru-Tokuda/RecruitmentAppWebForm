<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayCandidates.aspx.cs" Inherits="RecruitmentAppWebForm.DisplayCandidates" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">


    <label>Job title:</label>
    <asp:Label runat="server" ID="jobTitle" Text="" />
    <div class="row">

        <div class="col-md-3 col-sm-3 col-xs-3">
            <asp:DataList DataKeyField="applicant_id" OnSelectedIndexChanged="applicantList_SelectedIndexChanged" CssClass="table-bordered" ID="applicantList" runat="server">
                <HeaderTemplate>
                    <label class="text-align: center">Applicants</label>
                </HeaderTemplate>
                <HeaderStyle BackColor="#00ffcc" />
                <ItemTemplate>
                    <asp:LinkButton Text='<%# Eval("first_name") + " " + Eval("last_name") %>' CommandName="Select" runat="server" />
                    <asp:Label ID="applicantID" runat="server" Visible="false" Text='<%# Eval("applicant_id") %>' />
                </ItemTemplate>
            </asp:DataList>
        </div>

        <div class="col-md-4">
            <asp:DataList runat="server" ID="candidateDetails">
                <ItemTemplate>
                    <label>Name</label>
                    <asp:Label runat="server" Text='<%# Eval("first_name") + " " + Eval("last_name") %>' />
                </ItemTemplate>
            </asp:DataList>



        </div>



    </div>





</asp:Content>

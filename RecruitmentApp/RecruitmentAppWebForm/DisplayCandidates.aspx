<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayCandidates.aspx.cs" Inherits="RecruitmentAppWebForm.DisplayCandidates" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">


    <label>Job title:</label>
    <asp:Label runat="server" ID="jobTitle" />

    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-6">
            <asp:ListView ID="applicantsListView" runat="server">
                <ItemTemplate>
                    <asp:Label runat="server" ID="candidateFirstName" />
                    <asp:Label runat="server" ID="candidateLastName" />
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>




</asp:Content>

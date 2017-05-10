<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResumeUpload.aspx.cs" Inherits="RecruitmentAppWebForm.ResumeUpload" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h1 style="color: lawngreen">Resume upload</h1>

    <div class="form-horizontal">
        <div class="form-group">
            <label style="color: white">Resume title:</label>
            <asp:TextBox runat="server" ID="resumeName" CssClass="form-control" />
            <asp:FileUpload ID="resumeData" runat="server" />
        </div>
        <div class="form-group">
            <asp:Button runat="server" ID="resumeUploadBtn" CssClass="btn btn-primary" Text="Upload" OnClick="resumeUploadBtn_Click" />
            <div class="form-group">
                <asp:Label runat="server" Style="color: white" />
                <asp:LinkButton runat="server" id="currentResume" onclick="currentResume_Click">
                    <asp:Label runat="server" ID="currentResumeName" />
                </asp:LinkButton>
            </div>
        </div>



    </div>
</asp:Content>

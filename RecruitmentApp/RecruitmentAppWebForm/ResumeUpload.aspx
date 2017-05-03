<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResumeUpload.aspx.cs" Inherits="RecruitmentAppWebForm.ResumeUpload" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h1>Resume upload</h1>

    <div class="form-group">
        <div class="row">
            <label>Resume title:</label>
            <asp:TextBox runat="server" ID="resumeName" CssClass="form-control" />
            <asp:FileUpload ID="resumeData" runat="server" CssClass="form-control" />
        </div>
        <div class="row">
            <asp:Button runat="server" ID="resumeUploadBtn" CssClass="btn btn-primary" Text="Upload" OnClick="resumeUploadBtn_Click" />
        </div>
    </div>
</asp:Content>

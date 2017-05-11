<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResumeUpload.aspx.cs" Inherits="RecruitmentAppWebForm.ResumeUpload" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h1 style="color: lawngreen">Resume</h1>

    <div class="form-horizontal">
        <div class="form-group">
            <asp:FileUpload ID="resumeData" runat="server" />
            <asp:RequiredFieldValidator ControlToValidate="resumeData" ValidationGroup="resumeFileUpLoad" runat="server" ErrorMessage="File Required" CssClass="text-danger" />
            <asp:Label runat="server" ID="resumeExists" Visible="false" />
        </div>
        <div class="form-group">
            <%if (resumeExists.Text.Equals("yes"))
                { %>
            <asp:Button runat="server" ID="updateResumeBtn" CssClass="btn btn-primary" Text="Update" OnClick="updateResumeBtn_Click" ValidationGroup="resumeFileUpLoad" />
            <div class="form-group">
                <label style="color: white">Current resume: </label>
                <asp:Label runat="server" Style="color: white" />
                <asp:LinkButton runat="server" OnClick="currentResume_Click" ValidationGroup="currentResumeClicked">
                    <asp:Label runat="server" ID="currentResumeName" />
                </asp:LinkButton>
                <asp:LinkButton runat="server" OnClick="deleteResume_Click" ValidationGroup="deleteResumeClicked" Text="Remove" />
            </div>
            <% }
                else if (resumeExists.Text.Equals("no"))
                { %>
            <asp:Button runat="server" ID="resumeUploadBtn" CssClass="btn btn-primary" Text="Upload" OnClick="resumeUploadBtn_Click" ValidationGroup="resumeFileUpLoad" />
            <div class="form-group">
            </div>
            <% }%>
        </div>
        <div class="form-group">
            <asp:Label runat="server" ID="msg" CssClass="text-danger" />
        </div>
    </div>
</asp:Content>

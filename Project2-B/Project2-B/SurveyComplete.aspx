<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyComplete.aspx.cs" Inherits="Project2_B.SurveyComplete" MasterPageFile="~/Site1.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <div class="container">
        <div class="form-group">
            <h3>Thank you for your feedback!</h3>
            <p>A customer service representative will contact you within 24 hours.</p>

            <div class="container">
                <asp:Button ID="btnRtnSurvey" runat="server" Text="Return to Survey" CssClass="btn btn-primary" Width="200px" PostBackUrl="/CustomerSupport/CustomerSurvey" />
            </div>
        </div>

    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Apply.aspx.cs" Inherits="RecruitmentAppWebForm.Apply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-8">
        <div class="table table-bordered table-condensed">

            <asp:GridView ID="GridView1" CssClass="table table-bordered table-condensed" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="job_id" HeaderText="Job ID" SortExpression="job_id" />
                    <asp:BoundField DataField="position" HeaderText="Position" SortExpression="position" />
                    <asp:BoundField DataField="company_name" HeaderText="Company Name" SortExpression="company_name" />
                    <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />
                    <asp:BoundField DataField="jobCity" HeaderText="City" SortExpression="jobCity" />
                    <asp:BoundField DataField="jobState" HeaderText="State" SortExpression="jobState" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="getApplicantJobs" TypeName="RecruitmentAppWebForm.Models.JobsDB">
                <SelectParameters>
                    <asp:SessionParameter Name="applicantId" SessionField="applicant_id" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>

        </div>
    </div>
    </asp:Content>

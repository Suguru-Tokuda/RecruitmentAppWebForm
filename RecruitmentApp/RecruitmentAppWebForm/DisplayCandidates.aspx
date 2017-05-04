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
            <asp:DetailsView runat="server" ID="candidateDetails" CssClass="table" AutoGenerateRows="false">
                <HeaderTemplate>
                    <lable>Selected Applicant</lable>
                </HeaderTemplate>
                <HeaderStyle BackColor="#caffff" />
                <Fields>
                    <%--Name--%>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("first_name") + " " + Eval("last_name") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Phone--%>
                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("phone") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Email--%>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("email") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Current Location--%>
                    <asp:TemplateField HeaderText="Current Location">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("city") + ", " + Eval("state") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Skills--%>
                    <asp:TemplateField HeaderText="Skills">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("skills") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Preferences--%>
                    <asp:TemplateField HeaderText="Preference">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("preference") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Current salary--%>
                    <asp:TemplateField HeaderText="Current salary">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("current_salary", "{0:c}") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--Desired salary--%>
                    <asp:TemplateField HeaderText="Desired salary">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("desired_salary", "{0:c}") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>

        <div class="">
            <object />
            <iframe src="TestIframe.aspx" id="wordResume" runat="server"></iframe>
        </div>




    </div>
</asp:Content>

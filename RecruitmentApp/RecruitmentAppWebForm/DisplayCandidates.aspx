<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayCandidates.aspx.cs" Inherits="RecruitmentAppWebForm.DisplayCandidates" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <div class="form-group">
        <div class="row">
            <label id="lblTitle" class="col-md-1" style="color: lightgray">Job title:</label>
            <div class="col-md-3">
                <asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="jobDropDown" DataTextField="position" DataValueField="job_id" runat="server" OnSelectedIndexChanged="jobDropDown_SelectedIndexChanged" />
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-3 col-sm-3 col-xs-3">
            <asp:DataList EnableViewState="true" DataKeyField="applicant_id" BackColor="#d4d4d4" OnSelectedIndexChanged="applicantList_SelectedIndexChanged" CssClass="table-bordered" ID="applicantList" runat="server">
                <HeaderTemplate>
                    <label class="text-center" style="text-align: center; color: lightgray">Applicants</label>
                </HeaderTemplate>

                <HeaderStyle BackColor="#1C5E55" />
                <ItemTemplate>
                    <asp:LinkButton Text='<%# Eval("first_name") + " " + Eval("last_name") %>' CommandName="Select" runat="server" />
                    <asp:Label ID="applicantID" runat="server" Visible="false" Text='<%# Eval("applicant_id") %>' />
                </ItemTemplate>
            </asp:DataList>
        </div>

        <div class="col-md-4">
            <asp:DetailsView runat="server" ID="candidateDetails" BackColor="#d4d4d4" CssClass="table" AutoGenerateRows="false" EnableViewState="false">
                <HeaderTemplate>
                    <label>Selected Applicant</label>
                </HeaderTemplate>

                <FooterTemplate>
                    <div>
                        <asp:CheckBox ID="chkInterview" runat="server" />

                        <label for="chkInteview">Select For Interview</label>

                    </div>
                    <div class="col-md-4">
                         Date:  <input type="text" id="datepicker1">
                        <asp:Button ID="btnSelect" runat="server" CausesValidation="False"  OnClientClick="btnSelect_Click"  CssClass="btn btn-primary" Text="Select for Interview" />
                    </div>

                </FooterTemplate>
                <FooterStyle BackColor="#1C5E55" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="true" ForeColor="lightgray" />
                <CommandRowStyle BackColor="lightgray" />

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
            <iframe src="TestIframe.aspx" id="wordResume" runat="server" style="width: 40%; height: 400px"></iframe>
        </div>




    </div>
</asp:Content>

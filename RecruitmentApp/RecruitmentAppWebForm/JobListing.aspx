﻿<%@ Page Title="Job Listings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobListing.aspx.cs" Inherits="RecruitmentAppWebForm.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12">


        <%--Search Bar--%>
        <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-offset-2 col-sm-offset-2 xs-offset-2">
                    <%--<div class="row">--%>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" ID="keywords" placeholder="Job title, keywords, or company" CssClass="form-control" Height="45px" />
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="location" placeholder="Location, Zip" CssClass="form-control" Height="45px" />
                    </div>
                    <div class="col-md-3">
                        <div class="col-m2">
                            <asp:Button runat="server" Text="Search" CssClass="btn btn-primary" OnClick="searchJobs" />
                        </div>
                        <div class="co-md-1">
                            <asp:Label runat="server" ID="Label1" CssClass="text-danger" Display="dynamic" />
                        </div>
                    </div>
                    <%--</div>--%>
                </div>
            </div>
        </div>

        <%--List--%>
        <div class="row">
            <asp:Label runat="server" ID="sqlErrorMessage" CssClass="text-danger" Display="dynamic" />
        </div>
        <div class="table table-bordered table-condensed">
            <div class="text-center">
                <asp:Label ID="lblApplication" CssClass="glyphicon-align-center" runat="server" Visible="false" Text="">
                    <h1 style="color:#1C5E55">
                        Your application has been submitted! You should receive and email shortly. <asp:HyperLink runat="server" NavigateUrl="~/Apply.aspx">Click here to view all your submissions</asp:HyperLink> 
                    </h1>
                </asp:Label>
                <asp:Label ID="lblAppError" CssClass="glyphicon-align-center" runat="server" Visible="false" Text="">
                    <h1 style="color: red">
                        You already applied for that position!
                    </h1>
                </asp:Label>
            </div>
            <div class="col-md-6 ">
                <div class="table table-bordered table-condensed" style="background-color:lightgray">
                    <asp:ListView ID="lstViewJobs" OnSelectedIndexChanging="lstViewJobs_SelectedIndexChanging" DataKeyNames="job_id" runat="server">
                    
                        <ItemTemplate >
                            <div class="itemRow" style="background-color:lightgray">
                                <div class="row">

                                    <div class="col-md-4">
                                        <asp:LinkButton ID="lstViewSelects" runat="server" CommandName="Select">
                                            <asp:Label ID="lstViewposition" runat="server" Text='<%# Eval("position") %>' ForeColor="#1C5E55" Font-Size="Larger"  Font-Bold="True"></asp:Label>
                                        </asp:LinkButton>

                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="">
                                            <asp:Label ID="lstViewcompName" runat="server" Text='<%# Eval("company_name") %>'></asp:Label>
                                            <asp:Label ID="jobID" runat="server" Visible="false" Text='<%# Eval("job_id") %>'></asp:Label>
                                        </div>
                                        <div class="">
                                            <asp:Label ID="lstViewCity" runat="server" Text='<%# Eval("jobCity") %>'></asp:Label>,
                        <asp:Label ID="lstViewState" runat="server" Text='<%# Eval("jobState") %>'></asp:Label>
                                        </div>
                                    </div>
                                        </div>
                            </div>
                            <hr />
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>

            <div class="col-md-6" style="height: 450px; overflow: auto;">

                <asp:DetailsView ID="DetailsView1" ForeColor="#333333" GridLines="None" runat="server" DataSourceID="ObjectDataSource1"
                    CssClass="table table-bordered table-condensed" EnableViewState="False" AutoGenerateRows="False">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                    <HeaderTemplate>

                        <asp:Button ID="btnApply" runat="server" CssClass="button button1 btn btn-primary" OnClick="btnApply_Click" Text="Apply" />

                    </HeaderTemplate>

                    <Fields>
                        <asp:BoundField DataField="company_name" HeaderText="Company" SortExpression="company_name" />
                        <asp:TemplateField ShowHeader="false">
                            <ItemStyle Height="100px" />

                            <ItemTemplate>
                                <asp:Label runat="server" Font-Bold="true" Font-Underline="true" Font-Names="Arial" Font-Size="Larger" Text="">Description</asp:Label><br />
                                <asp:Label runat="server" Font-Names="Arial" Text='<%# Eval("description")%>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="job_id" HeaderText="Job ID" SortExpression="job_id" />
                        <asp:BoundField DataField="position" HeaderText="Position name" SortExpression="position" />
                        
                        <asp:BoundField DataField="category" HeaderText="Industry" SortExpression="category" />
                        <asp:BoundField DataField="salary_min" HeaderText="Minimum salary" SortExpression="salary_min"  />
                        <asp:BoundField DataField="salary_max" HeaderText="Maximum salary" SortExpression="salary_max" />
                        <asp:BoundField DataField="level" HeaderText="Job level" SortExpression="level" />
                        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                        <asp:BoundField DataField="responsibility" HeaderText="Responsibilities" SortExpression="responsibility" />
                        <asp:BoundField DataField="qualification" HeaderText="Qualification" SortExpression="qualification" />
                        <asp:BoundField DataField="posting_date" HeaderText="Posting date" SortExpression="posting_date" />
                        <asp:TemplateField HeaderText="Location">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("jobCity") + ", " + Eval("jobState") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>

                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                </asp:DetailsView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="displayJobs" TypeName="RecruitmentAppWebForm.Models.JobsDB">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="jobId" SessionField="job_id" Type="Int32" />

                    </SelectParameters>

                </asp:ObjectDataSource>

            </div>
            <%--<div class="col-md-6" style="height: 300px; overflow: auto;">
                <asp:FormView ID="frmlstJobs" ForeColor="#333333" runat="server"
                    CssClass="table table-bordered table-condensed" EnableViewState="False" DataSourceID="ObjectDataSource1">
                    <EditItemTemplate>
                        job_id:
                    <asp:TextBox ID="job_idTextBox" runat="server" Text='<%# Bind("job_id") %>' />
                        <br />
                        company_id:
                    <asp:TextBox ID="company_idTextBox" runat="server" Text='<%# Bind("company_id") %>' />
                        <br />
                        position:
                    <asp:TextBox ID="positionTextBox" runat="server" Text='<%# Bind("position") %>' />
                        <br />
                        company_name:
                    <asp:TextBox ID="company_nameTextBox" runat="server" Text='<%# Bind("company_name") %>' />
                        <br />
                        category:
                    <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
                        <br />
                        emp_id:
                    <asp:TextBox ID="emp_idTextBox" runat="server" Text='<%# Bind("emp_id") %>' />
                        <br />
                        salary_min:
                    <asp:TextBox ID="salary_minTextBox" runat="server" Text='<%# Bind("salary_min") %>' />
                        <br />
                        salary_max:
                    <asp:TextBox ID="salary_maxTextBox" runat="server" Text='<%# Bind("salary_max") %>' />
                        <br />
                        level:
                    <asp:TextBox ID="levelTextBox" runat="server" Text='<%# Bind("level") %>' />
                        <br />
                        description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                        <br />
                        responsibility:
                    <asp:TextBox ID="responsibilityTextBox" runat="server" Text='<%# Bind("responsibility") %>' />
                        <br />
                        qualification:
                    <asp:TextBox ID="qualificationTextBox" runat="server" Text='<%# Bind("qualification") %>' />
                        <br />
                        posting_date:
                    <asp:TextBox ID="posting_dateTextBox" runat="server" Text='<%# Bind("posting_date") %>' />
                        <br />
                        filled:
                    <asp:CheckBox ID="filledCheckBox" runat="server" Checked='<%# Bind("filled") %>' />
                        <br />
                        jobCity:
                    <asp:TextBox ID="jobCityTextBox" runat="server" Text='<%# Bind("jobCity") %>' />
                        <br />
                        jobState:
                    <asp:TextBox ID="jobStateTextBox" runat="server" Text='<%# Bind("jobState") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        job_id:
                    <asp:TextBox ID="job_idTextBox" runat="server" Text='<%# Bind("job_id") %>' />
                        <br />
                        company_id:
                    <asp:TextBox ID="company_idTextBox" runat="server" Text='<%# Bind("company_id") %>' />
                        <br />
                        position:
                    <asp:TextBox ID="positionTextBox" runat="server" Text='<%# Bind("position") %>' />
                        <br />
                        company_name:
                    <asp:TextBox ID="company_nameTextBox" runat="server" Text='<%# Bind("company_name") %>' />
                        <br />
                        category:
                    <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
                        <br />
                        emp_id:
                    <asp:TextBox ID="emp_idTextBox" runat="server" Text='<%# Bind("emp_id") %>' />
                        <br />
                        salary_min:
                    <asp:TextBox ID="salary_minTextBox" runat="server" Text='<%# Bind("salary_min") %>' />
                        <br />
                        salary_max:
                    <asp:TextBox ID="salary_maxTextBox" runat="server" Text='<%# Bind("salary_max") %>' />
                        <br />
                        level:
                    <asp:TextBox ID="levelTextBox" runat="server" Text='<%# Bind("level") %>' />
                        <br />
                        description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                        <br />
                        responsibility:
                    <asp:TextBox ID="responsibilityTextBox" runat="server" Text='<%# Bind("responsibility") %>' />
                        <br />
                        qualification:
                    <asp:TextBox ID="qualificationTextBox" runat="server" Text='<%# Bind("qualification") %>' />
                        <br />
                        posting_date:
                    <asp:TextBox ID="posting_dateTextBox" runat="server" Text='<%# Bind("posting_date") %>' />
                        <br />
                        filled:
                    <asp:CheckBox ID="filledCheckBox" runat="server" Checked='<%# Bind("filled") %>' />
                        <br />
                        jobCity:
                    <asp:TextBox ID="jobCityTextBox" runat="server" Text='<%# Bind("jobCity") %>' />
                        <br />
                        jobState:
                    <asp:TextBox ID="jobStateTextBox" runat="server" Text='<%# Bind("jobState") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        job_id:
                    <asp:Label ID="job_idLabel" runat="server" Text='<%# Bind("job_id") %>' />
                        <br />
                        company_id:
                    <asp:Label ID="company_idLabel" runat="server" Text='<%# Bind("company_id") %>' />
                        <br />
                        position:
                    <asp:Label ID="positionLabel" runat="server" Text='<%# Bind("position") %>' />
                        <br />
                        company_name:
                    <asp:Label ID="company_nameLabel" runat="server" Text='<%# Bind("company_name") %>' />
                        <br />
                        category:
                    <asp:Label ID="categoryLabel" runat="server" Text='<%# Bind("category") %>' />
                        <br />
                        emp_id:
                    <asp:Label ID="emp_idLabel" runat="server" Text='<%# Bind("emp_id") %>' />
                        <br />
                        salary_min:
                    <asp:Label ID="salary_minLabel" runat="server" Text='<%# Bind("salary_min") %>' />
                        <br />
                        salary_max:
                    <asp:Label ID="salary_maxLabel" runat="server" Text='<%# Bind("salary_max") %>' />
                        <br />
                        level:
                    <asp:Label ID="levelLabel" runat="server" Text='<%# Bind("level") %>' />
                        <br />
                        description:
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' />
                        <br />
                        responsibility:
                    <asp:Label ID="responsibilityLabel" runat="server" Text='<%# Bind("responsibility") %>' />
                        <br />
                        qualification:
                    <asp:Label ID="qualificationLabel" runat="server" Text='<%# Bind("qualification") %>' />
                        <br />
                        posting_date:
                    <asp:Label ID="posting_dateLabel" runat="server" Text='<%# Bind("posting_date") %>' />
                        <br />
                        filled:
                    <asp:CheckBox ID="filledCheckBox" runat="server" Checked='<%# Bind("filled") %>' Enabled="false" />
                        <br />
                        jobCity:
                    <asp:Label ID="jobCityLabel" runat="server" Text='<%# Bind("jobCity") %>' />
                        <br />
                        jobState:
                    <asp:Label ID="jobStateLabel" runat="server" Text='<%# Bind("jobState") %>' />
                        <br />

                    </ItemTemplate>
                </asp:FormView>
            </div>--%>
        </div>

    </div>

</asp:Content>

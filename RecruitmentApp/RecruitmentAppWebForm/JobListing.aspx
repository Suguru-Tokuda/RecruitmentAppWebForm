<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobListing.aspx.cs" Inherits="RecruitmentAppWebForm.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--Search Bar--%>

    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-md-offset-2 col-sm-offset-2 xs-offset-2">
                <%--<div class="row">--%>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="keywords" placeholder="Job title, keywords, or company" CssClass="form-control" />
                </div>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="location" placeholder="Location, Zip" CssClass="form-control" />
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

            <div class="col-md-6 ">
                     <asp:ListView ID="lstViewJobs" CssClass="table table-bordered table-condensed" OnSelectedIndexChanging="lstViewJobs_SelectedIndexChanging" DataKeyNames="job_id" runat="server">

                        <%--                        <AlternatingItemTemplate>
                            <div class="altRow">
                                <div class="row">

                                    <div class="col-md-4">
                                        <asp:LinkButton ID="lstViewSelect" runat="server" CommandName="Select"><asp:Label ID="lstViewposition" runat="server"  Text='<%# Eval("position") %>' ForeColor="Blue" Font-Size="Larger" Font-Bold="True"></asp:Label></asp:LinkButton>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="">
                                            <asp:Label ID="lstViewcompName" runat="server" Text='<%# Eval("company_name") %>'></asp:Label>
                                        </div>
                                        <div class="">
                                            <asp:Label ID="lstViewCity" runat="server" Text='<%# Eval("jobCity") %>'></asp:Label>,
                        <asp:Label ID="lstViewState" runat="server" Text='<%# Eval("posting_date") %>'></asp:Label>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <hr />
                        </AlternatingItemTemplate>--%>
                        <ItemTemplate>
                            <div class="itemRow">
                                <div class="row">

                                    <div class="col-md-4">
                                        <asp:LinkButton ID="lstViewSelects" runat="server" CommandName="Select">
                                            <asp:Label ID="lstViewposition" runat="server" Text='<%# Eval("position") %>' ForeColor="Blue" Font-Size="Larger" Font-Bold="True"></asp:Label></asp:LinkButton>

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
                        <asp:Label ID="lstViewState" runat="server" Text='<%# Eval("posting_date") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-offset-1">
                                        <asp:LinkButton ID="lstViewSelect" runat="server" CommandName="Select" Text="View Details"></asp:LinkButton>
                                    </div>

                                </div>
                            </div>
                            <hr />
                        </ItemTemplate>
                    </asp:ListView>
                </div>

            <div class="col-md-6 ">
               


                    <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="ObjectDataSource1" CssClass="table table-bordered table-condensed"></asp:DetailsView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="displayJobs" TypeName="RecruitmentAppWebForm.Models.JobsDB">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="1" Name="jobId" SessionField="job_id" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

            </div>



</asp:Content>

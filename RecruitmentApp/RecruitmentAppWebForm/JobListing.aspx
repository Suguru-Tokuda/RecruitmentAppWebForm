<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobListing.aspx.cs" Inherits="RecruitmentAppWebForm.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <div class="row">
        <div class="form-group">
            <%--<div class="col-md-6 col-sm-6 col-xs-6">--%>
                <asp:TextBox runat="server" ID="keywords" placeholder="Keywords: Job title, keywords, or company" CssClass="form-control col-md-6" />
            <%--</div>--%>
            <div class="col-md-2 col-sm-2 col-xs-2">
                <asp:TextBox runat="server" ID="location" placeholder="Location" CssClass="form-control" />
            </div>
            <asp:Button runat="server" Text="Search" CssClass="btn btn-primary col-md-1 col-sm-1 col-xs-1"/>
        </div>
    </div>
    <div class="row">
        <asp:Label runat="server" ID="sqlErrorMessage" CssClass="text-danger" Display="dynamic" />
    </div>
    <div class="col-md-12">
        <div class="table table-bordered table-condensed">

            <div class="col-md-6 ">
                <div class="table table-bordered table-condensed">
                    <asp:ListView ID="lstViewJobs" runat="server">

                        <AlternatingItemTemplate>
                            <div class="altRow">
                                <div class="row">

                                    <div class="col-md-4">
                                        <asp:Label ID="lstViewposition" runat="server" Text='<%# Eval("position") %>' ForeColor="Blue" Font-Size="Larger" Font-Bold="True"></asp:Label>
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
                        </AlternatingItemTemplate>
                        <ItemTemplate>
                            <div class="itemRow">
                                <div class="row">

                                    <div class="col-md-4">
                                        <asp:Label ID="lstViewposition" runat="server" Text='<%# Eval("position") %>' ForeColor="Blue" Font-Size="Larger" Font-Bold="True"></asp:Label>
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
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
            <div class="col-md-6 ">
<%--                <div class="table table-bordered table-condensed">
                    <div class="row">
                        Stuff1
                    </div>
                    <div class="row">
                        Stuff2
                    </div>
                </div>--%>
                <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="ObjectDataSource1"></asp:DetailsView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
            </div>
        </div>
    </div>


</asp:Content>

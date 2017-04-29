<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobListing.aspx.cs" Inherits="RecruitmentAppWebForm.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-6 ">
        <div class="table table-bordered table-condensed">
            <asp:ListView ID="frmViewJobs" runat="server">
                <ItemTemplate>
                    <div class="itemRow">
                        <div class="row">

                            <div class="col-md-4">
                                <asp:Label ID="frmViewposition" runat="server" Text='<%# Eval("position") %>' ForeColor="Blue" Font-Size="Larger" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <div class="">
                                    <asp:Label ID="frmViewcompName" runat="server" Text='<%# Eval("company_name") %>'></asp:Label>
                                </div>
                                <div class="">
                                    <asp:Label ID="frmViewCity" runat="server" Text='<%# Eval("jobCity") %>'></asp:Label>,
                        <asp:Label ID="frmViewState" runat="server" Text='<%# Eval("posting_date") %>'></asp:Label>
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
        <div class="table table-bordered table-condensed">
             Stuff
        </div>
       
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>


</asp:Content>

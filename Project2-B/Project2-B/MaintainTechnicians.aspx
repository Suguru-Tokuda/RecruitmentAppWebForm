<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainTechnicians.aspx.cs" Inherits="Project2_B.MaintainTechnicians" MasterPageFile="~/Site1.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <div class="form-group">
        <div class="form-horizontal">
            <div class="col-md-3 col-sm-3 col-xs-3">
                <asp:Label runat="server" Text="Select a technician"></asp:Label>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3">
                <asp:DropDownList AutoPostBack="True" runat="server" ID="technicianName" CssClass="form-control" DataSourceID="TechnicianDataSource1" DataTextField="Name" DataValueField="TechID" />
                <asp:SqlDataSource ID="TechnicianDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [techID], [name] FROM [Technicians]"></asp:SqlDataSource>
            </div>
        </div>
    </div>

    <asp:FormView runat="server" DataKeyNames="TechID" DataSourceID="TechnicianDataSource2" CssClass="table" OnItemInserted="itemInserted" OnItemUpdated="itemUpdated" OnItemDeleted="itemDeleted" ID="technicianFormView">
        <HeaderTemplate>
            Selected Technician
        </HeaderTemplate>
        <HeaderStyle BackColor="Black" ForeColor="White" CssClass="col-md-12 col-sm-12 col-xs-12" />

        <%--Edit--%>
        <EditItemTemplate>
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-3 col-sm-3 col-xs-3">TechID:</label>
                    <div class="col-md-5 col-sm-5 col-xs-5">
                        <asp:Label ID="TechIDLabel1" runat="server" Text='<%# Eval("TechID") %>' />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 col-sm-3 col-xs-3">Name:</label>
                    <div class="col-md-5 col-sm-5 col-xs-5">
                        <asp:TextBox CssClass="form-control" ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4">
                        <asp:RequiredFieldValidator ID="nameTextBoxRequiredFieldValidator" runat="server" ErrorMessage="Enter name" CssClass="text-danger" ControlToValidate="NameTextBox" Display="Dynamic" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 col-sm-3 col-xs-3">Email:</label>
                    <div class="col-md-5 col-sm-5 col-xs-5">
                        <asp:TextBox CssClass="form-control" ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4">
                        <asp:RequiredFieldValidator ID="editEmailTextBoxRequiredFieldValidator" runat="server" ErrorMessage="Enter email" CssClass="text-danger" ControlToValidate="EmailTextBox" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="editEmailTextBoxRgxValidator" runat="server" ErrorMessage="Put right email format" CssClass="text-danger" ControlToValidate="EmailTextBox" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 col-sm-3 col-xs-3">Phone:</label>
                    <div class="col-md-5 col-sm-5 col-xs-5">
                        <asp:TextBox CssClass="form-control" ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4">
                        <asp:RequiredFieldValidator ID="editPhoneTextBoxRequiredFieldValidator" runat="server" ErrorMessage="Enter phone number" CssClass="text-danger" ControlToValidate="PhoneTextBox" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="editPhoneTextBoxRgxValidator" runat="server" ErrorMessage="Enter in the correct format:<br>xxx-xxx-xxxx" CssClass="text-danger" ControlToValidate="PhoneTextBox" Display="Dynamic" ValidationExpression="\d{3}-\d{3}-\d{4}" />
                    </div>
                </div>
            </div>


            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            <asp:Label runat="server" ID="updateErrorMessage" CssClass="text-danger" />

        </EditItemTemplate>

        <%--Insert--%>
        <InsertItemTemplate>
            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-3">Name:</label>
                <div class="col-md-5 col-sm-5 col-xs-5">
                    <asp:TextBox CssClass="form-control" ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <asp:RequiredFieldValidator ID="nameTextBoxRequiredFieldValidator" runat="server" ErrorMessage="Enter name" CssClass="text-danger" ControlToValidate="NameTextBox" Display="Dynamic" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-3">Email:</label>
                <div class="col-md-5 col-sm-5 col-xs-5">
                    <asp:TextBox CssClass="form-control " ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <asp:RequiredFieldValidator ID="emailTextBoxRequiredFieldValidator" runat="server" ErrorMessage="Enter email" CssClass="text-danger" ControlToValidate="EmailTextBox" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="emailTextBoxRgxValidator" runat="server" ErrorMessage="Put right email format" CssClass="text-danger" ControlToValidate="EmailTextBox" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-3">Phone:</label>
                <div class="col-md-5 col-sm-5 col-xs-5">
                    <asp:TextBox CssClass="form-control" ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <asp:RequiredFieldValidator ID="phoneTextBoxRequiredFieldValidator" runat="server" ErrorMessage="Enter phone number" CssClass="text-danger" ControlToValidate="PhoneTextBox" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="phoneTextBoxRgxValidator" runat="server" ErrorMessage="Enter in the correct format:<br>xxx-xxx-xxxx" CssClass="text-danger" ControlToValidate="PhoneTextBox" Display="Dynamic" ValidationExpression="\d{3}-\d{3}-\d{4}" />
                </div>
            </div>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>

        <ItemTemplate>
            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-3">TechID:</label>
                <asp:Label CssClass="col-md-5 col-sm-5 col-xs-5" ID="TechIDLabel2" runat="server" Text='<%# Eval("TechID") %>' />
            </div>

            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-3">Name:</label>
                <asp:Label CssClass="col-md-5 col-sm-5 col-xs-5" ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            </div>

            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-3">Email:</label>
                <asp:Label CssClass="col-md-3 col-sm-3 col-xs-3" ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            </div>

            <div class="form-group">
                <label class="col-md-3 col-sm-3 col-xs-3">Phone:</label>
                <asp:Label CssClass="col-md-3 col-sm-3 col-sx-3" ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
            </div>
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>

    <div class="form-group">
        <div class="col-md-3 col-sm-3 col-xs-3">
            <asp:Label runat="server" ID="sqlErrorMessage" CssClass="text-danger" />
        </div>
    </div>


    <asp:SqlDataSource ID="TechnicianDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Technicians] WHERE ([TechID] = @TechID)" DeleteCommand="DELETE FROM [Technicians] WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone" InsertCommand="INSERT INTO [Technicians] ([Name], [Email], [Phone]) VALUES (@Name, @Email, @Phone)" UpdateCommand="UPDATE [Technicians] SET [Name] = @Name, [Email] = @Email, [Phone] = @Phone WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_TechID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="technicianName" Name="TechID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="original_TechID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="courseworkAD.data" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #MainContent_GridView1 th a, #MainContent_GridView2 th a, #MainContent_GridView3 th a, #MainContent_GridView4 th a, #MainContent_GridView5 th a {
            color: black
        }

        table {
            border: none;
        }

        th, td, a {
            border: none;
            padding: 10px;
        }
    </style>
    <br />
    <h2>Customers</h2>
    <%----------------------------------------Customer-----------------------------------------------------%>
    <asp:GridView ID="GridView1" class="table-active table-striped" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CUSTOMERID" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>

            <%-- <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />--%>
            <asp:BoundField DataField="CUSTOMERID" HeaderText="CUSTOMERID" ReadOnly="True" SortExpression="CUSTOMERID" />
            <asp:BoundField DataField="CUSTOMERNAME" HeaderText="CUSTOMERNAME" SortExpression="CUSTOMERNAME" />
            <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
            <asp:BoundField DataField="PHONE" HeaderText="PHONE" SortExpression="PHONE" />
            <asp:BoundField DataField="LOYALTYPOINT" HeaderText="LOYALTYPOINT" SortExpression="LOYALTYPOINT" />
            <asp:TemplateField HeaderText="OPERATIONS">
                <ItemTemplate>
                    <asp:Button ID="deleteBtn" runat="server" CommandName="Delete" class="btn btn-danger" Text="Delete" OnClientClick="return confirm('Do you want to delete this data?');" />
                    <asp:Button ID="editBtn" runat="server" CommandName="Edit" class="btn btn-success" Text="Edit" OnClientClick="return confirm('Do you want to edit this data?');" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="updateBtn" runat="server" CommandName="Update" class="btn btn-success" Text="Update" OnClientClick="return confirm('Do you want to Update this data?');" />
                    <asp:Button ID="cancelBtn" runat="server" CommandName="Cancel" class="btn btn-danger" Text="Cancel" OnClientClick="return confirm('Do you want to cancel this data?');" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM CW.CUSTOMER WHERE (CUSTOMERID = :PARAM1)" InsertCommand="INSERT INTO CW.CUSTOMER(CUSTOMERID, CUSTOMERNAME, ADDRESS, PHONE, LOYALTYPOINT) VALUES (:PARAM1, :PARAM2, :PARAM3, :PARAM4, :PARAM5)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CUSTOMER&quot;" UpdateCommand="UPDATE CW.CUSTOMER SET CUSTOMERNAME = :PARAM1, ADDRESS = :PARAM2, PHONE = :PARAM3, LOYALTYPOINT = :PARAM4 WHERE (CUSTOMERID = :PARAM5)">
        <DeleteParameters>
            <asp:Parameter Name="CUSTOMERID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CUSTOMERID" Type="String" />
            <asp:Parameter Name="CUSTOMERNAME" Type="String" />
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="PHONE" Type="String" />
            <asp:Parameter Name="LOYALTYPOINT" Type="String" />
        </InsertParameters>

        <UpdateParameters>
            <asp:Parameter Name="CUSTOMERNAME" Type="String" />
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="PHONE" Type="String" />
            <asp:Parameter Name="LOYALTYPOINT" Type="String" />
            <asp:Parameter Name="CUSTOMERID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CUSTOMERID" DataSourceID="SqlDataSource2" OnPageIndexChanging="FormView1_PageIndexChanging">
        <EditItemTemplate>
            CUSTOMERID:
            <asp:TextBox ID="CUSTOMERIDLabel1" runat="server" Text='<%# Bind("CUSTOMERID") %>' />
            <asp:RequiredFieldValidator ControlToValidate="CUSTOMERIDLabel1" runat="server" ErrorMessage="Id is required"></asp:RequiredFieldValidator>
            <br />
            CUSTOMERNAME:
            <asp:TextBox ID="CUSTOMERNAMETextBox" runat="server" Text='<%# Bind("CUSTOMERNAME") %>' />
            <asp:RequiredFieldValidator ControlToValidate="CUSTOMERNAMETextBox" runat="server" ErrorMessage="Id is required"></asp:RequiredFieldValidator>
            <br />
            ADDRESS:
            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
            <asp:RequiredFieldValidator ControlToValidate="ADDRESSTextBox" runat="server" ErrorMessage="Id is required"></asp:RequiredFieldValidator>
            <br />
            PHONE:
            <asp:TextBox ID="PHONETextBox" runat="server" Text='<%# Bind("PHONE") %>' />
            <asp:RequiredFieldValidator ControlToValidate="PHONETextBox" runat="server" ErrorMessage="Id is required"></asp:RequiredFieldValidator>
            <br />
            LOYALTYPOINT:
            <asp:TextBox ID="LOYALTYPOINTTextBox" runat="server" Text='<%# Bind("LOYALTYPOINT") %>' />
            <asp:RequiredFieldValidator ControlToValidate="LOYALTYPOINTTextBox" runat="server" ErrorMessage="Id is required"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <%-----------------------------------Validation------------------------------------%>
            CUSTOMERID:
            <asp:TextBox ID="CUSTOMERIDLabel1" runat="server" Text='<%# Bind("CUSTOMERID") %>' />
            <asp:RequiredFieldValidator ControlToValidate="CUSTOMERIDLabel1" runat="server" ErrorMessage="Id is required"></asp:RequiredFieldValidator>
            <br />
            CUSTOMERNAME:
            <asp:TextBox ID="CUSTOMERNAMETextBox" runat="server" Text='<%# Bind("CUSTOMERNAME") %>' />
            <asp:RequiredFieldValidator ControlToValidate="CUSTOMERNAMETextBox" runat="server" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
            <br />
            ADDRESS:
            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
            <asp:RequiredFieldValidator ControlToValidate="ADDRESSTextBox" runat="server" ErrorMessage="Address is required"></asp:RequiredFieldValidator>
            <br />
            PHONE:
            <asp:TextBox ID="PHONETextBox" runat="server" Text='<%# Bind("PHONE") %>' />
            <asp:RequiredFieldValidator ControlToValidate="PHONETextBox" runat="server" ErrorMessage="Phone is required"></asp:RequiredFieldValidator>
            <br />
            LOYALTYPOINT:
            <asp:TextBox ID="LOYALTYPOINTTextBox" runat="server" Text='<%# Bind("LOYALTYPOINT") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" class="btn btn-success" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" class="btn btn-success" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" class="btn btn-primary" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>

    </asp:FormView>


</asp:Content>


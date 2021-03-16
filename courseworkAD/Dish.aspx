<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dish.aspx.cs" Inherits="courseworkAD.Dish" %>


<asp:Content ID ="BodyContent" ContentPlaceHolderID= "MainContent" runat="server">
    <style>
       #MainContent_GridView4 th a{
           color: black
       }
       table{
           border: none;
       }

        th,  td, a{
           border: none; 
           padding:10px;
       }
    </style>
    <br/>
    <h2>Dish</h2>
<%-----------------------------------DISH-----------------------------------------------------%>
    <asp:GridView ID="GridView4" class="table-active table-striped" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DISHID" DataSourceID="SqlDataSource4">
        <Columns>
            

            <%--<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />--%>
            <asp:BoundField DataField="DISHID" HeaderText="DISHID" ReadOnly="True" SortExpression="DISHID" />
            <asp:BoundField DataField="DISHNAME" HeaderText="DISHNAME" SortExpression="DISHNAME" />
            <asp:BoundField DataField="LOCALNAME" HeaderText="LOCALNAME" SortExpression="LOCALNAME" />
            <asp:BoundField DataField="LOYALTYID" HeaderText="LOYALTYID" SortExpression="LOYALTYID" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="deleteBtn" runat="server" CommandName="Delete" class="btn btn-danger" Text="Delete" OnClientClick="return confirm('Do you want to delete this data?');" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="editBtn" runat="server" CommandName="Edit" class="btn btn-success" Text="Edit" OnClientClick="return confirm('Do you want to edit this data?');" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="updateBtn" runat="server" CommandName="Update" class="btn btn-success" Text="Update" OnClientClick="return confirm('Do you want to Update this data?');" />
                    <asp:Button ID="cancelBtn" runat="server" CommandName="Cancel" class="btn btn-danger" Text="Cancel" OnClientClick="return confirm('Do you want to cancel this data?');" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM CW.DISH WHERE (DISHID = :PARAM1)" InsertCommand="INSERT INTO CW.DISH(DISHID, DISHNAME, LOCALNAME, LOYALTYID) VALUES (:PARAM1, :PARAM2, :PARAM3, :PARAM4)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISHID, DISHNAME, LOCALNAME, LOYALTYID FROM CW.DISH" UpdateCommand="UPDATE CW.DISH SET DISHNAME = :PARAM1, LOCALNAME = :PARAM2, LOYALTYID = :PARAM3 WHERE (DISHID = :PARAM4)">
        <DeleteParameters>
            <asp:Parameter Name="DISHID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DISHID" Type="String" />
            <asp:Parameter Name="DISHNAME" Type="String" />
            <asp:Parameter Name="LOCALNAME" Type="String" />
            <asp:Parameter Name="LOYALTYID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DISHNAME" Type="String" />
            <asp:Parameter Name="LOCALNAME" Type="String" />
            <asp:Parameter Name="LOYALTYID" Type="String" />
            <asp:Parameter Name="DISHID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView4" runat="server" DataKeyNames="DISHID" DataSourceID="SqlDataSource4">
        <EditItemTemplate>
            DISHID:
            <asp:Label ID="DISHIDLabel1" runat="server" Text='<%# Eval("DISHID") %>' />
            <br />
            DISHNAME:
            <asp:TextBox ID="DISHNAMETextBox" runat="server" Text='<%# Bind("DISHNAME") %>' />
            <br />
            LOCALNAME:
            <asp:TextBox ID="LOCALNAMETextBox" runat="server" Text='<%# Bind("LOCALNAME") %>' />
            <br />
            LOYALTYID:
            <asp:TextBox ID="LOYALTYIDTextBox" runat="server" Text='<%# Bind("LOYALTYID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            DISHID:
            <asp:TextBox ID="DISHIDTextBox" runat="server" Text='<%# Bind("DISHID") %>' />
             <asp:RequiredFieldValidator ControlToValidate="DISHIDTextBox" runat="server" ErrorMessage="Id is required"></asp:RequiredFieldValidator>
            <br />
            DISHNAME:
            <asp:TextBox ID="DISHNAMETextBox" runat="server" Text='<%# Bind("DISHNAME") %>' />
             <asp:RequiredFieldValidator ControlToValidate="DISHNAMETextBox" runat="server" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
            <br />
            LOCALNAME:
            <asp:TextBox ID="LOCALNAMETextBox" runat="server" Text='<%# Bind("LOCALNAME") %>' />
             <asp:RequiredFieldValidator ControlToValidate="LOCALNAMETextBox" runat="server" ErrorMessage="Local name is required"></asp:RequiredFieldValidator>
            <br />
            LOYALTYID:
            <asp:TextBox ID="LOYALTYIDTextBox" runat="server" Text='<%# Bind("LOYALTYID") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" class="btn btn-success" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" class="btn btn-success" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" class="btn btn-primary" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    
</asp:Content>
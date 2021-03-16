<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Loyalty Points.aspx.cs" Inherits="courseworkAD.Loyalty_Points" %>


<asp:Content ID ="BodyContent" ContentPlaceHolderID= "MainContent" runat="server">
    <style>
       #MainContent_GridView3 th a{
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
    <h2>Loyalty Points</h2>
    <%--------------------------------LoyaltyPoint-----------------------------------------%>
    <asp:GridView ID="GridView3" class="table-active table-striped" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="LOYALTYID" DataSourceID="SqlDataSource3">
        <Columns>
           
            <%--<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />--%>
            <asp:BoundField DataField="LOYALTYID" HeaderText="LOYALTYID" ReadOnly="True" SortExpression="LOYALTYID" />
            <asp:BoundField DataField="LOYALTYPOINTS" HeaderText="LOYALTYPOINTS" SortExpression="LOYALTYPOINTS" />
            <asp:BoundField DataField="STARTDATE" HeaderText="STARTDATE" SortExpression="STARTDATE" />
            <asp:BoundField DataField="ENDDATE" HeaderText="ENDDATE" SortExpression="ENDDATE" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM CW.LOYALTYPOINT WHERE (LOYALTYID = :PARAM1)" InsertCommand="INSERT INTO CW.LOYALTYPOINT(LOYALTYID, LOYALTYPOINTS, STARTDATE, ENDDATE) VALUES (:PARAM1, :PARAM2, :PARAM3, :PARAM4)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LOYALTYPOINT&quot;" UpdateCommand="UPDATE CW.LOYALTYPOINT SET LOYALTYPOINTS = :PARAM1, STARTDATE = :PARAM2, ENDDATE = :PARAM3 WHERE (LOYALTYID = :PARAM4)">
        <DeleteParameters>
            <asp:Parameter Name="LOYALTYID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LOYALTYID" Type="String" />
            <asp:Parameter Name="LOYALTYPOINTS" Type="String" />
            <asp:Parameter Name="STARTDATE" Type="DateTime" />
            <asp:Parameter Name="ENDDATE" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LOYALTYPOINTS" Type="String" />
            <asp:Parameter Name="STARTDATE" Type="DateTime" />
            <asp:Parameter Name="ENDDATE" Type="DateTime" />
            <asp:Parameter Name="LOYALTYID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView3" runat="server" DataKeyNames="LOYALTYID" DataSourceID="SqlDataSource3">
        <EditItemTemplate>
            LOYALTYID:
            <asp:Label ID="LOYALTYIDLabel1" runat="server" Text='<%# Eval("LOYALTYID") %>' />
            <br />
            LOYALTYPOINTS:
            <asp:TextBox ID="LOYALTYPOINTSTextBox" runat="server" Text='<%# Bind("LOYALTYPOINTS") %>' />
            <br />
            STARTDATE:
            <asp:TextBox ID="STARTDATETextBox" runat="server" Text='<%# Bind("STARTDATE") %>' />
            <br />
            ENDDATE:
            <asp:TextBox ID="ENDDATETextBox" runat="server" Text='<%# Bind("ENDDATE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            LOYALTYID:
            <asp:TextBox ID="LOYALTYIDTextBox" runat="server" Text='<%# Bind("LOYALTYID") %>' />
            <asp:RequiredFieldValidator ControlToValidate="LOYALTYIDTextBox" runat="server" ErrorMessage="Id is required"></asp:RequiredFieldValidator>
            <br />
            LOYALTYPOINTS:
            <asp:TextBox ID="LOYALTYPOINTSTextBox" runat="server" Text='<%# Bind("LOYALTYPOINTS") %>' />
            <asp:RequiredFieldValidator ControlToValidate="LOYALTYPOINTSTextBox" runat="server" ErrorMessage="point is required"></asp:RequiredFieldValidator>
            <br />
            STARTDATE:
            <asp:TextBox ID="STARTDATETextBox" runat="server" Text='<%# Bind("STARTDATE") %>' />
            <br />
            ENDDATE:
            <asp:TextBox ID="ENDDATETextBox" runat="server" Text='<%# Bind("ENDDATE") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" class="btn btn-success" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" class="btn btn-success" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" class="btn btn-primary" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    
</asp:Content>
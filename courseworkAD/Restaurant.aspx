<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Restaurant.aspx.cs" Inherits="courseworkAD.Restaurant" %>


<asp:Content ID ="BodyContent" ContentPlaceHolderID= "MainContent" runat="server">
    <style>
       #MainContent_GridView2 th a{
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
            <h2>Restaurants</h2>
    <%------------------------------------------------Restaurant----------------------------------------%>
    <asp:GridView ID="GridView2" class="table-active table-striped" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RESTAURANTID" DataSourceID="SqlDataSource1">
        <Columns>
            
           <%-- <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />--%>
            <asp:BoundField DataField="RESTAURANTID" HeaderText="RESTAURANTID" ReadOnly="True" SortExpression="RESTAURANTID" />
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM CW.RESTAURANT WHERE (RESTAURANTID = :PARAM1)" InsertCommand="INSERT INTO CW.RESTAURANT(RESTAURANTID, &quot;NAME&quot;, ADDRESS) VALUES (:PARAM1, :PARAM2, :PARAM3)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;RESTAURANT&quot;" UpdateCommand="UPDATE CW.RESTAURANT SET &quot;NAME&quot; = :PARAM1, ADDRESS = :PARAM2 WHERE (RESTAURANTID = :PARAM3)">
        <DeleteParameters>
            <asp:Parameter Name="RESTAURANTID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="RESTAURANTID" Type="String" />
            <asp:Parameter Name="NAME" Type="String" />
            <asp:Parameter Name="ADDRESS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NAME" Type="String" />
            <asp:Parameter Name="ADDRESS" Type="String" />
            <asp:Parameter Name="RESTAURANTID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView2" runat="server" DataKeyNames="RESTAURANTID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            RESTAURANTID:
            <asp:Label ID="RESTAURANTIDLabel1" runat="server" Text='<%# Eval("RESTAURANTID") %>' />
            <br />
            NAME:
            <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
            <br />
            ADDRESS:
            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <%------------------------------Validation-------------------------------------------%>
            RESTAURANTID:
            <asp:TextBox ID="RESTAURANTIDTextBox" runat="server" Text='<%# Bind("RESTAURANTID") %>' />
            <asp:RequiredFieldValidator ControlToValidate="RESTAURANTIDTextBox" runat="server" ErrorMessage="Id is required"></asp:RequiredFieldValidator>
            <br />
            NAME:
            <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
            <asp:RequiredFieldValidator ControlToValidate="NAMETextBox" runat="server" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
            <br />
            ADDRESS:
            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
            <asp:RequiredFieldValidator ControlToValidate="ADDRESSTextBox" runat="server" ErrorMessage="Address is required"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" class="btn btn-success" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" class="btn btn-success" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" class="btn btn-primary" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    
</asp:Content>
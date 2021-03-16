<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="courseworkAD.Address" %>


<asp:Content ID ="BodyContent" ContentPlaceHolderID= "MainContent" runat="server">
    <style>
       #MainContent_GridView5 th a{
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
             <h2>ADDRESS</h2>
    <%--------------------------------------Address-----------------------------%>
    <asp:GridView class="table-active table-striped" ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DELIVERYID" DataSourceID="SqlDataSource5">
        <Columns>        

            <%--<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />--%>
            <asp:BoundField DataField="DELIVERYID" HeaderText="DELIVERYID" ReadOnly="True" SortExpression="DELIVERYID" />
            <asp:BoundField DataField="DELIVERYADDRESS" HeaderText="DELIVERYADDRESS" SortExpression="DELIVERYADDRESS" />
            <asp:BoundField DataField="LONGITUDE" HeaderText="LONGITUDE" SortExpression="LONGITUDE" />
            <asp:BoundField DataField="LATITUDE" HeaderText="LATITUDE" SortExpression="LATITUDE" />
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

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM CW.DELIVERYSTATUS WHERE (DELIVERYID = :PARAM1)" InsertCommand="INSERT INTO CW.DELIVERYSTATUS(DELIVERYID, DELIVERYADDRESS, LONGITUDE, LATITUDE) VALUES (:PARAM1, :PARAM2, :PARAM3, :PARAM4)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;DELIVERYSTATUS&quot;" UpdateCommand="UPDATE CW.DELIVERYSTATUS SET DELIVERYADDRESS = :PARAM1, LONGITUDE = :PARAM2, LATITUDE = :PARAM3 WHERE (DELIVERYID = :PARAM4)">
        <DeleteParameters>
            <asp:Parameter Name="DELIVERYID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DELIVERYID" Type="String" />
            <asp:Parameter Name="DELIVERYADDRESS" Type="String" />
            <asp:Parameter Name="LONGITUDE" Type="String" />
            <asp:Parameter Name="LATITUDE" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DELIVERYADDRESS" Type="String" />
            <asp:Parameter Name="LONGITUDE" Type="String" />
            <asp:Parameter Name="LATITUDE" Type="String" />
            <asp:Parameter Name="DELIVERYID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView5" runat="server" DataKeyNames="DELIVERYID" DataSourceID="SqlDataSource5">
        <EditItemTemplate>
            DELIVERYID:
            <asp:TextBox ID="DELIVERYIDLabel1" runat="server" Text='<%# Bind("DELIVERYID") %>' />
            <br />
            DELIVERYADDRESS:
            <asp:TextBox ID="DELIVERYADDRESSTextBox" runat="server" Text='<%# Bind("DELIVERYADDRESS") %>' />
            <br />
            LONGITUDE:
            <asp:TextBox ID="LONGITUDETextBox" runat="server" Text='<%# Bind("LONGITUDE") %>' />
            <br />
            LATITUDE:
            <asp:TextBox ID="LATITUDETextBox" runat="server" Text='<%# Bind("LATITUDE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" class="btn btn-success" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" class="btn btn-success" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            DELIVERYID:
            <asp:TextBox ID="DELIVERYIDTextBox" runat="server" Text='<%# Bind("DELIVERYID") %>' />
            <asp:RequiredFieldValidator ControlToValidate="DELIVERYIDTextBox" runat="server" ErrorMessage="Id is required"></asp:RequiredFieldValidator>
            <br />
            DELIVERYADDRESS:
            <asp:TextBox ID="DELIVERYADDRESSTextBox" runat="server" Text='<%# Bind("DELIVERYADDRESS") %>' />
            <asp:RequiredFieldValidator ControlToValidate="DELIVERYADDRESSTextBox" runat="server" ErrorMessage="Address is required"></asp:RequiredFieldValidator>
            <br />
            LONGITUDE:
            <asp:TextBox ID="LONGITUDETextBox" runat="server" Text='<%# Bind("LONGITUDE") %>' />
            <br />
            LATITUDE:
            <asp:TextBox ID="LATITUDETextBox" runat="server" Text='<%# Bind("LATITUDE") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" class="btn btn-success" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" class="btn btn-success" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" class="btn btn-primary" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    
</asp:Content>
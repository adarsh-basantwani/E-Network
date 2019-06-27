<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" CssClass="title" Text="Edit Profile"></asp:Label>
<hr />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        CellPadding="5" CellSpacing="10" DataKeyNames="EmailID" 
        DataSourceID="SqlProfile" Height="50px" Width="100%">
        <AlternatingRowStyle BackColor="#F0F0F0" />
        <Fields>
            <asp:BoundField DataField="EmailID" HeaderText="EmailID" ReadOnly="True" 
                SortExpression="EmailID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
            <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" 
                SortExpression="ContactNo" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="Collage" HeaderText="Collage" 
                SortExpression="Collage" />
            <asp:CommandField ShowEditButton="True" ButtonType="Button" />
        </Fields>
        <RowStyle BackColor="#EAFFEA" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlProfile" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [UserMaster] WHERE [EmailID] = @EmailID" 
        InsertCommand="INSERT INTO [UserMaster] ([EmailID], [Name], [Address], [ContactNo], [City], [Collage]) VALUES (@EmailID, @Name, @Address, @ContactNo, @City, @Collage)" 
        SelectCommand="SELECT [EmailID], [Name], [Address], [ContactNo], [City], [Collage] FROM [UserMaster] WHERE ([EmailID] = @EmailID)" 
        UpdateCommand="UPDATE [UserMaster] SET [Name] = @Name, [Address] = @Address, [ContactNo] = @ContactNo, [City] = @City, [Collage] = @Collage WHERE [EmailID] = @EmailID">
        <DeleteParameters>
            <asp:Parameter Name="EmailID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmailID" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="ContactNo" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Collage" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="EmailID" SessionField="userid" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="ContactNo" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Collage" Type="String" />
            <asp:Parameter Name="EmailID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
<hr />
</asp:Content>


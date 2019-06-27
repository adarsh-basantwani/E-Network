<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePhoto.aspx.cs" Inherits="ChangePhoto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" CssClass="title" 
        Text="Change Profile Photo"></asp:Label>
    <hr />
    Select Photo:<asp:FileUpload ID="fuPhoto" runat="server" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="fuPhoto" ErrorMessage="RequiredFieldValidator" 
        ForeColor="Red">*</asp:RequiredFieldValidator>
    <asp:Button ID="btnUpload" runat="server" onclick="btnUpload_Click" 
        Text="Upload" />
    <hr />
    <asp:SqlDataSource ID="sqlPhoto" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [UserMaster] WHERE [EmailID] = @EmailID" 
        InsertCommand="INSERT INTO [UserMaster] ([PhotoURL], [EmailID]) VALUES (@PhotoURL, @EmailID)" 
        SelectCommand="SELECT [PhotoURL], [EmailID] FROM [UserMaster]" 
        UpdateCommand="UPDATE [UserMaster] SET [PhotoURL] = @PhotoURL WHERE [EmailID] = @EmailID">
        <DeleteParameters>
            <asp:Parameter Name="EmailID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PhotoURL" Type="String" />
            <asp:Parameter Name="EmailID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="hfurl" Name="PhotoURL" PropertyName="Value" 
                Type="String" />
            <asp:SessionParameter Name="EmailID" SessionField="userid" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hfurl" runat="server" />
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UploadContents.aspx.cs" Inherits="UploadContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" CssClass="title" Text="Upload Contents"></asp:Label>
<hr />
<table width=100% >
<tr><td>Select Document</td><td>
    <asp:FileUpload ID="fuDoc" runat="server" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="fuDoc" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td></tr>
<tr><td>Title</td><td>
    <asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtTitle" ErrorMessage="RequiredFieldValidator" 
        ForeColor="Red">*</asp:RequiredFieldValidator>
    </td></tr>
<tr><td>Details</td><td>
    <asp:TextBox ID="txtDetails" runat="server" Rows="5" TextMode="MultiLine" 
        Width="300px"></asp:TextBox>
    </td></tr>
<tr><td>&nbsp;</td><td>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Upload" />
    </td></tr>
</table>
<hr />
<asp:Label ID="lbl" runat="server" ForeColor="#CC0000"></asp:Label>
<asp:SqlDataSource ID="sqlds" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    DeleteCommand="DELETE FROM [DocMaster] WHERE [DocID] = @DocID" 
    InsertCommand="INSERT INTO [DocMaster] ([FileName], [Title], [Details], [Owner]) VALUES (@FileName, @Title, @Details, @Owner)" 
    SelectCommand="SELECT * FROM [DocMaster]" 
    UpdateCommand="UPDATE [DocMaster] SET [FileName] = @FileName, [Title] = @Title, [Details] = @Details, [Owner] = @Owner WHERE [DocID] = @DocID">
    <DeleteParameters>
        <asp:Parameter Name="DocID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="fuDoc" Name="FileName" PropertyName="FileName" 
            Type="String" />
        <asp:ControlParameter ControlID="txtTitle" Name="Title" PropertyName="Text" 
            Type="String" />
        <asp:ControlParameter ControlID="txtDetails" Name="Details" PropertyName="Text" 
            Type="String" />
        <asp:SessionParameter Name="Owner" SessionField="userid" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="FileName" Type="String" />
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Details" Type="String" />
        <asp:Parameter Name="Owner" Type="String" />
        <asp:Parameter Name="DocID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="ChangePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Change Password" CssClass="title"></asp:Label>
    <hr />
    <table width=400px >
    <tr><td>Old Password</td><td>
        <asp:TextBox ID="txtOld" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtOld" ErrorMessage="RequiredFieldValidator" 
            ForeColor="Red">*</asp:RequiredFieldValidator>
        </td></tr>
    <tr><td>New Password</td><td>
        <asp:TextBox ID="txtNew" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtNew" ErrorMessage="RequiredFieldValidator" 
            ForeColor="Red">*</asp:RequiredFieldValidator>
        </td></tr>
    <tr><td>Confirm</td><td>
        <asp:TextBox ID="txtconfirm" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txtconfirm" ErrorMessage="RequiredFieldValidator" 
            ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="txtNew" ControlToValidate="txtconfirm" 
            ErrorMessage="CompareValidator" ForeColor="Red">Not Matching</asp:CompareValidator>
        </td></tr>
    <tr><td>&nbsp;</td><td>
        <asp:Button ID="Button1" runat="server" Text="Change" onclick="Button1_Click" />
        </td></tr>
    <tr><td>&nbsp;</td><td>
        &nbsp;</td></tr>
    </table>
    <hr />
    <asp:SqlDataSource ID="sqlpwd" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [UserMaster] WHERE [EmailID] = @EmailID" 
        InsertCommand="INSERT INTO [UserMaster] ([Pwd], [EmailID]) VALUES (@Pwd, @EmailID)" 
        SelectCommand="SELECT [Pwd], [EmailID] FROM [UserMaster]" 
        UpdateCommand="UPDATE [UserMaster] SET [Pwd] = @Pwd WHERE [EmailID] = @EmailID AND pwd=@oldpwd">
        <DeleteParameters>
            <asp:Parameter Name="EmailID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Pwd" Type="String" />
            <asp:Parameter Name="EmailID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtNew" Name="Pwd" PropertyName="Text" 
                Type="String" />
            <asp:SessionParameter Name="EmailID" SessionField="userid" Type="String" />
            <asp:ControlParameter ControlID="txtOld" Name="oldpwd" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lbl" runat="server" Font-Names="Arial" ForeColor="Red"></asp:Label>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Messages" CssClass="title"></asp:Label>
    <hr />
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlFriendInfo">
    <ItemTemplate>
    <table>
    <tr>
    <td>
        <img src='<%#Eval("photourl") %>' height=80px />
    </td>
    <td>
        <b><%#Eval("name") %></b><br />
        <%#Eval("Address") %><br />
        collage:<%#Eval("collage") %><br />contact:<%#Eval("contactno") %>, email:<%#Eval("emailid") %></td>
    </tr>
    </table>
    </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlFriendInfo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Name], [Address], [ContactNo], [Collage], [City], [PhotoURL],emailid FROM [UserMaster] WHERE ([EmailID] = @EmailID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="EmailID" QueryStringField="fid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    Message :<asp:TextBox ID="txtmsg" runat="server" Width="300px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtmsg" ErrorMessage="RequiredFieldValidator" 
        ForeColor="Red">*</asp:RequiredFieldValidator>
    <asp:Button ID="btnSend" runat="server" onclick="btnSend_Click" Text="Send" />
    <asp:SqlDataSource ID="sqlMsg" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        InsertCommand="INSERT INTO Messages(msgfrom, msgto, Message, msgdate) VALUES (@mfrom,@mto,@msg,@mdate)" 
        SelectCommand="SELECT * FROM [Messages] WHERE ((([msgfrom] = @msgfrom) AND ([msgto] = @msgto)) OR (([msgfrom] = @msgfrom2) AND ([msgto] = @msgto2)))">
        <InsertParameters>
            <asp:SessionParameter Name="mfrom" SessionField="userid" />
            <asp:QueryStringParameter Name="mto" QueryStringField="fid" />
            <asp:ControlParameter ControlID="txtmsg" Name="msg" PropertyName="Text" />
            <asp:ControlParameter ControlID="hfdate" Name="mdate" PropertyName="Value" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="msgfrom" SessionField="userid" Type="String" />
            <asp:QueryStringParameter Name="msgto" QueryStringField="fid" Type="String" />
            <asp:QueryStringParameter Name="msgfrom2" QueryStringField="fid" 
                Type="String" />
            <asp:SessionParameter Name="msgto2" SessionField="userid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    <asp:Label ID="lbl" runat="server" Font-Names="Arial"></asp:Label>
    <asp:HiddenField ID="hfdate" runat="server" />
</asp:Content>


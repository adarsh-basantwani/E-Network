<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchContents.aspx.cs" Inherits="SearchContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" CssClass="title" Text="Search Contents"></asp:Label>
<hr />Name<asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator" 
    ForeColor="#CC0000">*</asp:RequiredFieldValidator>
<asp:Button ID="Button1" runat="server" Text="Search" />
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/LatestContents.aspx">Latest Upload</asp:HyperLink>
<hr />
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDs">
    <ItemTemplate>
    <table width=100% >
    <tr>
    <td style="width:100px" >
        <a href='Documents/<%#Eval("filename") %>' target=mmm >
        <img src="images/pdf.gif" height=50px />
        </a>
    </td>
    <td>
        <b><%#Eval("title") %></b><br />
        <i><%#Eval("details") %></i>
    </td>
    </tr>
    </table>
    </ItemTemplate>
    <SeparatorTemplate>
    <hr size=1px />
    </SeparatorTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDs" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [DocMaster] WHERE (([Title] LIKE '%' + @Title + '%') OR ([Details] LIKE '%' + @Details + '%') OR ([FileName] LIKE '%' + @FileName + '%'))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtName" Name="Title" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="txtName" Name="Details" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="txtName" Name="FileName" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LatestContents.aspx.cs" Inherits="SearchContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" CssClass="title" Text="Latest Contents"></asp:Label>
<hr />
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
    <asp:HiddenField ID="hfCurrDate" runat="server" />
    <asp:SqlDataSource ID="SqlDs" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT * FROM [DocMaster] WHERE ([UploadDate] = @UploadDate)">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfCurrDate" Name="UploadDate" PropertyName="Value" 
                Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


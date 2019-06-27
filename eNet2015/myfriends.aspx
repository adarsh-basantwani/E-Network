<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myfriends.aspx.cs" Inherits="myfriends" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="My Friends" CssClass="title"></asp:Label>
<hr />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="Sqlfriends" 
        RepeatColumns="2" Width="100%" CellPadding="0" CellSpacing="20">
        <ItemTemplate>
           <table style="box-shadow:0px 0px 10px black;border-radius:15px;width=350px;padding:15px" >
           <tr>
           <td>
                <img src='<%#Eval("photourl") %>' height=75px />
           </td>
           <td>
                <b><%#Eval("name") %></b><br />
                collage:<%#Eval("collage") %><br />City:<%#Eval("city") %>
                <hr size=1px />
                <a href=messages.aspx?fid=<%#Eval("friendid") %> >Messages</a>
                </td>
           </tr>
           </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="Sqlfriends" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT UserMaster.Name, UserMaster.Collage, UserMaster.City, UserMaster.Gender, UserMaster.PhotoURL, friends.friendid FROM friends INNER JOIN UserMaster ON friends.friendid = UserMaster.EmailID where userid=@userid">
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" />
        </SelectParameters>
    </asp:SqlDataSource>
<hr />
</asp:Content>


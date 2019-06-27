<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="images_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href=StyleSheet.css type="text/css" rel=Stylesheet />
    <asp:Label ID="Label1" runat="server" Text="Profile" CssClass="title"></asp:Label>
    <hr />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    CellPadding="5" CellSpacing="10" DataKeyNames="EmailID" DataSourceID="SqlInfo" 
    Font-Names="Arial" Font-Size="Small" Height="50px" Width="100%">
        <AlternatingRowStyle BackColor="#EAEAEA" />
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
            <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" />
            <asp:BoundField DataField="JoinDate" HeaderText="JoinDate" 
                SortExpression="JoinDate" />
        </Fields>
        <RowStyle BackColor="#F2FFF2" />
</asp:DetailsView>
<asp:SqlDataSource ID="SqlInfo" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT [EmailID], [Name], [Address], [ContactNo], [City], [Collage], [Gender], [JoinDate] FROM [UserMaster] WHERE ([EmailID] = @EmailID)">
    <SelectParameters>
        <asp:SessionParameter Name="EmailID" SessionField="userid" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
    <hr />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlFriendRequest" 
        RepeatColumns="3" Width="100%">
        <ItemTemplate>
           <table  >
           <tr valign=top >
           <td>
                <img src='<%#Eval("photourl") %>' height=70px />
           </td>
           <td>
                <b><%#Eval("name") %></b><br />
                collage:<%#Eval("collage") %><br />city:<%#Eval("city") %><hr size=1px /><a href=ConfirmRequest.aspx?fid=<%#Eval("reqfrom") %> >Confirm</a> <a href=IgnoreRequest.aspx?fid=<%#Eval("reqfrom") %> >Ignore</a>
           </td>
           </tr>
           </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlFriendRequest" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT friendrequest.reqfrom, UserMaster.Name, UserMaster.Collage, UserMaster.City, UserMaster.Gender, UserMaster.PhotoURL FROM friendrequest INNER JOIN UserMaster ON friendrequest.reqfrom = UserMaster.EmailID where reqto=@userid">
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


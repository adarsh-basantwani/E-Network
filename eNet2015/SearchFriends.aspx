<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchFriends.aspx.cs" Inherits="SearchFrieds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Search Friends" CssClass="title"></asp:Label>
   <hr />
    <asp:Panel ID="Panel1" runat="server" GroupingText="Pending Request">
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="sqlPending">
        <ItemTemplate>
        <img src='<%#Eval("photourl") %>' height=40px title='<%#Eval("name") %>, <%#Eval("collage") %>, <%#Eval("city") %>' />
        </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="sqlPending" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT friendrequest.reqto, UserMaster.Name, UserMaster.Collage, UserMaster.City, UserMaster.Gender, UserMaster.PhotoURL FROM friendrequest INNER JOIN UserMaster ON friendrequest.reqto = UserMaster.EmailID where reqfrom=@userid">
            <SelectParameters>
                <asp:SessionParameter Name="userid" SessionField="userid" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
   <hr />
   Name:<asp:TextBox ID="txtName" runat="server" Width="179px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator" 
        ForeColor="#CC0000">*</asp:RequiredFieldValidator>
    <asp:Button ID="btnSearch" runat="server" Text="Search" />
&nbsp;<hr />
    <asp:DataList ID="DataList1" runat="server" DataKeyField="EmailID" 
        DataSourceID="SqlUsers" RepeatColumns="3" CellSpacing="20">
        <ItemTemplate>
           <table>
           <tr>
           <td>
                <img src='<%#Eval("photourl") %>' height=75px />
           </td>
           <td>
                <b><%#Eval("name") %></b>
                <br />
                collage:<%#Eval("collage") %><br />City:<%#Eval("city") %><br /><a href=addasfriend.aspx?fid=<%#Eval("emailid") %> >Add as Friend</a>
                </td>
           </tr>
           </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT [PhotoURL], [Name], [City], [Collage], [Gender], [EmailID] FROM [UserMaster] WHERE (([Name] LIKE '%' + @Name + '%') OR ([Collage] LIKE '%' + @Collage + '%') OR ([City] = @City)) AND emailid&lt;&gt;@userid">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="txtName" Name="Collage" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="txtName" Name="City" PropertyName="Text" 
                Type="String" />
            <asp:SessionParameter Name="userid" SessionField="userid" />
        </SelectParameters>
    </asp:SqlDataSource>
<asp:SqlDataSource ID="sqlFriends" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT [friendid] FROM [friends] WHERE ([userid] = @userid)">
    <SelectParameters>
        <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>


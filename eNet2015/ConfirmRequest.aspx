<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfirmRequest.aspx.cs" Inherits="ConfirmRequest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="sqlFriendRequest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [friendrequest] WHERE [reqfrom] = @reqfrom AND [reqto] = @reqto" 
            InsertCommand="INSERT INTO [friendrequest] ([reqfrom], [reqto]) VALUES (@reqfrom, @reqto)" 
            SelectCommand="SELECT * FROM [friendrequest]">
            <DeleteParameters>
                <asp:QueryStringParameter Name="reqfrom" QueryStringField="fid" Type="String" />
                <asp:SessionParameter Name="reqto" SessionField="userid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="reqfrom" Type="String" />
                <asp:Parameter Name="reqto" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlFriends1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [friends] WHERE [userid] = @userid AND [friendid] = @friendid" 
            InsertCommand="INSERT INTO [friends] ([userid], [friendid]) VALUES (@userid, @friendid)" 
            SelectCommand="SELECT * FROM [friends]">
            <DeleteParameters>
                <asp:Parameter Name="userid" Type="String" />
                <asp:Parameter Name="friendid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
                <asp:QueryStringParameter Name="friendid" QueryStringField="fid" 
                    Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlFriends2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [friends] WHERE [userid] = @userid AND [friendid] = @friendid" 
            InsertCommand="INSERT INTO [friends] ([userid], [friendid]) VALUES (@userid, @friendid)" 
            SelectCommand="SELECT * FROM [friends]">
            <DeleteParameters>
                <asp:Parameter Name="userid" Type="String" />
                <asp:Parameter Name="friendid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="userid" QueryStringField="fid" Type="String" />
                <asp:SessionParameter Name="friendid" SessionField="userid" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

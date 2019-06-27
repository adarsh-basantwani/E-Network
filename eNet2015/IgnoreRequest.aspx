<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IgnoreRequest.aspx.cs" Inherits="IgnoreRequest" %>

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
    
    </div>
    </form>
</body>
</html>

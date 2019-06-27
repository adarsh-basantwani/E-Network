<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href=StyleSheet.css type="text/css" rel=Stylesheet />
</head>
<body style="margin:0px 0px 0px 0px" >
    <form id="form1" runat="server">
    <div>
    <div style="background-color:gray" >
    <table width=100% >
    <tr><td align="center">
        <asp:Label ID="Label1" runat="server" Font-Names="Bauhaus 93" 
            Font-Size="XX-Large" ForeColor="White" Text="e-NetWork" style="text-shadow:0px 0px 10px aqua" ></asp:Label>
        </td><td align="right">
            <asp:Login ID="Login1" runat="server" DisplayRememberMe="False" 
                Font-Names="Arial" ForeColor="White" FailureText="Invalid UserID/Pwd" 
                onauthenticate="Login1_Authenticate">
            </asp:Login>
        </td></tr>
    </table>
    </div>

    <div >
    <table width=100% >
    <tr><td align="center">
    
        <asp:Image ID="Image1" runat="server" Height="200px" 
            ImageUrl="~/images/students.png" Width="417px" />
    
    </td><td>
    <table width=100% cellspacing=3px >
        <tr><td colspan="2">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Pristina" 
                Font-Size="X-Large" ForeColor="White" Text="SignUp" style="text-shadow:0px 0px 10px black" ></asp:Label>
            <hr />
            </td></tr>
        <tr><td>Name</td><td>
            <asp:TextBox ID="txtName" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>Address</td><td>
            <asp:TextBox ID="txtAddress" runat="server" Width="250px"></asp:TextBox>
            </td></tr>
        <tr><td>EmailID</td><td>
            <asp:TextBox ID="txtEmailID" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtEmailID" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtEmailID" ErrorMessage="RegularExpressionValidator" 
                ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">$</asp:RegularExpressionValidator>
            </td></tr>
        <tr><td>ContactNo</td><td>
            <asp:TextBox ID="txtContactNo" runat="server" Width="250px"></asp:TextBox>
            </td></tr>
        <tr><td>City</td><td>
            <asp:TextBox ID="txtCity" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtCity" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>Collage</td><td>
            <asp:TextBox ID="txtCollage" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtCollage" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>Gender</td><td>
            <asp:RadioButtonList ID="rbGender" runat="server" 
                RepeatDirection="Horizontal">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
            </td></tr>
        <tr><td>Password</td><td>
            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtPwd" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>Confirm</td><td>
            <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtConfirm" ErrorMessage="RequiredFieldValidator" 
                ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtPwd" ControlToValidate="txtConfirm" 
                ErrorMessage="CompareValidator" ForeColor="Red">Not Matching</asp:CompareValidator>
            </td></tr>
        <tr><td>&nbsp;</td><td>
            <asp:Button ID="btnReg" runat="server" Text="Register" onclick="btnReg_Click" />
            </td></tr>
        <tr><td colspan="2">
            <hr />
            <asp:Label ID="lbl" runat="server" Font-Bold="True" Font-Names="Arial" 
                ForeColor="Red"></asp:Label>
            <asp:SqlDataSource ID="sqlds" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [UserMaster] WHERE [EmailID] = @EmailID" 
                InsertCommand="INSERT INTO [UserMaster] ([EmailID], [Pwd], [Name], [Address], [ContactNo], [City], [Collage], [Gender], [PhotoURL], [JoinDate]) VALUES (@EmailID, @Pwd, @Name, @Address, @ContactNo, @City, @Collage, @Gender, @PhotoURL, @JoinDate)" 
                SelectCommand="SELECT * FROM [UserMaster] WHERE ([EmailID] = @EmailID)" 
                UpdateCommand="UPDATE [UserMaster] SET [Pwd] = @Pwd, [Name] = @Name, [Address] = @Address, [ContactNo] = @ContactNo, [City] = @City, [Collage] = @Collage, [Gender] = @Gender, [PhotoURL] = @PhotoURL, [JoinDate] = @JoinDate WHERE [EmailID] = @EmailID">
                <DeleteParameters>
                    <asp:Parameter Name="EmailID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtEmailID" Name="EmailID" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtPwd" Name="Pwd" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtAddress" Name="Address" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtContactNo" Name="ContactNo" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtCity" Name="City" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtCollage" Name="Collage" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="rbGender" Name="Gender" 
                        PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="hfPhotoURL" Name="PhotoURL" 
                        PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="hfJoinDate" Name="JoinDate" 
                        PropertyName="Value" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtEmailID" Name="EmailID" PropertyName="Text" 
                        Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Pwd" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="ContactNo" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Collage" Type="String" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="PhotoURL" Type="String" />
                    <asp:Parameter Name="JoinDate" Type="DateTime" />
                    <asp:Parameter Name="EmailID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hfJoinDate" runat="server" />
            <asp:HiddenField ID="hfPhotoURL" runat="server" />
            <asp:SqlDataSource ID="sqlLogin" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [UserMaster] WHERE (([EmailID] = @EmailID) AND ([Pwd] = @Pwd))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfUserID" Name="EmailID" PropertyName="Value" 
                        Type="String" />
                    <asp:ControlParameter ControlID="hfPwd" Name="Pwd" PropertyName="Value" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfPwd" runat="server" />
            </td></tr>
    </table>
    </td></tr>
    </table>
    </div>

    </div>
    </form>
</body>
</html>

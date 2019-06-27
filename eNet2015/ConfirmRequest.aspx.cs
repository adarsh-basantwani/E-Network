using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConfirmRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        sqlFriendRequest.Delete();
        sqlFriends1.Insert();
        sqlFriends2.Insert();
        Server.Transfer("Home.aspx");
    }
}
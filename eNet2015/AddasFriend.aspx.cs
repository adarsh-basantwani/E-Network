using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddasFriend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        sqlFriendReq.Insert();
        Server.Transfer("searchfriends.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class SearchFrieds : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String uid = (String)Session["userid"];
        String lst = "'" + uid + "'";
        DataView dv=(DataView)sqlPending.Select(new DataSourceSelectArguments());

        for (int i = 0; i < dv.Count; i++)
        {
            String reqto = (String)dv[i][0];
            lst = lst + "," +"'"+ reqto+"'";
        }

        dv=(DataView)sqlFriends.Select(new DataSourceSelectArguments());
        for (int i = 0; i < dv.Count; i++)
        {
            String friendid = (String)dv[i][0];
            lst = lst + "," + "'"+friendid+"'";
        }
        String msql = "SELECT [PhotoURL], [Name], [City], [Collage], [Gender], [EmailID] FROM [UserMaster] WHERE (([Name] LIKE '%" + txtName.Text + "%') OR ([Collage] LIKE '%" + txtName.Text + "%') OR ([City] = '" + txtName.Text + "')) ";
        msql = msql + " and emailid not in(" + lst + ")";
        SqlUsers.SelectCommand = msql;
        
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Messages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showchat();
    }

    void showchat()
    {
        DataView dvx = (DataView)SqlFriendInfo.Select(new DataSourceSelectArguments());
        String nm = (String)dvx[0][0];
        String[] arr = nm.Split(' ');
        String fname = arr[0];

        String uid = (String)Session["userid"];
        String s = "";
        DataView dv = (DataView)sqlMsg.Select(new DataSourceSelectArguments());
        for (int i = 0; i < dv.Count; i++)
        {
            String msgfrom = (String)dv[i][1];
            String msgto = (String)dv[i][2];
            String msg = (String)dv[i][3];
            DateTime mdate = (DateTime)dv[i][4];
            if (msgfrom == uid)
                msgfrom = "Me";
            else
                msgfrom = fname;
            String m = msgfrom + " : " + msg;
            s = s + m;
            s = s + "<br>";



        }
        lbl.Text = s;
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        hfdate.Value = DateTime.Now.ToString();
        sqlMsg.Insert();
        txtmsg.Text = "";
        showchat();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePhoto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        String ppath=Server.MapPath("profilephotos");
        String uid=(String)Session["userid"];
        String imgpath = ppath + "\\" + uid + ".jpg";
        fuPhoto.SaveAs(imgpath);

        hfurl.Value = "Profilephotos/" + uid + ".jpg";
        sqlPhoto.Update();
        Server.Transfer("Home.aspx");
    }
}
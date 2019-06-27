using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UploadContents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        sqlds.Insert();
        String ppath=Server.MapPath("Documents");
        fuDoc.SaveAs(ppath + "\\" + fuDoc.FileName);
        txtTitle.Text = "";
        txtDetails.Text = "";
        lbl.Text = "Document Uploaded...";
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["userid"] != null && Request.Cookies["pwd"] != null)
        {
            HttpCookie c1 = Request.Cookies["userid"];
            HttpCookie c2= Request.Cookies["pwd"];
            
            hfUserID.Value = c1.Value;
            hfPwd.Value = c2.Value;
            
            DataView dv=(DataView)sqlLogin.Select(new DataSourceSelectArguments());
            if (dv == null)
                return;
            if (dv.Count == 1)
            {
                Session.Add("userid", c1.Value);
                Session.Add("pwd", c2.Value);
                Server.Transfer("Home.aspx");
            }
        }

    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        DataView dv=(DataView)sqlds.Select(new DataSourceSelectArguments());
        if (dv.Count == 1)
        {
            lbl.Text = "You are already Registered.. Check your emailid";
            return;
        }

        hfPhotoURL.Value = "Images/" + rbGender.SelectedValue + ".jpg";
        hfJoinDate.Value = DateTime.Now.ToString();
        int n=sqlds.Insert();
        if (n == 1)
            lbl.Text = "You are sucesfully registered...";
        btnReg.Enabled = false;
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        hfUserID.Value = Login1.UserName;
        hfPwd.Value = Login1.Password;
        DataView dv=(DataView)sqlLogin.Select(new DataSourceSelectArguments());
        if (dv.Count == 1)
        {
            //send cookies to webclient
            HttpCookie c1, c2;
            c1 = new HttpCookie("userid", Login1.UserName);
            c2 = new HttpCookie("pwd", Login1.Password);
            c1.Expires = DateTime.Now.AddYears(1);
            c2.Expires = DateTime.Now.AddYears(1);

            Response.AppendCookie(c1);
            Response.AppendCookie(c2);

            Session.Add("userid", Login1.UserName);
            Session.Add("pwd", Login1.Password);
            Server.Transfer("Home.aspx");
        }
    }
}
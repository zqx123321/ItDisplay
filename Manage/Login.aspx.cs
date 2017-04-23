using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        User u = new User();
        u = UserHelper.Login(txtID.Text, txtPassword.Text);
        if (u != null)
        {
            Session["User"] = u;
            Response.Redirect("Index.aspx");
        }
        else
        {
            //这个类不知道是否会有问题
            Response.Write(JSHelper.ShowAlert("用户名或密码错误"));
            
        }
    }
}
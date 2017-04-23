using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_PswEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            User user = (User)Session["User"];
            if (user != null)
            {
                lblName.Text = UserHelper.RtnName(user.UserID);
            }
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (txtNewPsw.Text == "" || txtAgainPsw.Text == "")
        {
            Response.Write(JSHelper.ShowAlert("请输入密码"));
        }
        else
        {
            if (txtNewPsw.Text != txtAgainPsw.Text)
            {
                Response.Write(JSHelper.ShowAlert("新密码和确认密码不同"));
            }
            else
            {
                User user = (User)Session["User"];
                bool result = UserHelper.UpdatePwd(user.Number, txtAgainPsw.Text);
                if (result == true)
                {
                    Session.Clear();
                    Response.Write("<script>alert('修改成功,请重新登录!');window.location.href ='Login.aspx'</script>");
                }
                else
                {
                    Response.Write(JSHelper.ShowAlert("修改失败"));
                }
            }
        }
    }

}
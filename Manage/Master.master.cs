using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Master : System.Web.UI.MasterPage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        User user = (User)Session["User"];
        if (user == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            User user = (User)Session["User"];
            List<string> ls = ArticleHelper.CheckRight(((User)Session["User"]).UserID);
            Repeater1.DataSource = ls;
            Repeater1.DataBind();
            if (ls.Count == 0)
            {
                Article.Visible = false;
            }
            var teac = TeacherHelper.Select(user.UserID);
            if (teac == null)
            {
                PanelMessEdit.Visible = false;
            }
            var db = new oucITEntities();
            var conn = (from a in db.Connection
                        where a.UserID == user.UserID
                        select a).ToList();
            if (conn.Count == 0 || teac == null)
            {
                PanelOrgEdit.Visible = false;
            }
            var conn2 = (from a in db.Connection
                        where a.UserID == user.UserID && a.Right == 2
                        select a).ToList();
            if (conn2.Count == 0)
            {
                PanelOrg.Visible = false;
            }
        }
    }
    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}

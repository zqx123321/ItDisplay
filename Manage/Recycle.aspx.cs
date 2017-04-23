using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = ArticleHelper.MyRecycle(((User)Session["User"]).UserID);
            GridView1.DataBind();
        }
    }
    //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "delete")
    //    {
    //        ArticleHelper.RealDelete(int.Parse(GridView1.SelectedRow.Cells[0].Text));
    //    }
    //    else if (e.CommandName == "restore")
    //    {
    //        ArticleHelper.Restore(int.Parse(GridView1.SelectedRow.Cells[0].Text));
            
    //    }
    //}
    protected void clearAll_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            ArticleHelper.RealDelete(int.Parse(GridView1.Rows[i].Cells[1].Text));
        }
        Response.Redirect("Recycle.aspx", true);
    }
    protected void delete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            if(cb.Checked)
                ArticleHelper.RealDelete(int.Parse(GridView1.Rows[i].Cells[1].Text));
        }
        Response.Redirect("Recycle.aspx", true);
    }
    protected void restore_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            if (cb.Checked)
                ArticleHelper.Restore(int.Parse(GridView1.Rows[i].Cells[1].Text));
        }
        Response.Redirect("MyArticles.aspx", true);//TODO:不能自动刷新，刷新时会提示”重新发送请求“。
       // Response.Redirect("Recycle.aspx");
      //  Response.Write(JSHelper.js("window.opener.location = window.opener.location"));
    }
}
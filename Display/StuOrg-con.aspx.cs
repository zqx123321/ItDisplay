using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_StuOrg_con : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ITGroup g = GroupHelper.Select(Request.QueryString["name"])??GroupHelper.Default();
        Gname.Text = g.GroupName;
       
        Gimg.ImageUrl = g.Img;
        Gimg.AlternateText = g.GroupName;
        Gimg.ToolTip = g.GroupName;

        #region 绑定repeater及分页
        int page = 0;
        if (Request.QueryString["page"] != null)
        {
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch { page = 0; }
        }
        List<Article> ls = ArticleHelper.GetArticlesByType("学生组织:"+Request.QueryString["name"]);
        Repeater1.DataSource = ls.Skip(10 * page).Take(10);
        Repeater1.DataBind();

        TotalPage.Text = Math.Ceiling(ls.Count / 10.0).ToString();
        currentPage.Text = (page + 1).ToString();
		First.NavigateUrl = "StuOrg-con.aspx?name=" + Request.QueryString["name"];
        Prev.NavigateUrl = First.NavigateUrl + "&page=" + (page - 1).ToString();
        Next.NavigateUrl = First.NavigateUrl + "&page=" + (page + 1).ToString();
        Last.NavigateUrl = First.NavigateUrl + "&page=" + ls.Count / 10;

        if (page == 0)
        {
            First.Enabled = false;
            Prev.Enabled = false;
        }
        if (page == (int)Math.Ceiling(ls.Count / 10.0) - 1)
        {
            Next.Enabled = false;
            Last.Enabled = false;
        }
        #endregion
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_dangtuan_con : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // TODO:9.27晚 动态,重用
        if (!IsPostBack)
        {
            string typet = Request.QueryString["type"];
            string itemt = Request.QueryString["item"];
            typet=typet.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
            itemt=itemt.Replace('<', ' ').Replace('>', ' ').Replace('"',' ');
            List<string> ls = ArticleHelper.GetSubTypes(typet);
            title.Text = typet;
            item.Text = itemt;
            menu.DataSource = ls;
            menu.DataBind();

            #region 绑定列表
            int page = 0;
            if (Request.QueryString["page"] != null)
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            List<Article> ls2 = ArticleHelper.GetArticlesByType(typet + ":" + itemt);
            Repeater1.DataSource = ls2.Skip(10 * page).Take(10);
            Repeater1.DataBind();

            TotalPage.Text = Math.Ceiling(ls2.Count / 10.0).ToString();
            currentPage.Text = (page + 1).ToString();
            First.NavigateUrl = "dangtuan-con.aspx?type=" + typet + "&item=" + itemt + "&page=0";
            Prev.NavigateUrl = "dangtuan-con.aspx?type=" + typet + "&item=" + itemt + "&page=" + (page - 1).ToString();
            Next.NavigateUrl = "dangtuan-con.aspx?type=" + typet + "&item=" + itemt + "&page=" + (page + 1).ToString();
            Last.NavigateUrl = "dangtuan-con.aspx?type=" + typet + "&item=" + itemt + "&page=" + ls2.Count / 10;
            if (page == 0)
            {
                First.Enabled = false;
                Prev.Enabled = false;
            }
            if (page == (int)Math.Ceiling(ls2.Count / 10.0) - 1)
            {
                Next.Enabled = false;
                Last.Enabled = false;
            }
            #endregion
        }
    }
}
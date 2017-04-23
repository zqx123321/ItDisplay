using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_news : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        Bind();
        /*if (!IsPostBack)
        {
            Repeater1.DataSource = ArticleHelper.GetArticlesByType("学院新闻");
            Repeater1.DataBind();
        }*/
    }
    private void Bind()
    {
        int page = 0;
        if (Request.QueryString["page"] != null)
        {
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch { page = 0; }
        }
        List<Article> ls=new List<Article>();
        if (Request.QueryString["type"] == "2")
        {
            Ltitle.Text = "通知公告";
            ls = ArticleHelper.GetArticlesByType("奖助工作:通知公告");
            ls.AddRange(ArticleHelper.GetArticlesByType("就业工作:通知公告"));
            ls.AddRange(ArticleHelper.GetArticlesByType("学院新闻:通知公告"));
            ls=ls.OrderByDescending(e => e.UpdateTime).ToList();

            First.NavigateUrl = "news.aspx?type=2 ";
            Prev.NavigateUrl = "news.aspx?type=2&page=" + (page - 1).ToString();
            Next.NavigateUrl = "news.aspx?type=2&page=" + (page + 1).ToString();
            Last.NavigateUrl = "news.aspx?type=2&page=" + ls.Count / 10;
        }
        else
        {
            Ltitle.Text = "学院新闻";
            ls = ArticleHelper.GetArticlesByType("学院新闻:学院新闻");
            First.NavigateUrl = "news.aspx";
            Prev.NavigateUrl = "news.aspx?page=" + (page - 1).ToString();
            Next.NavigateUrl = "news.aspx?page=" + (page + 1).ToString();
            Last.NavigateUrl = "news.aspx?page=" + ls.Count / 10;
        }

        Repeater1.DataSource = ls.Skip(10*page).Take(10);
        Repeater1.DataBind();

        TotalPage.Text = Math.Ceiling(ls.Count / 10.0).ToString();
        currentPage.Text = (page+1).ToString();
       
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
    }
}
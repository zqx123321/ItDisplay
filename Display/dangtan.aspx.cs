using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_dangtan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dangjian.DataSource = ArticleHelper.GetArticlesBySupType("党建工作");
            dangjian.DataBind();
            tuanjian.DataSource = ArticleHelper.GetArticlesBySupType("团建工作");
            tuanjian.DataBind();
            jianzu.DataSource = ArticleHelper.GetArticlesBySupType("奖助工作");
            jianzu.DataBind();
            jiuye.DataSource = ArticleHelper.GetArticlesBySupType("就业工作");
            jiuye.DataBind();
            keji.DataSource = ArticleHelper.GetArticlesBySupType("科技创新");
            keji.DataBind();
            xuesheng.DataSource = ArticleHelper.GetArticlesBySupType("学生组织");
            xuesheng.DataBind();
			stud.DataSource = ArticleHelper.GetArticlesBySupType("学生风采");
            stud.DataBind();
            下载.DataSource = ArticleHelper.GetArticlesBySupType("常用下载");
            下载.DataBind();
        }
    }
}
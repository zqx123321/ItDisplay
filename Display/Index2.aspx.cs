using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Display_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dynamicImg.DataSource = ArticleHelper.DynamicImgs();
            dynamicImg.DataBind();
            List<IndexCard>[] ls = ArticleHelper.IndexCards("");
            news.DataSource = ls[0];
            news.DataBind();
            tongzhi.DataSource = ls[2];
            tongzhi.DataBind();
            job.DataSource = ls[1];
            job.DataBind();
        }
    }
}
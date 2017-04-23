﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // if (!Page.IsPostBack)
        BindGrid(); 
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        BindGrid();
    }
    public void BindGrid()
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
        List<Article> ls = ArticleHelper.GetMyArticles(((User)Session["User"]).UserID);
        Repeater1.DataSource = ls.Skip(20 * page).Take(20);
        //Repeater1.DataSource = ArticleHelper.GetMyArticles(((User)Session["User"]).UserID);
        Repeater1.DataBind();

        TotalPage.Text = Math.Ceiling(ls.Count / 10.0).ToString();
        currentPage.Text = (page + 1).ToString();
        Prev.NavigateUrl = "MyArticles.aspx?page=" + (page - 1).ToString();
        Next.NavigateUrl = "MyArticles.aspx?page=" + (page + 1).ToString();
        Last.NavigateUrl = "MyArticles.aspx?page=" + ls.Count / 10;
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

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
       // if (e.Item.ItemType == ListItemType.Item)
        //{
            if (e.CommandName == "delete")
            {

                if (ArticleHelper.Delete(Convert.ToInt32(e.CommandArgument)))
                {
                    Response.Redirect("MyArticles.aspx", true);
                   // Response.Write("<script>alert('删除成功！'); </script>");//window.location.href='NewsList.aspx'
                }
                else
                {
                    Response.Write("<script>alert('删除失败！');</script>");
                }
            }
       // }
    }
}
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
        if (!Page.IsPostBack)
        {
            User u = (User)Session["User"];
            if (TeacherHelper.Select(u.UserID) == null)
                Response.Redirect("Index.aspx");

            BindGrid(); }
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
        oucITEntities db = new oucITEntities();

       // Repeater1.DataSource = db.Course.OrderBy(p => p.CourseID).Skip(pageIndex * pageSize).Take(pageSize).ToList();
        List<Course> ls = db.Course.OrderBy(p => p.CourseID).ToList();
        Repeater1.DataSource =ls.Skip(20 * page).Take(20);
        //Repeater1.DataSource = ArticleHelper.GetMyArticles(((User)Session["User"]).UserID);
        Repeater1.DataBind();

        TotalPage.Text = Math.Ceiling(ls.Count / 10.0).ToString();
        currentPage.Text = (page + 1).ToString();
        Prev.NavigateUrl = "CourseList.aspx?page=" + (page - 1).ToString();
        Next.NavigateUrl = "CourseList.aspx?page=" + (page + 1).ToString();
        Last.NavigateUrl = "CourseList.aspx?page=" + ls.Count / 10;
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
        /*
        oucITEntities db = new oucITEntities();
        
        Repeater1.DataSource = db.Course.OrderBy(p => p.CourseID).Skip(pageIndex * pageSize).Take(pageSize).ToList();//db.GetCurrentPage(pageIndex, pageSize);
        Repeater1.DataBind();*/
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item)
        {
            if (e.CommandName == "delete")
            {
                oucITEntities db = new oucITEntities();
                if (CourseHelper.Delete(Convert.ToInt32(e.CommandArgument),db))
                {

                   JSHelper.Redirect("CourseList.aspx",true);//window.location.href='NewsList.aspx'
                }
                else
                {
                    Response.Write("<script>alert('删除失败！');</script>");
                }
            }
        }
    }
}
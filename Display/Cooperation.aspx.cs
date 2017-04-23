using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Cooperation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            Bind();

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
        List<Introduce> ls = new List<Introduce>();
        
            oucITEntities db = new oucITEntities();
            ls = db.Introduce.Where(p => p.name.StartsWith("合作办学")).ToList();




            First.NavigateUrl = "Cooperation.aspx ";
            Prev.NavigateUrl = "Cooperation.aspx?page=" + (page - 1).ToString();
            Next.NavigateUrl = "Cooperation.aspx?page=" + (page + 1).ToString();
            Last.NavigateUrl = "Cooperation.aspx?page=" + ls.Count / 10;
        
       

        Repeater1.DataSource = ls.Skip(10 * page).Take(10);
        Repeater1.DataBind();

        TotalPage.Text = Math.Ceiling(ls.Count / 10.0).ToString();
        currentPage.Text = (page + 1).ToString();

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
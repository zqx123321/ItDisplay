using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Content : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int id;
            try { id = int.Parse(Request.QueryString["id"]); }
            catch { id = 1; }
            ArticleHelper.AddHitCount(id);
            Article ar = ArticleHelper.GetArticleByID(id);
            Label1.Text = ar.Title;
			 this.Title = ar.Title;
            Label2.Text = ar.Source;
            Label3.Text = ar.Hit.ToString();
            Label4.Text = ar.UpdateTime.ToLongDateString();
            Label5.Text = ar.Author;
            Literal1.Text = ar.Content;
			if (CHelper.IsExit(id)) {LinkAdd.Visible = true;
				addID.Value = id.ToString();
			}
        }
    }
	
	protected void Add_Click(object sender, EventArgs e)
    {
        try
        {
            if (CHelper.Add(Convert.ToInt32(addID.Value)))
            {
                //Response.Write("<script>alert('成功')</script>");
				Response.Write(JSHelper.ShowAlertAndBack("你所处的IP已记录"));
            }
            else
            {
                //Response.Write("<script>alert('不要重复点击谢谢')</script>");
				Response.Write(JSHelper.ShowAlertAndBack("你所处的IP已记录"));
            }
        }
        catch
        {
        }
    }
}
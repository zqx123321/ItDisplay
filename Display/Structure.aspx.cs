using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Structure : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var db = new oucITEntities();
            string type = Request.QueryString["type"];
            if (type == "dwtw")
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
                var ITgroup = GroupHelper.Select("学院党委");
                if (ITgroup != null)
                {
                    var xydwlist = from a in db.Connection
                                   where a.GroupID == ITgroup.GroupID
                                   orderby a.Class
                                   select new
                                   {
                                       id = a.User.UserID,
                                       Job = a.Job,
                                       Duty = a.Duty,
                                       Phone = a.Phone,
                                       Email = a.Email
                                   };
                    Repeater1.DataSource = xydwlist.ToList();
                    Repeater1.DataBind();
                }
                ITgroup = GroupHelper.Select("学院团委");
                if (ITgroup != null)
                {
                    var xytwlist = from a in db.Connection
                                   where a.GroupID == ITgroup.GroupID
                                   orderby a.Class
                                   select new
                                   {
                                       id = a.User.UserID,
                                       Job = a.Job,
                                       Duty = a.Duty,
                                       Phone = a.Phone,
                                       Email = a.Email
                                   };
                    Repeater2.DataSource = xytwlist.ToList();
                    Repeater2.DataBind();
                }
                ITgroup = GroupHelper.Select("教工党支部");
                if (ITgroup != null)
                {
                    var jgdzblist = from a in db.Connection
                                    where a.GroupID == ITgroup.GroupID
                                    orderby a.Class,a.Job
                                    select new
                                    {
                                        id = a.User.UserID,
                                        Job = a.Job,
                                        Phone = a.Phone,
                                        Email = a.Email
                                    };
                    Repeater3.DataSource = jgdzblist.ToList();
                    Repeater3.DataBind();
                }
                ITgroup = GroupHelper.Select("学生党支部");
                if (ITgroup != null)
                {
                    var xsdzblist = from a in db.Connection
                                    where a.GroupID == ITgroup.GroupID
                                    select new { Job = a.Job };
                    Repeater4.DataSource = xsdzblist.ToList();
                    Repeater4.DataBind();
                }
            }
            else if(type == "yxz")
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
                Panel3.Visible = false;
                var ITgroup = GroupHelper.Select("院行政");
                if (ITgroup != null)
                {
                    var xydwlist = from a in db.Connection
                                   where a.GroupID == ITgroup.GroupID
                                   orderby a.Class
                                   select new
                                   {
                                       id = a.User.UserID,
                                       Job = a.Job,
                                       Duty = a.Duty,
                                       Phone = a.Phone,
                                       Email = a.Email
                                   };
                    Repeater5.DataSource = xydwlist.ToList();
                    Repeater5.DataBind();
                }
                ITgroup = GroupHelper.Select("院办公室");
                if (ITgroup != null)
                {
                    var xydwlist = from a in db.Connection
                                   where a.GroupID == ITgroup.GroupID
                                   orderby a.Class
                                   select new
                                   {
                                       id = a.User.UserID,
                                       Job = a.Job,
                                       Duty = a.Duty,
                                       Phone = a.Phone,
                                       Email = a.Email
                                   };
                    Repeater6.DataSource = xydwlist.ToList();
                    Repeater6.DataBind();
                }
                ITgroup = GroupHelper.Select("物理系");
                if (ITgroup != null)
                {
                    var xydwlist = from a in db.Connection
                                   where a.GroupID == ITgroup.GroupID
                                   orderby a.Class
                                   select new
                                   {
                                       id = a.User.UserID,
                                       Job = a.Job,
                                       Duty = a.Duty,
                                       Phone = a.Phone,
                                       Email = a.Email
                                   };
                    Repeater7.DataSource = xydwlist.ToList();
                    Repeater7.DataBind();
                }
                ITgroup = GroupHelper.Select("电子工程系");
                if (ITgroup != null)
                {
                    var xydwlist = from a in db.Connection
                                   where a.GroupID == ITgroup.GroupID
                                   orderby a.Class
                                   select new
                                   {
                                       id = a.User.UserID,
                                       Job = a.Job,
                                       Duty = a.Duty,
                                       Phone = a.Phone,
                                       Email = a.Email
                                   };
                    Repeater8.DataSource = xydwlist.ToList();
                    Repeater8.DataBind();
                }
                ITgroup = GroupHelper.Select("计算机科学与技术系");
                if (ITgroup != null)
                {
                    var xydwlist = from a in db.Connection
                                   where a.GroupID == ITgroup.GroupID
                                   orderby a.Class
                                   select new
                                   {
                                       id = a.User.UserID,
                                       Job = a.Job,
                                       Duty = a.Duty,
                                       Phone = a.Phone,
                                       Email = a.Email
                                   };
                    Repeater9.DataSource = xydwlist.ToList();
                    Repeater9.DataBind();
                }
                ITgroup = GroupHelper.Select("海洋技术系");
                if (ITgroup != null)
                {
                    var xydwlist = from a in db.Connection
                                   where a.GroupID == ITgroup.GroupID
                                   orderby a.Class
                                   select new
                                   {
                                       id = a.User.UserID,
                                       Job = a.Job,
                                       Duty = a.Duty,
                                       Phone = a.Phone,
                                       Email = a.Email
                                   };
                    Repeater10.DataSource = xydwlist.ToList();
                    Repeater10.DataBind();
                }
                ITgroup = GroupHelper.Select("信息工程中心");
                if (ITgroup != null)
                {
                    var xydwlist = from a in db.Connection
                                   where a.GroupID == ITgroup.GroupID
                                   orderby a.Class
                                   select new
                                   {
                                       id = a.User.UserID,
                                       Job = a.Job,
                                       Duty = a.Duty,
                                       Phone = a.Phone,
                                       Email = a.Email
                                   };
                    Repeater11.DataSource = xydwlist.ToList();
                    Repeater11.DataBind();
                }
            }
            else if (type == "ygh")
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = true;
                var ITgroup = GroupHelper.Select("院工会");
                if (ITgroup != null)
                {
                    var xydwlist = from a in db.Connection
                                   where a.GroupID == ITgroup.GroupID
                                   orderby a.Class
                                   select new
                                   {
                                       id = a.User.UserID,
                                       Job = a.Job,
                                       Duty = a.Duty,
                                       Phone = a.Phone,
                                       Email = a.Email
                                   };
                    Repeater12.DataSource = xydwlist.ToList();
                    Repeater12.DataBind();
                }
                ITgroup = GroupHelper.Select("院妇女委员会");
                if (ITgroup != null)
                {
                    var xydwlist = from a in db.Connection
                                   where a.GroupID == ITgroup.GroupID
                                   orderby a.Class
                                   select new
                                   {
                                       id = a.User.UserID,
                                       Job = a.Job,
                                       Duty = a.Duty,
                                       Phone = a.Phone,
                                       Email = a.Email
                                   };
                    Repeater13.DataSource = xydwlist.ToList();
                    Repeater13.DataBind();
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblxydw = (Label)e.Item.FindControl("Label1");
            var t = TeacherHelper.Select(Convert.ToInt32(lblxydw.Text));
            if (t != null)
            {
                lblxydw.Text = t.Name;
            }
        }
    }
    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblxytw = (Label)e.Item.FindControl("Label2");
            var t = TeacherHelper.Select(Convert.ToInt32(lblxytw.Text));
            if (t != null)
            {
                lblxytw.Text = t.Name;
            }
        }
    }
    protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lbljgdzb = (Label)e.Item.FindControl("Label3");
            var t = TeacherHelper.Select(Convert.ToInt32(lbljgdzb.Text));
            if (t != null)
            {
                lbljgdzb.Text = t.Name;
            }
        }
    }
    //protected void Repeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        Label lblxsdzb = (Label)e.Item.FindControl("Label4");
    //        var t = StudentHelper.Select(Convert.ToInt32(lblxsdzb.Text));
    //        if (t != null)
    //        {
    //            lblxsdzb.Text = t.Name;
    //        }
    //    }
    //}
    protected void Repeater5_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblxydw = (Label)e.Item.FindControl("Label1");
            var t = TeacherHelper.Select(Convert.ToInt32(lblxydw.Text));
            if (t != null)
            {
                lblxydw.Text = t.Name;
            }
        }
    }
    protected void Repeater6_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblxydw = (Label)e.Item.FindControl("Label1");
            var t = TeacherHelper.Select(Convert.ToInt32(lblxydw.Text));
            if (t != null)
            {
                lblxydw.Text = t.Name;
            }
        }
    }
    protected void Repeater7_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblxydw = (Label)e.Item.FindControl("Label1");
            var t = TeacherHelper.Select(Convert.ToInt32(lblxydw.Text));
            if (t != null)
            {
                lblxydw.Text = t.Name;
            }
        }
    }
    protected void Repeater8_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblxydw = (Label)e.Item.FindControl("Label1");
            var t = TeacherHelper.Select(Convert.ToInt32(lblxydw.Text));
            if (t != null)
            {
                lblxydw.Text = t.Name;
            }
        }
    }
    protected void Repeater9_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblxydw = (Label)e.Item.FindControl("Label1");
            var t = TeacherHelper.Select(Convert.ToInt32(lblxydw.Text));
            if (t != null)
            {
                lblxydw.Text = t.Name;
            }
        }
    }
    protected void Repeater10_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblxydw = (Label)e.Item.FindControl("Label1");
            var t = TeacherHelper.Select(Convert.ToInt32(lblxydw.Text));
            if (t != null)
            {
                lblxydw.Text = t.Name;
            }
        }
    }
    protected void Repeater11_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblxydw = (Label)e.Item.FindControl("Label1");
            var t = TeacherHelper.Select(Convert.ToInt32(lblxydw.Text));
            if (t != null)
            {
                lblxydw.Text = t.Name;
            }
        }
    }
    protected void Repeater12_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblxydw = (Label)e.Item.FindControl("Label1");
            var t = TeacherHelper.Select(Convert.ToInt32(lblxydw.Text));
            if (t != null)
            {
                lblxydw.Text = t.Name;
            }
        }
    }
    protected void Repeater13_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblxydw = (Label)e.Item.FindControl("Label1");
            var t = TeacherHelper.Select(Convert.ToInt32(lblxydw.Text));
            if (t != null)
            {
                lblxydw.Text = t.Name;
            }
        }
    }
}
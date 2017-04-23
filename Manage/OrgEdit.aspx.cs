using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_OrgEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            User u = (User)Session["User"];
            if (u != null)
            {
                var db = new oucITEntities();
                var teac = (from a in db.Teacher
                            where a.UserID == u.UserID
                            select a).FirstOrDefault();
                if (teac != null)
                {
                    lblName.Text = teac.Name;
                    var query = (from a in db.Connection
                                 where a.UserID == u.UserID
                                 select a.ITGroup.GroupName).ToList();
                    if (query.Count != 0)
                    {
                        ddlGroup.DataSource = query;
                        ddlGroup.DataBind();
                        ITGroup itgroup = GroupHelper.Select(ddlGroup.Text);
                        var conn = (from a in db.Connection
                                    where a.UserID == u.UserID && a.GroupID == itgroup.GroupID
                                    select a).FirstOrDefault();
                        if (conn != null)
                        {
                            txtDuty.Text = conn.Duty;
                            txtJob.Text = conn.Job;
                            txtEmail.Text = conn.Email;
                            txtPhone.Text = conn.Phone;
                        }
                    }
                    else
                    {
                        Response.Redirect("Index.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }
        }
    }
    protected void ddlGroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        User u = (User)Session["User"];
        var db = new oucITEntities();
        ITGroup itgroup = GroupHelper.Select(ddlGroup.Text);
        var conn = (from a in db.Connection
                    where a.UserID == u.UserID && a.GroupID == itgroup.GroupID
                    select a).FirstOrDefault();
        if (conn != null)
        {
            txtDuty.Text = conn.Duty;
            txtJob.Text = conn.Job;
            txtEmail.Text = conn.Email;
            txtPhone.Text = conn.Phone;
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        User u = (User)Session["User"];
        var db = new oucITEntities();
        ITGroup itgroup = GroupHelper.Select(ddlGroup.Text);
        var conn = (from a in db.Connection
                    where a.UserID == u.UserID && a.GroupID == itgroup.GroupID
                    select a).FirstOrDefault();
        if (ConnHelp.MessUpdate(conn.GroupID, u.UserID, txtJob.Text, txtDuty.Text, txtPhone.Text, txtEmail.Text))
        {
            Response.Write("<script>alert('修改成功!');window.location.href ='Index.aspx'</script>");
        }
        else
        {
            Response.Write(JSHelper.ShowAlert("修改失败"));
        }
    }
}
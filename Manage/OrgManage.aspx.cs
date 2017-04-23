using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_OrgManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string type = Request.QueryString["type"];
            if (type == "delete")
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
                User u = (User)Session["User"];
                if (u != null)
                {
                    var db = new oucITEntities();
                    var teac = (from a in db.Teacher
                                where a.UserID == u.UserID
                                select a).FirstOrDefault();
                    var query = (from a in db.Connection
                                 where a.UserID == u.UserID && a.Right == 2
                                 select a.ITGroup.GroupName).ToList();
                    if (query.Count == 0)
                    {
                        Response.Redirect("Index.aspx");
                    }
                    else
                    {
                        ddlDelete.DataSource = query;
                        ddlDelete.DataBind();
                    }
                }
            }
            else
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                User u = (User)Session["User"];
                if (u != null)
                {
                    var db = new oucITEntities();
                    var teac = (from a in db.Teacher
                                where a.UserID == u.UserID
                                select a).FirstOrDefault();
                    var query = (from a in db.Connection
                                 where a.UserID == u.UserID && a.Right == 2
                                 select a.ITGroup.GroupName).ToList();
                    if (query.Count == 0)
                    {
                        Response.Redirect("Index.aspx");
                    }
                    else
                    {
                        ddlGroup.DataSource = query;
                        ddlGroup.DataBind();
                    }
                }
                lblName.Text = "";
            }
        }
    }
    protected void btnCheck_Click(object sender, EventArgs e)
    {
        var user = UserHelper.Select(txtNum.Text);
        if (user == null)
        {
            lblName.Text = "不存在该老师或学生";
        }
        else
        {
            var teac = TeacherHelper.Select(user.UserID);
            if (teac != null)
            {
                lblName.Text = teac.Name;
            }
            else
            {
                var stu = StudentHelper.Select(user.UserID);
                if (stu != null)
                {
                    lblName.Text = stu.Name;
                }
                else
                {
                    lblName.Text = "不存在该老师或学生";
                }
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        var user = UserHelper.Select(txtNum.Text);
        if (user != null)
        {
            var teac = TeacherHelper.Select(user.UserID);
            var stu = StudentHelper.Select(user.UserID);
            if (teac != null || stu != null)
            {
                var db = new oucITEntities();
                var itgroup = (from a in db.ITGroup
                               where a.GroupName == ddlGroup.Text
                               select a).SingleOrDefault();
                var conn = (from a in db.Connection
                            where a.UserID == user.UserID && a.GroupID == itgroup.GroupID
                            select a).FirstOrDefault();
                if (conn == null)
                {
                    int class1 = ddlClass.Text == "管理员" ? 1 : 0;
                    if (ConnHelp.Add(itgroup.GroupID, user.UserID, ddlClass.Text, class1, txtJob.Text, txtDuty.Text, txtPhone.Text, txtEmail.Text) == true)
                    {
                        Response.Write("<script>alert('添加成功!');window.location.href ='Index.aspx'</script>");
                    }
                    else
                    {
                        Response.Write(JSHelper.ShowAlert("添加失败"));
                    }
                }
                else
                {
                    Response.Write(JSHelper.ShowAlert("该老师或学生已存在于该组"));
                }
            }
            else
            {
                Response.Write(JSHelper.ShowAlert("该老师或学生不存在"));
            }
        }
        else
        {
            Response.Write(JSHelper.ShowAlert("该老师或学生不存在"));
        }
    }
    protected void btnDelCheck_Click(object sender, EventArgs e)
    {
        var user = UserHelper.Select(txtDelete.Text);
        if (user == null)
        {
            lblDelete.Text = "该组不存在该老师或学生";
        }
        else
        {
            var teac = TeacherHelper.Select(user.UserID);
            var stu = StudentHelper.Select(user.UserID);
            if (teac != null || stu != null)
            {
                var itgroup = GroupHelper.Select(ddlDelete.Text);
                var db = new oucITEntities();
                var conn = (from a in db.Connection
                            where a.UserID == user.UserID && a.GroupID == itgroup.GroupID
                            select a).SingleOrDefault();
                if (conn != null && teac != null)
                {
                    lblDelete.Text = teac.Name;
                }
                else if (conn != null && stu != null)
                {
                    lblDelete.Text = stu.Name;
                }
                else
                {
                    lblDelete.Text = "该组不存在该老师或学生";
                }
            }
            else
            {
                lblDelete.Text = "该组不存在该老师";
            }
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        var user = UserHelper.Select(txtDelete.Text);
        if (user == null)
        {
            Response.Write(JSHelper.ShowAlert("该组不存在该老师"));
        }
        else
        {
            var teac = TeacherHelper.Select(user.UserID);
            var stu = StudentHelper.Select(user.UserID);
            if (teac != null || stu != null)
            {
                var itgroup = GroupHelper.Select(ddlDelete.Text);
                var db = new oucITEntities();
                var conn = (from a in db.Connection
                            where a.UserID == user.UserID && a.GroupID == itgroup.GroupID
                            select a).SingleOrDefault();
                if (conn != null)
                {
                    db.Connection.Remove(conn);
                    db.SaveChanges();
                    Response.Write("<script>alert('删除成功!');window.location.href ='Index.aspx'</script>");
                }
                else
                {
                    Response.Write(JSHelper.ShowAlert("该组不存在该老师或学生"));
                }
            }
            else
            {
                Response.Write(JSHelper.ShowAlert("该组不存在该老师或学生"));
            }
        }
    }
}
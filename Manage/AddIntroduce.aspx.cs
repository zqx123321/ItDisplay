using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Default : System.Web.UI.Page
{
    private oucITEntities db = new oucITEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = ResolveUrl("~/ckfinder/");
        _FileBrowser.SetupCKEditor(CKEditor1);

        if (!IsPostBack)
        {
            User u = (User)Session["User"];
            if (TeacherHelper.Select(u.UserID) == null)
                Response.Redirect("Index.aspx");
            try
            {
                Introduce intr = db.Introduce.First(p => p.name == "学院介绍");
                CKEditor1.Text = intr.text;
            }
            catch { CKEditor1.Text = ""; }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Introduce intr = db.Introduce.First(p => p.name == DropDownList1.SelectedValue);
        intr.text = CKEditor1.Text;
        db.SaveChanges();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Introduce intr = db.Introduce.First(p => p.name == DropDownList1.SelectedValue);
            CKEditor1.Text = intr.text;
        }
        catch { CKEditor1.Text = ""; }
    }
}
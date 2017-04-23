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

    }
    protected void delete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            if (cb.Checked)
            {
                LogHelper.delete(int.Parse(GridView1.Rows[i].Cells[1].Text));
                JSHelper.Redirect("Log.aspx", true);
            }
                //ArticleHelper.RealDelete(int.Parse(GridView1.Rows[i].Cells[0].Text));
        }
    }
    protected void clearAll_Click(object sender, EventArgs e)
    {
        LogHelper.deleteAll();
        JSHelper.Redirect("Log.aspx", true);
        
    }
}
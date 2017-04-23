using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_StuOrg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int t;
            try
            {
                t = int.Parse(Request.QueryString["type"]);
                if (t != 2 && t != 3) t = 2;
            }
            catch { t = 2; }
            if (t == 3) label1.Text = "实验室";
            else  label1.Text = "学生组织";//if (t == 2)
            Repeater1.DataSource = GroupHelper.GetGroupsByType(t);
            Repeater1.DataBind();
        }
    }
}
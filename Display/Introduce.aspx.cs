using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Introduce : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string name = Request.QueryString["name"];
            int id;
            try
            {
                id = int.Parse(Request.QueryString["id"]);
            }
            catch { id = 1; }
            oucITEntities db = new oucITEntities();
            Introduce intr;
            try
            {
                if (name != null)
                    intr = db.Introduce.First(p => p.name == name);
                else
                    intr = db.Introduce.First(p => p.id == id);
            }
            catch { intr = db.Introduce.First(); };
            Label1.Text = intr.name;
            Literal1.Text = intr.text;
        }
    }
}
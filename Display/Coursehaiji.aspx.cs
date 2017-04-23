using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        oucITEntities db = new oucITEntities();
        Repeater1.DataSource = CourseHelper.GetCoursesOfTheMajor("海洋技术",db);
        Repeater1.DataBind();
    }
}
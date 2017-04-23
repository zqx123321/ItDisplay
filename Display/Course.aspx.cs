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
        if (!IsPostBack)
        {
            oucITEntities db = new oucITEntities();
            string temTitle = Request.QueryString["depart"];
            LTitle.Text = temTitle.Replace('<', ' ').Replace('>', ' ').Replace('"', ' ');
            //string[] me;
            switch (Request.QueryString["depart"])
            {
                case "电子工程系":
                    MenuFirstItem.Text = "电子信息科学与技术";
                    menu.DataSource = new string[] { "电子信息工程", "通信工程" };
                    menu.DataBind();
                    Repeater1.DataSource = CourseHelper.GetCoursesOfTheMajor("电子信息科学与技术", db);
                    Repeater1.DataBind();
                    Repeater2.DataSource = CourseHelper.GetCoursesOfTheMajor("电子信息工程", db);
                    Repeater2.DataBind();
                    Repeater3.DataSource = CourseHelper.GetCoursesOfTheMajor("通信工程", db);
                    Repeater3.DataBind();break;
                default:
                    MenuFirstItem.Text = "物理学";
                    menu.DataSource = new string[] { "光信息科学与技术" };
                    menu.DataBind();
                    Repeater1.DataSource = CourseHelper.GetCoursesOfTheMajor("物理学", db);
                    Repeater1.DataBind();
                    Repeater2.DataSource = CourseHelper.GetCoursesOfTheMajor("光信息科学与技术", db);
                    Repeater2.DataBind();
               
                   break;
                case "计算机科学与技术系":
                    MenuFirstItem.Text = "计算机科学与技术";
                    Repeater1.DataSource = CourseHelper.GetCoursesOfTheMajor("计算机科学与技术", db);
                    Repeater1.DataBind();
                
                   break;
                case "海洋技术系":
                    MenuFirstItem.Text = "海洋技术";
                    Repeater1.DataSource = CourseHelper.GetCoursesOfTheMajor("海洋技术", db);
                    Repeater1.DataBind();
               
                    break;
               
            }
            
           
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Default : System.Web.UI.Page
{
    private int courseID=0;//修改模式下记录该课程的id
    protected void Page_Load(object sender, EventArgs e)
    {


        #region //添加jQuery脚本
        ScriptResourceDefinition myScriptResDef = new ScriptResourceDefinition();
        myScriptResDef.Path = "~/Scripts/jquery-1.4.2.min.js";
        myScriptResDef.DebugPath = "~/Scripts/jquery-1.4.2.js";
        myScriptResDef.CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.4.2.min.js";
        myScriptResDef.CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.4.2.js";
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery", null, myScriptResDef);
        #endregion
        try
        {
            courseID = int.Parse(Request.QueryString["id"]);
        }
        catch { courseID = 0; };
        if (!IsPostBack)
        {
            User u = (User)Session["User"];
            if (TeacherHelper.Select(u.UserID) == null)
                Response.Redirect("Index.aspx");

            if (Request.QueryString["id"] != null)//如果是修改模式
            {
                Button3.Visible = true;
                Button2.Text = "替换上传";          
               
                #region //为控件赋值
                oucITEntities db = new oucITEntities();
                Course co = CourseHelper.GetCourseById(courseID,db);
                courseName.Text = co.CourseName;
                department.SelectedValue = co.Department;
                major.SelectedValue = co.Major;
                courseType.SelectedValue = co.Type.ToString();//TODO:
                CoNumber.Text = co.Number;
                EnglishName.Text = co.EnglishName;
                TotalHours.Text = co.CourseHours.ToString();
                TotalMark.Text = co.CourseMark.ToString();
                Textbook.Text = co.Textbook;
                TextbookAuthor.Text = co.TextbookAuthor;
                TextbookPublisher.Text = co.TextbookPublisher;
                TextbookVersion.Text = co.TextbookVersion;
                CourseObject.Text = co.CourseObject;
                ExamType.Text = co.ExamType;
                reference.Text = co.Reference;
                HiddenField1.Value = co.ContentAndTimeArrange;
                if (co.Type == 3)
                {
                    WeekHours.Text = co.WeekHours.ToString();
                    TermArrange.Text = co.TermArrange;
                    ExperimentPlace.Text = co.ExperimentPlace;
                    ExperimentObject.Text = co.ExperimentObject;
                    
                }
                else if (co.Type == 2)
                {
                    ExperimentMark.Text = co.ExperimentMark.ToString();
                    ExperimentHours.Text = co.ExperimentHours.ToString();
                    ExperimentPlace.Text = co.ExperimentPlace;
                    ExperimentPartObject.Text = co.ExperimentPartObject;
                }
                #endregion
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       // string filename= UploadHelper.uploadText(FileUpload1);
        User u = (User)Session["User"];
        if (TeacherHelper.Select(u.UserID).Department != department.SelectedValue)
        {
           Response.Write( JSHelper.ShowAlert("您没有权限添加该系的课程介绍！"));
           return;
        }

        if (HiddenField1.Value != "")
        {
            #region //以用户输入构建Course对象
            Course co = new Course
            {
                CourseName = courseName.Text,
                Department = department.SelectedValue,
                Major = major.SelectedValue,
                Type = int.Parse(courseType.SelectedValue),
                Number = CoNumber.Text,
                EnglishName = EnglishName.Text,
                CourseHours = int.Parse(TotalHours.Text),
                CourseMark = float.Parse(TotalMark.Text),
                Textbook = Textbook.Text,
                TextbookAuthor = TextbookAuthor.Text,
                TextbookPublisher = TextbookPublisher.Text,
                TextbookVersion = TextbookVersion.Text,
                CourseObject = CourseObject.Text,
                ExamType = ExamType.Text.Length > 24 ? ExamType.Text.Substring(0, 23) : ExamType.Text,
                ContentAndTimeArrange = HiddenField1.Value,
                Reference=reference.Text
            };
            if (co.Type == 3)
            {
                co.WeekHours = int.Parse(WeekHours.Text);
                co.TermArrange = TermArrange.Text;
                co.ExperimentPlace = ExperimentPlace.Text;
                co.ExperimentObject = ExperimentObject.Text;
            }
            else if (co.Type == 2)
            {
                co.ExperimentHours = int.Parse(ExperimentHours.Text);
                co.ExperimentMark = float.Parse(ExperimentMark.Text);
                co.ExperimentPlace = ExperimentPlace.Text;
                co.ExperimentPartObject = ExperimentPartObject.Text;
            }
            #endregion
            #region 判断是添加还是修改，修改数据库
            if (courseID == 0)
            {
                oucITEntities db = new oucITEntities();
                if (CourseHelper.AddCourse(co,db))
                {
                   Response.Write( JSHelper.ShowAlert("添加成功"));
                    JSHelper.Redirect("CourseList.aspx", true);
                }
                else Response.Write( JSHelper.ShowAlert("添加失败"));
            }
            else
            {
                co.CourseID = courseID;
                oucITEntities db = new oucITEntities();
                if (CourseHelper.ChangeCourse(co,db))
                {
                   Response.Write( JSHelper.ShowAlert("添加成功"));
                    JSHelper.Redirect("CourseList.aspx", true);
                }
                else Response.Write( JSHelper.ShowAlert("添加失败"));
            }
            #endregion
        }
        else Response.Write( JSHelper.ShowAlert("添加失败"));
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        HiddenField1.Value = UploadHelper.uploadText(FileUpload1);
        if (HiddenField1.Value != "")
            Label1.Text = "【上传成功】";
        else Label1.Text = "【上传失败】";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("CourseList.aspx");
    }
   
}
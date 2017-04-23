using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Default : System.Web.UI.Page
{
    private int courseID = 0;
    private DateTime? GetTime(string y, string m, string d)
    {
        try
        {
            int year = int.Parse(y);
            int month = int.Parse(m);
            int day = int.Parse(d);
            DateTime t = new DateTime(year, month, day,DateTime.Now.Hour,DateTime.Now.Minute,DateTime.Now.Second);
            return t;
        }
        catch { return null; }
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            courseID = int.Parse(Request.QueryString["id"]);
        }
        catch { courseID = 0; };
      
        if (!IsPostBack)
        {
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = ResolveUrl("~/ckfinder/");
            _FileBrowser.SetupCKEditor(CKEditor1);

            if (courseID != 0)//判断是添加还是修改
            {
                Article ar = ArticleHelper.GetArticleByID(courseID);
                #region 为控件赋值
                tbTitle.Text = ar.Title;
                tbSubTitle.Text = ar.SubTitle;
                subTypes.Visible = false;
                Label11.Text = ar.Type;
                DropDownList3.SelectedValue = ar.Author;
                DropDownList4.SelectedValue = ar.Source;
                if (!string.IsNullOrEmpty(ar.Link))
                {
                    CheckBox1.Checked = true;
                    tbLink.Text = ar.Link;
                }
                else
                {
                    CKEditor1.Text = ar.Content;
                }
                CheckBox2.Checked = string.IsNullOrEmpty(ar.ImgUrl) ? false : true;
                cbAttach.Checked = ar.Attachment;
                cbHot.Checked = ar.Hot;
                cbTop.Checked = ar.OnTop;
                tyear.Text = ar.UpdateTime.Year.ToString();
                tmonth.Text = ar.UpdateTime.Month.ToString();
                tday.Text = ar.UpdateTime.Day.ToString();
               // Calendar1.SelectedDate = ar.UpdateTime;
                #endregion
            }
            else// Label11.Text = Request.QueryString["type"];//文章类型
            {
                tyear.Text = DateTime.Now.Year.ToString();
                tmonth.Text = DateTime.Now.Month.ToString();
                tday.Text = DateTime.Now.Day.ToString();
                Label11.Visible = false;
                subTypes.DataSource = ArticleHelper.GetSubTypes(Request.QueryString["type"], ((User)Session["User"]).UserID);
                subTypes.DataBind();
            }
        }
        

    }
    private string GetImgUrl(string html)
    {
        //Regex re = new Regex(@"<img ");
        int index = html.IndexOf("<img");
        if (index == -1) return "";//TODO: 现在返回的是整个img标签，要从img标签中取出src的值
        html = html.Substring(index, html.Substring(index).IndexOf(@"/>") + 2);
        Regex re = new Regex("src=\"[^\"]+\"");
        Match ma = re.Match(html);
        return ma.Value.Remove(ma.Value.Length-1).Remove(0,5);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
            #region //以用户输入构建Article对象
        Article ar;
        if (CheckBox1.Checked)
            ar = new Article
            {
                Title = tbTitle.Text,
                SubTitle = tbSubTitle.Text,
                AuthorID = ((User)Session["User"]).UserID,
                Author = DropDownList3.SelectedValue == "我自己" ? UserHelper.RtnName(((User)Session["User"]).UserID) : DropDownList3.SelectedValue,
                Source = DropDownList4.SelectedValue == "我自己" ? UserHelper.RtnName(((User)Session["User"]).UserID) : DropDownList4.SelectedValue,

                Link = tbLink.Text,
                Type =Label11.Visible?Label11.Text: Request.QueryString["type"] + ":" + subTypes.SelectedValue,//例如:党建工作:党员发展
                OnTop = cbTop.Checked,
                Hot = cbHot.Checked,
                Attachment = cbAttach.Checked,
                UpdateTime = GetTime(tyear.Text,tmonth.Text,tday.Text)??DateTime.Now,
                Deleted = false,
                Content = "&nbsp;",
                ImgUrl = null // HiddenField1.Value == "" ? null : HiddenField1.Value,CheckBox2.Checked?GetImgUrl(CKEditor1.Text):
            };
        else
            ar = new Article
            {
                Title = tbTitle.Text,
                SubTitle = tbSubTitle.Text,
                AuthorID = ((User)Session["User"]).UserID,
                Author = DropDownList3.SelectedValue == "我自己" ? UserHelper.RtnName(((User)Session["User"]).UserID) : DropDownList3.SelectedValue,
                Source = DropDownList4.SelectedValue == "我自己" ? UserHelper.RtnName(((User)Session["User"]).UserID) : DropDownList4.SelectedValue,

                Link = null,
                Type = Label11.Visible ? Label11.Text : Request.QueryString["type"] + ":" + subTypes.SelectedValue,//例如:党建工作:党员发展
                OnTop = cbTop.Checked,
                Hot = cbHot.Checked,
                Attachment = cbAttach.Checked,
                UpdateTime = GetTime(tyear.Text, tmonth.Text, tday.Text) ?? DateTime.Now,
                Deleted = false,
                Content = CKEditor1.Text,
                ImgUrl = CheckBox2.Checked ? GetImgUrl(CKEditor1.Text) : null
            };
            #endregion
            #region 判断是添加还是修改，修改数据库			
            if (courseID == 0)
            {
				
                if (ArticleHelper.AddArticle(ar))
                {
					if(ar.Type.Equals("就业工作:招聘信息"))
					{
						CHelper.Cread(ar.ArticleID,ar.Title,ar.Type);
					}
                    Response.Write(JSHelper.ShowAlert("添加成功"));
                    JSHelper.Redirect("MyArticles.aspx", true);
                }
                else Response.Write(JSHelper.ShowAlert("添加失败"));
            }
            else
            {
                Article tem = ArticleHelper.GetArticleByID(courseID);
                ar.Hit = tem.Hit;
                ar.ArticleID = courseID;
                if (ArticleHelper.UpdateArticle(ar))
                {
                    Response.Write(JSHelper.ShowAlert("修改成功"));
                    JSHelper.Redirect("MyArticles.aspx", true);
                }
                else Response.Write(JSHelper.ShowAlert("修改失败"));
            }
            #endregion
        
        
       
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        PreText.Text = CKEditor1.Text;
        PreTitle.Text = tbTitle.Text;
        Panel1.Visible = true;// TODO:预览功能.打开新的页面
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked) content.Visible = false;
        else content.Visible = true;
    }
}
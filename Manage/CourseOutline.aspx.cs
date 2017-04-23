using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)//课程大纲使用文件系统存储,未使用数据库!!!
        {
            User u = (User)Session["User"];
            if (TeacherHelper.Select(u.UserID) == null)
                Response.Redirect("Index.aspx");
        }
    }
    /// <summary>
    /// 上传课程大纲
    /// </summary>
    /// <param name="fileUpload">fileupload控件</param>
    private void Upload(FileUpload fileUpload)
    {
        string[] allowFile = {".doc",".docx",".xls",".xlsx",".pdf",".jpg",".png",".txt",".zip",".rar" };

        if (fileUpload.HasFile)
        {
            var savePath = Server.MapPath("~/Uploads/outlines/");
           
            var fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
            if (allowFile.Contains(fileExtension))
            {
                string[] outlines = Directory.GetFiles(Server.MapPath("~/Uploads/outlines/"), "*" + fileUpload.ID + ".*");
                if (outlines.Count() == 1)
                    File.Delete(outlines[0]);//每个专业只有一份,删除原先的
                var fileName = fileUpload.ID + fileExtension;// 
                fileUpload.SaveAs(Path.Combine(savePath, fileName));
                Response.Write(JSHelper.ShowAlert("上传成功"));
                return;
            }
        }
        Response.Write(JSHelper.ShowAlert("上传失败"));
    }
    /// <summary>
    /// 获得课程大纲的上传时间
    /// </summary>
    /// <param name="name">专业名</param>
    /// <returns></returns>
    public string GetUpdateTime(string name)
    {
        string[] outlines = Directory.GetFiles(Server.MapPath("~/Uploads/outlines/"));
        foreach (string ou in outlines)
        {
            if (ou.Contains(name))
                return File.GetLastWriteTime(ou).ToLongDateString();
        }
        return "未上传";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Upload(wuli);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Upload(guangke);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Upload(diangong);
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Upload(dianke);
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Upload(tongxin);
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Upload(jisuanji);
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Upload(haiji);
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Upload(zhongfa);
    }
}
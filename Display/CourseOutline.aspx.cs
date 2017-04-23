using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string GetFileName(string name)//获取文件名(主要是获取扩展名,因为文件名是确定的,但扩展名不确定.
    {
        string[] outlines = Directory.GetFiles(Server.MapPath("~/Uploads/outlines/"));
        foreach (string ou in outlines)
        {
            if (ou.Contains(name))
                return (new FileInfo(ou)).Name;//
        }
        return "";
    }
}
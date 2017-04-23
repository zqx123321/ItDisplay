using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

/// <summary>
/// UploadHelper 的摘要说明
/// </summary>
public static class UploadHelper
{
    /// <summary>
    /// 允许上传的文件的扩展名
    /// </summary>
    private static string[] allowedExtension = { ".pdf", ".swf", ".flv", ".mp4", ".png", ".gif", ".jpg" };
    private static string[] allowFile = {".doc",".docx",".xls" };
    /// <summary>
    /// 保存上传的文件，返回相对于当前页面的路径
    /// </summary>
    /// <param name="fileUpload">FileUpload 控件</param>
    /// <returns>相对于当前页面的路径，未储存则为""</returns>
    public static string upload(FileUpload fileUpload)
    {
        if (fileUpload.HasFile)
        {
            var savePath = HttpContext.Current.Server.MapPath("~/Uploads/");
            var fileName = fileUpload.FileName;
            var fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
            if (allowedExtension.Contains(fileExtension))
            {
                fileName = DateTime.Now.ToString("yyyyMMdd-HHmmssff_") + fileName;
                fileUpload.SaveAs(Path.Combine(savePath, fileName));
                return "../Uploads/" + fileName;
            }
        }
        return "";
    }
    public static string uploadText(FileUpload fileUpload)
    {
        if (fileUpload.HasFile)
        {
            var savePath = HttpContext.Current.Server.MapPath("~/Uploads/");
            // fileName = fileUpload.FileName;
            var fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
            if (allowFile.Contains(fileExtension))
            {
                var fileName = DateTime.Now.ToString("yyyyMMdd-HHmmssff_") + fileExtension;
                fileUpload.SaveAs(Path.Combine(savePath, fileName));
                return "../Uploads/" + fileName;
            }
        }
        return "";
    }
    public static string UnlimitedUpload(FileUpload fileUpload)
    {
        if (fileUpload.HasFile)
        {
            var savePath = HttpContext.Current.Server.MapPath("~/Uploads/");
            var fileName = fileUpload.FileName;
            fileName = DateTime.Now.ToString("yyyyMMdd-HHmmssff_") + fileName;
            fileUpload.SaveAs(Path.Combine(savePath, fileName));
            return "../Uploads/" + fileName;
        }
        return "";
    }
}
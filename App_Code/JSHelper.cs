using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;


/// <summary>
/// JSHelper 的摘要说明
/// </summary>
public static  class JSHelper
{

    #region 页面上下文中的对象们

    /// <summary>
    /// 当前正在执行的页面
    /// </summary>
    private static Page Page
    {
        get
        {
            return HttpContext.Current.CurrentHandler as Page ?? new Page();
        }
    }

    /// <summary>
    /// 获取当前 HTTP 请求的 HttpRequest 对象
    /// </summary>
    private static HttpRequest Request
    {
        get
        {
            return HttpContext.Current.Request;
        }
    }

    /// <summary>
    /// 获取当前 HTTP 响应的 HttpResponse 对象
    /// </summary>
    private static HttpResponse Response
    {
        get
        {
            return HttpContext.Current.Response;
        }
    }

    #endregion
    
    /// <summary>
    /// 显示带有一段消息和一个确认按钮的警告框
    /// </summary>
    /// <param name="message">弹出的对话框中显示的纯文本</param>
    public static string  ShowAlert(string message)
    {
        message = message.Replace("'", "\\'");
        //RegisterStartupScript(string.Format("alert('{0}')", message));
        return "<script type=\"text/javascript\">alert('"+message+"')</script>";
    }
    public static string ShowAlertAndBack(string message)
    {
        message = message.Replace("'", "\\'");
        //RegisterStartupScript(string.Format("alert('{0}')", message));
        return "<script type=\"text/javascript\">alert('" + message + "');history.back()</script>";
    }
//<<<<<<< HEAD
    public static string js(string js)
    {
        return "<script type=\"text/javascript\">" + js + "</script>";
    }
	
//=======

    /// <summary>
    /// 将客户端重定向到新的 URL (首先将 URL 转换为在请求客户端可用的 URL)
    /// 然后显示带有一段消息和一个确认按钮的警告框
    /// </summary>
    /// <param name="url">目标位置</param>
    /// <param name="message">弹出的对话框中显示的纯文本</param>
    /// <param name="endResponse">如果为 true，则终止当前进程</param>
    public static void RedirectThenAlert(string url, string message, bool endResponse = false)
    {
        message = message.Replace('#', '_');
        url = string.Format("{0}#alert-{1}", url, message);
        Redirect(url, endResponse);
    }

    /// <summary>
    /// 将客户端重定向到新的 URL (首先将 URL 转换为在请求客户端可用的 URL)
    /// </summary>
    /// <param name="url">目标位置</param>
    public static void Redirect(string url, bool endResponse = false)
    {
        Response.Redirect(Page.ResolveUrl(url), endResponse);
        
    }
    /// <summary>
    /// 刷新页面，然后显示带有一段消息和一个确认按钮的警告框
    /// </summary>
    /// <param name="message">弹出的对话框中显示的纯文本</param>
    /// <param name="endResponse">如果为 true，则终止当前进程</param>
    public static void RefreshThenAlert(string message, bool endResponse = false)
    {
        RedirectThenAlert(Request.RawUrl, message, endResponse);
    }
//>>>>>>> 4c0cdd8a47b0a5c8adf400800043818d7857fc25
}
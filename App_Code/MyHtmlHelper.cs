using System.Text.RegularExpressions;

/// <summary>
/// HtmlHelper 的摘要说明
/// </summary>
public static class MyHtmlHelper
{
    /// <summary>
    /// 移除HTML中的所有标签
    /// </summary>
    /// <param name="html">HTML文档</param>
    /// <returns>移除标签后的纯文本</returns>
    public static  string RemoveTags(string html)
    {
        Regex re = new Regex("<[^>]+>");
        MatchCollection matchs = re.Matches(html);
        foreach (Match m in matchs)
        {
           html = html.Replace(m.Value, "");
        }
        html = html.Replace("&nbsp;", "");
        return html;
       // html.Replace("","")
    }
    public static string GetImgUrl(string html)
    {
        //Regex re = new Regex(@"<img ");
        int index = html.IndexOf("<img");
        if (index == -1) return "";//TODO: 现在返回的是整个img标签，要从img标签中取出src的值
        html = html.Substring(index, html.Substring(index).IndexOf(@"/>") + 2);
        Regex re = new Regex("src=\"[^\"]+\"");
        Match ma = re.Match(html);
        return ma.Value.Remove(ma.Value.Length - 1).Remove(0, 5);
    }
}
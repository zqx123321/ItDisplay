using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class IndexCard
{
    public string title { get; set; }
    public string img { get; set; }
    public string text { get; set; }
    public int id { get; set; }
    public bool HasImg { get; set; }
    public DateTime time { get; set; }
    public IndexCard(Article ar)
    {
        title = ar.Title;
        id = ar.ArticleID;
        time = ar.UpdateTime;
        string tem = MyHtmlHelper.RemoveTags(ar.Content);
        string imgurl = MyHtmlHelper.GetImgUrl(ar.Content);
        if (imgurl == "")
        {
            img = "";
            HasImg = false;
            text = tem.Length >= 130 ? tem.Substring(0, 130) + "..." : tem;
        }
        else
        {
            img = imgurl;
            HasImg = true;
            text = tem.Length >= 66 ? tem.Substring(0, 66) + "..." : tem;

        }
    }
}

public static class ArticleHelper
{

    ///private static  oucITEntities db = new oucITEntities();
    /// <summary>
    /// 将文章放入回收站
    /// </summary>
    /// <param name="id">文章id</param>
    /// <returns>是否成功</returns>

    public static bool Delete(int id)
    {
        try
        {
            using (var db = new oucITEntities())
            {
                var query = from m in db.Article
                            where m.ArticleID == id
                            select m;
                query.First().Deleted = true;
                db.SaveChanges();
                return true;
            }
        }
        catch { return false; }
    }
    /// <summary>
    /// 删除文章
    /// </summary>
    /// <param name="id">文章id</param>
    /// <returns>是否成功</returns>
    public static bool RealDelete(int id)
    {
        try
        {
            using (var db = new oucITEntities())
            {
                var query = from m in db.Article
                            where m.ArticleID == id
                            select m;
                db.Article.Remove(query.First());
                db.SaveChanges();
                return true;
            }
        }
        catch { return false; }
    }
    /// <summary>
    /// 添加文章
    /// </summary>
    /// <param name="ar">Article对象</param>
    /// <returns>是否成功</returns>
    public static bool AddArticle(Article ar)
    {
        try
        {
            using (var db = new oucITEntities())
            {
                db.Article.Add(ar);
                db.SaveChanges();
                return true;
            }
        }
        catch { return false; }
    }
    /// <summary>
    /// 更改文章
    /// </summary>
    /// <param name="ar">Article对象</param>
    /// <returns>是否成功</returns>
    public static bool UpdateArticle(Article ar)
    {
        try
        {
            using (var db = new oucITEntities())
            {
                Article c = db.Article.First(e => e.ArticleID == ar.ArticleID);
                db.Entry(c).CurrentValues.SetValues(ar);
                db.SaveChanges();
                return true;
            }
        }
        catch { return false; }
    }

    /// <summary>
    /// 检查用户权限，生成可添加文章类型的列表。
    /// </summary>
    /// <param name="id">用户id</param>
    /// <returns>可添加文章类型的列表</returns>
    public static List<string> CheckRight(int id)
    {
        using (var db = new oucITEntities())
        {
            List<string> ls = new List<string>();
            var query = from g in db.Connection
                        where g.UserID == id
                        select g.ITGroup.GroupName;

            List<string> groupName = query.ToList();
            if (groupName.Contains("文章"))
            {
                ls.Add("学院新闻");
                ls.Add("党建工作");
                ls.Add("团建工作");
                ls.Add("奖助工作");
                ls.Add("就业工作");
                ls.Add("科技创新");
                ls.Add("实验室建设");
				ls.Add("学生风采");
                ls.Add("常用下载");
                ls.Add("管理规定");
            }
            if (groupName.Contains("学生会") || groupName.Contains("研究生会") || groupName.Contains("研究会")
                || groupName.Contains("东乡行西部志愿者协会") || groupName.Contains("爱特工作室") || groupName.Contains("自强社")
                || groupName.Contains("心晴协会") || groupName.Contains("信息之光志愿服务者协会") || groupName.Contains("蓝鲸俱乐部")|| groupName.Contains("信印象"))
            {
                ls.Add("学生组织");
            }
            return ls;
        }
    }
    /// <summary>
    /// 根据大类型获得所属的副类型列表
    /// </summary>
    /// <param name="type">大类型</param>
    /// <returns>副类型列表</returns>
    public static List<string> GetSubTypes(string type)
    {
        List<string> ls = new List<string>();
        var db = new oucITEntities();

        switch (type)
        {
            case "学院新闻": ls.Add("学院新闻");
                break;
            case "党建工作": ls.Add("规章制度");
                ls.Add("党员发展");
                ls.Add("党支部建设"); break;
            case "团建工作": ls.Add("规章制度");
                ls.Add("团支部建设");
                ls.Add("特色活动"); break;
            case "奖助工作": ls.Add("通知公告");
                ls.Add("相关下载");
                ls.Add("获奖情况"); break;
            case "就业工作": ls.Add("通知公告");
                ls.Add("就业政策");
                ls.Add("招聘信息");
                ls.Add("实习招聘");break;
            case "科技创新": ls.Add("科技创新");
                break;
            case "实验室建设":
                var query = from c in db.Connection
                            where c.ITGroup.groupType == 3
                            select c.ITGroup.GroupName;
                ls.AddRange(query.ToList());
                break;
            case "常用下载": ls.Add("常用下载");
                ls.Add("");
                ls.Add(""); break;
            case "学生组织":

                var query1 = from c in db.Connection
                             where c.ITGroup.groupType == 2
                             select c.ITGroup.GroupName;
                ls.AddRange(query1.ToList());

                break;
			case "学生风采": ls.Add("学生风采");
                break;
            case "管理规定": ls.Add("管理规定");
                break;
            default: ls.Add("规章制度");
                ls.Add("党员发展");
                ls.Add("党支部建设"); break;
        }
        return ls;
    }
    /// <summary>
    /// 获得该用户能添加的文章的副类型
    /// </summary>
    /// <param name="type">大类型</param>
    /// <param name="userID">用户id</param>
    /// <returns>副类型列表</returns>
    public static List<string> GetSubTypes(string type, int userID)
    {
        List<string> ls = new List<string>();
        var db = new oucITEntities();
        switch (type)
        {
		
            case "学院新闻": ls.Add("学院新闻");
                ls.Add("通知公告");
                break;
            case "党建工作": ls.Add("规章制度");
                ls.Add("党员发展");
                ls.Add("党支部建设"); break;
            case "团建工作": ls.Add("规章制度");
                ls.Add("团支部");
                ls.Add("特色活动"); break;
            case "奖助工作": ls.Add("通知公告");
                ls.Add("相关下载");
                ls.Add("获奖情况"); break;
            case "就业工作": ls.Add("通知公告");
                ls.Add("就业政策");
                ls.Add("招聘信息");
                ls.Add("实习招聘");break;
            case "科技创新": ls.Add("科技创新");
                break;
            case "实验室建设":
                var query = from c in db.Connection
                            where c.UserID == userID && c.ITGroup.groupType == 3
                            select c.ITGroup.GroupName;
                ls.AddRange(query.ToList());
                break;
            case "常用下载": ls.Add("常用下载");
                break;
            case "党建管理规则": ls.Add("党建管理规则");
                break;
			case "学生风采": ls.Add("学生风采");
                break;
            case "管理规定": ls.Add("管理规定");
                break;                
            case "学生组织":

                var query2 = from c in db.Connection
                             where c.UserID == userID && c.ITGroup.groupType == 2
                             select c.ITGroup.GroupName;
                ls.AddRange(query2.ToList());

                break;

        }
        return ls;
    }
    /// <summary>
    /// 根据大类型获得文章
    /// </summary>
    /// <param name="SupType"></param>
    /// <returns></returns>
    public static List<Article> GetArticlesBySupType(string SupType)
    {
        using (var db = new oucITEntities())
        {
            return db.Article.Where(e => e.Type.Contains(SupType) && e.Deleted == false).OrderByDescending(e => e.UpdateTime).Take(5).ToList();
        }

    }
    /// <summary>
    /// 首页卡片
    /// </summary>
    /// <param name="type">类型</param>
    /// <returns>首页卡片列表</returns>
    public static List<IndexCard>[] IndexCards(string type)
    {
        using (var db = new oucITEntities())
        {
            List<Article> ls1 = db.Article.Where(e => e.Type == "学院新闻:学院新闻" && e.Deleted == false && e.Link == null).OrderByDescending(p => p.UpdateTime).Take(4).ToList();
            List<Article> ls2 = db.Article.Where(e => (e.Type == "就业工作:招聘信息" || e.Type == "就业工作:实习招聘") && e.Deleted == false && e.Link == null).OrderByDescending(p => p.UpdateTime).Take(4).ToList();
            List<Article> ls3 = db.Article.Where(e => (e.Type == "奖助工作:通知公告" || e.Type == "就业工作:通知公告" || e.Type == "学院新闻:通知公告" || e.Type == "科技创新:科技创新") && e.Deleted == false && e.Link == null).OrderByDescending(p => p.UpdateTime).Take(4).ToList();

            // List<Article> ls=  
            // List<Article> ls2 = db.Article.Where(e => e.Hot == true&&e.Type!=type && e.Deleted == false && e.Link == null).OrderByDescending(p => p.UpdateTime).Take(6).ToList();
            // ls.AddRange(ls2);
            List<Article>[] lss = { ls1, ls2, ls3 };
            List<IndexCard>[] c = { null, null, null };
            for (int i = 0; i < 3; i++)
            {
                List<IndexCard> cards = new List<IndexCard>();

                foreach (Article ar in lss[i])
                {
                    cards.Add(new IndexCard(ar));
                }
                c[i] = cards;
            }
            return c;
        }
    }
    /// <summary>
    /// 将回收站里的文章恢复
    /// </summary>
    /// <param name="id">文章id</param>
    /// <returns>是否成功</returns>
    public static bool Restore(int id)
    {

        try
        {
            using (var db = new oucITEntities())
            {
                var query = from m in db.Article
                            where m.ArticleID == id
                            select m;
                query.First().Deleted = false;
                db.SaveChanges();
                return true;
            }
        }
        catch { return false; }
    }
    /// <summary>
    /// 根据id获取文章
    /// </summary>
    /// <param name="id">id</param>
    /// <returns>Artic对象</returns>
    public static Article GetArticleByID(int id)
    {
        using (var db = new oucITEntities())
        {
            try
            {

                return db.Article.First(e => e.ArticleID == id);

            }
            catch { return db.Article.First(); }
        }
    }
    /// <summary>
    /// 获得该用户添加的所有文章
    /// </summary>
    /// <param name="userID">用户id</param>
    /// <returns></returns>
    public static List<Article> GetMyArticles(int userID)
    {
        using (var db = new oucITEntities())
        {
            return db.Article.Where(e => e.AuthorID == userID && e.Deleted == false).OrderByDescending(e => e.UpdateTime).ToList();
        }
    }

    public static List<Article> MyRecycle(int userID)
    {
        using (var db = new oucITEntities())
        {
            return db.Article.Where(e => e.AuthorID == userID && e.Deleted == true).ToList();
        }

    }
    /// <summary>
    /// 根据类型获得文章
    /// </summary>
    /// <param name="type"></param>
    /// <returns></returns>
    public static List<Article> GetArticlesByType(string type)
    {
        using (var db = new oucITEntities())
        {
            DateTime limit= DateTime.Now.AddDays(-20);
            var delectls = db.Article.Where(a => a.UpdateTime < limit &&a.OnTop==true);
            foreach(var item in delectls)
            {
                item.OnTop = false;
            }
            db.SaveChanges();
            List<Article> ls = db.Article.Where(e => e.Deleted == false && e.Type == type && e.OnTop == true).OrderByDescending(e => e.UpdateTime).ToList();
            
            ls.AddRange(db.Article.Where(e => e.Type == type && e.Deleted == false && e.OnTop == false).OrderByDescending(e => e.UpdateTime).ToList());
            return ls;
        }
    }
    /// <summary>
    /// 获得首页滚动图片
    /// </summary>
    /// <returns></returns>
    public static List<Article> DynamicImgs()
    {
        using (var db = new oucITEntities())
        {
            var query = from im in db.Article
                        where im.ImgUrl != "" && im.ImgUrl != null && im.Deleted == false && im.Link == null
                        orderby im.UpdateTime descending
                        select im;
            return query.Take(6).ToList();
        }
    }
    /// <summary>
    /// 文章点击量加1
    /// </summary>
    /// <param name="id">文章id</param>
    public static void AddHitCount(int id)
    {
        using (var db = new oucITEntities())
        {
            try
            {
                Article ar = db.Article.First(e => e.ArticleID == id);
                if (ar.Hit == null) ar.Hit = 1;
                ar.Hit++;
                db.SaveChanges();
            }
            catch { }
        }
    }
}

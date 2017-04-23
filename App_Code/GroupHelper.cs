using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// GroupHelper 的摘要说明
/// </summary>
public class GroupHelper
{
	public GroupHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 添加group
    /// </summary>
    /// <param name="name">group名</param>
    /// <param name="type">group类型</param>
    /// <param name="img">图片链接</param>
    /// <param name="link">网站链接</param>
    /// <returns>是否成功</returns>
    public static bool Add(string name, string type, string img, string link)
    {
        try
        {
            var db = new oucITEntities();
            ITGroup itgroup = new ITGroup();
            itgroup.GroupName = name;
            itgroup.groupType = ChangeType(type);
            itgroup.Img = img;
            itgroup.Link = link;
            db.ITGroup.Add(itgroup);
            db.SaveChanges();
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }

    /// <summary>
    /// 查找对应的group
    /// </summary>
    /// <param name="id">groupID</param>
    /// <returns>group</returns>
    public static ITGroup Select(int id)
    {
        try
        {
            var db = new oucITEntities();
            var itgroup = (from a in db.ITGroup
                           where a.GroupID == id
                           select a).SingleOrDefault();
            return itgroup;
        }
        catch
        {
            return null;
        }
    }

    /// <summary>
    /// 查找对应的group
    /// </summary>
    /// <param name="name">group名字</param>
    /// <returns>group</returns>
    public static ITGroup Select(string name)
    {
        try
        {
            var db = new oucITEntities();
            var itgroup = (from a in db.ITGroup
                           where a.GroupName == name
                           select a).SingleOrDefault();
            return itgroup;
        }
        catch
        {
            return null;
        }
    }
    public static ITGroup Default()
    {
        var db = new oucITEntities();
        return db.ITGroup.First(e=>e.groupType!=1);
    }

    public static bool Update(int id, string name, string type, string img, string link)
    {
        var db = new oucITEntities();
        var itgroup = (from a in db.ITGroup
                       where a.GroupID == id
                       select a).FirstOrDefault();
        if (itgroup != null)
        {
            itgroup.GroupName = name;
            itgroup.groupType = ChangeType(type);
            itgroup.Img = img;
            itgroup.Link = link;
            db.SaveChanges();
            return true;
        }
        return false;
    }

    private static int ChangeType(string Type)
    {
        int type;
        switch (Type)
        {
            case "组织": type = 1; break;
            case "社团": type = 2; break;
            case "实验室": type = 3; break;
            case " 其他": type = 4; break;
            default: type = 1; break;
        }
        return type;
    }

    public static bool Delete(int id)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.ITGroup
                         where a.GroupID == id
                         select a).SingleOrDefault();
            db.ITGroup.Remove(query);
            db.SaveChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public static List<ITGroup> GetGroupsByType(int type)
    {
        var db = new oucITEntities();
        var query = from g in db.ITGroup
                    where g.groupType == type
                    select g;
        return query.ToList();
    }
    /// <summary>
    /// 获取社团或实验室的主页地址,若无,返回default
    /// </summary>
    /// <param name="id">groupID</param>
    /// <param name="Default">若无,返回的值</param>
    /// <returns></returns>
    public static string GetGroupLink(int id,string Default)
    {
        var db = new oucITEntities();
        return db.ITGroup.First(e => e.GroupID == id).Link ?? Default;
    }
}
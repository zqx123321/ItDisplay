using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// AdminHelper 的摘要说明
/// </summary>
public class AdminHelper
{
	public AdminHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 管理登录
    /// </summary>
    /// <param name="name">用户名</param>
    /// <param name="Pwd">密码</param>
    /// <returns>管理</returns>
    public static Admin Login(string name, string Pwd)
    {
        try
        {
            var db = new oucITEntities();
            Pwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Pwd, "MD5");
            var query = from a in db.Admin
                        where a.Name == name && a.Password == Pwd
                        select a;
            return query.Single();
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    /// <summary>
    /// 添加管理员
    /// </summary>
    /// <param name="name">姓名</param>
    /// <param name="pwd">密码</param>
    /// <returns>是否成功</returns>
    public static bool Add(string name, string pwd)
    {
        try
        {
            var db = new oucITEntities();
            Admin ad = new Admin();
            pwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "MD5");
            ad.Name = name;
            ad.Password = pwd;
            db.Admin.Add(ad);
            db.SaveChanges();
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }

    /// <summary>
    /// 修改密码
    /// </summary>
    /// <param name="name">用户名</param>
    /// <param name="Pwd">密码</param>
    /// <returns>是否成功</returns>
    public static bool UpdatePwd(string name, string Pwd)
    {
        try
        {
            var db = new oucITEntities();
            Pwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Pwd, "MD5");
            var query = from a in db.Admin
                        where a.Name == name
                        select a;
            var u = query.SingleOrDefault();
            if (u != null)
            {
                u.Password = Pwd;
                db.SaveChanges();
                return true;
            }
            return false;

        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public static Admin Select(string name)
    {
        try
        {
            var db = new oucITEntities();
            var query = from a in db.Admin
                        where a.Name == name
                        select a;
            return query.FirstOrDefault();
        }
        catch
        {
            return null;
        }
    }
}
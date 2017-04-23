using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// UserHelper 的摘要说明
/// </summary>
public class UserHelper
{
	public UserHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 登录
    /// </summary>
    /// <param name="number">学号或工号</param>
    /// <param name="Pwd">密码</param>
    /// <returns>用户</returns>
    public static User Login(string number, string Pwd)
    {
        try
        {
            var db = new oucITEntities();
            Pwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Pwd, "MD5");
            var query = from a in db.User
                        where a.Number == number && a.Password == Pwd
                        select a;
            return query.Single();
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    /// <summary>
    /// 更改密码
    /// </summary>
    /// <param name="number">学号或工号</param>
    /// <param name="Pwd">新密码</param>
    /// <returns>是否成功</returns>
    public static bool UpdatePwd(string number, string Pwd)
    {
        try
        {
            var db = new oucITEntities();
            Pwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Pwd, "MD5");
            var query = from a in db.User
                        where a.Number == number
                        select a;
            var u = query.Single();
            u.Password = Pwd;
            db.SaveChanges();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    /// <summary>
    /// 返回用户类型
    /// </summary>
    /// <param name="ID">用户id</param>
    /// <returns>类型</returns>
    public static string RtnType(int id)
    {
        try
        {
            var db = new oucITEntities();
            string type = "";
            var query = from a in db.Teacher
                        where a.UserID == id
                        select a;
            if (query.FirstOrDefault() != null)
            {
                type = "Teacher";
            }
            else
            {
                type = "Student";
            }
            return type;
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    /// <summary>
    /// 返回用户类型
    /// </summary>
    /// <param name="number">学号/工号</param>
    /// <returns>类型</returns>
    public static string RtnType(string number)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.User
                        where a.Number == number
                        select a).SingleOrDefault();
            if (query != null)
            {
                return RtnType(query.UserID);
            }
            else
            {
                return "";
            }
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    /// <summary>
    /// 返回用户姓名
    /// </summary>
    /// <param name="id">用户id</param>
    /// <returns></returns>
    public static string RtnName(int id)
    {
        try
        {
            var db = new oucITEntities();
            string name = "";
            var query = (from a in db.Teacher
                        where a.UserID == id
                        select a).SingleOrDefault();
            if (query != null)
            {
                name = query.Name;
            }
            else
            {
                var query1 = from a in db.Student
                        where a.UserID == id
                        select a;
                name = query1.SingleOrDefault().Name;
            }
            return name;
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    /// <summary>
    /// 返回用户姓名
    /// </summary>
    /// <param name="number">工号/学号</param>
    /// <returns>姓名</returns>
    public static string RtnName(string number)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.User
                         where a.Number == number
                         select a).SingleOrDefault();
            if (query != null)
            {
                return RtnName(query.UserID);
            }
            else
            {
                return "";
            }
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    /// <summary>
    /// 返回是否为超管
    /// </summary>
    /// <param name="id">用户id</param>
    /// <returns>是否为超管</returns>
    public static bool IsSuperUser(int id)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.Connection
                         where a.UserID == id && a.Right == 2
                         select a).FirstOrDefault();
            if (query != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public static User Select(string number)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.User
                         where a.Number == number
                         select a).FirstOrDefault();
            return query;
        }
        catch
        {
            return null;
        }
    }

    public static User Select(int id)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.User
                         where a.UserID == id
                         select a).SingleOrDefault();
            return query;
        }
        catch
        {
            return null;
        }
    }

    public static int Add(string number, string password)
    {
        try
        {
            var db = new oucITEntities();
            var user = new User();
            password = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
            user.Number = number;
            user.Password = password;
            db.User.Add(user);
            db.SaveChanges();
            var u = (from a in db.User
                     where a.Number == number
                     select a).FirstOrDefault();
            return u.UserID;
        }
        catch(Exception ex)
        {
            return 0;
        }
    }

    public static bool Delete(int userID)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.User
                         where a.UserID == userID
                         select a).SingleOrDefault();
            db.User.Remove(query);
            db.SaveChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public static bool Update(int userID, string number)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.User
                         where a.UserID == userID
                         select a).SingleOrDefault();
            query.Number = number;
            db.SaveChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
}
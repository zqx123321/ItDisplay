using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ConnHelp 的摘要说明
/// </summary>
public class ConnHelp
{
	public ConnHelp()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 添加Connection
    /// </summary>
    /// <param name="groupID">组的ID</param>
    /// <param name="userID">用户ID</param>
    /// <param name="Class">首页显示等级</param>
    /// <param name="right">权利</param>
    /// <param name="job">职务</param>
    /// <param name="duty">职责</param>
    /// <param name="phone">电话</param>
    /// <param name="email">Email</param>
    /// <returns>是否成功</returns>
    public static bool Add(int groupID, int userID, string Class, int right, string job, string duty, string phone, string email)
    {
        try
        {
            var db = new oucITEntities();
            var conn = new Connection();
            conn.GroupID = groupID;
            conn.UserID = userID;
            conn.Class = Convert.ToInt32(Class);
            conn.Right = right;
            conn.Job = job;
            conn.Duty = duty;
            conn.Phone = phone;
            conn.Email = email;
            db.Connection.Add(conn);
            db.SaveChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public static bool Add(int groupID, int userID, string Class, string job)
    {
        try
        {
            var db = new oucITEntities();
            var conn = new Connection();
            conn.GroupID = groupID;
            conn.UserID = userID;
            conn.Class = Convert.ToInt32(Class);
            conn.Right = 1;
            conn.Job = job;
            db.Connection.Add(conn);
            db.SaveChanges();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public static bool Update(int groupID, int userID, string Class, string job, string duty, string phone, string email)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.Connection
                         where a.GroupID == groupID && a.Right == 2
                         select a).SingleOrDefault();
            query.UserID = userID;
            query.Class = Convert.ToInt32(Class);
            query.Job = job;
            query.Duty = duty;
            query.Phone = phone;
            query.Email = email;
            db.SaveChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public static bool Update(int groupID, int userID, string job, string duty, string phone, string email)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.Connection
                         where a.GroupID == groupID && a.Right == 2
                         select a).SingleOrDefault();
            query.UserID = userID;
            query.Job = job;
            query.Duty = duty;
            query.Phone = phone;
            query.Email = email;
            db.SaveChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public static bool MessUpdate(int groupID, int userID, string job, string duty, string phone, string email)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.Connection
                         where a.GroupID == groupID && a.UserID == userID
                         select a).SingleOrDefault();
            query.UserID = userID;
            query.Job = job;
            query.Duty = duty;
            query.Phone = phone;
            query.Email = email;
            db.SaveChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public static bool Delete(int groupID)
    {
        try
        {
            var db = new oucITEntities();
            var query = from a in db.Connection
                        where a.GroupID == groupID
                        select a;
            foreach (var i in query)
            {
                db.Connection.Remove(i);
            }
            db.SaveChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public static bool Delete(string job,int groupID)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.Connection
                         where a.Job == job && a.GroupID == groupID
                         select a).FirstOrDefault();
            if (query != null)
            {
                db.Connection.Remove(query);
                db.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }

    public static bool Delete(int groupID, int userID)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.Connection
                         where a.GroupID == groupID && a.UserID == userID
                         select a).FirstOrDefault();
            db.Connection.Remove(query);
            db.SaveChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
}


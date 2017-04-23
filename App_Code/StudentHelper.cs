using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// StudentHelper 的摘要说明
/// </summary>
public class StudentHelper
{
	public StudentHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public static Student Select(int userID)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.Student
                         where a.UserID == userID
                         select a).SingleOrDefault();
            return query;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
}
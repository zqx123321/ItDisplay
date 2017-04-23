using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// LogHelper 的摘要说明
/// </summary>
public static class LogHelper
{
    private static oucITEntities db = new oucITEntities();
    public static bool delete(int id)
    {
        try
        {
            var query = from m in db.Log
                        where m.LogID == id
                        select m;
            db.Log.Remove(query.First());
            db.SaveChanges();
            return true;
        }
        catch { return false; }
    }
    public static bool deleteAll()
    {
        try
        {
            foreach (Log lo in db.Log)
                db.Log.Remove(lo);
            db.SaveChanges();
            return true;
        }
        catch { return false; }
    }
}
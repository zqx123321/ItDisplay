using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// CHelper 的摘要说明
/// </summary>
public static class CHelper
{
    static private CountOucEntities db = new CountOucEntities();

    static public void Cread(int aid, string name, string cate)
    {
        var nlist = new Count();
        nlist.AID = aid;
        nlist.date = DateTime.Now;
        nlist.name = name;
        nlist.number = 0;
        nlist.cate = cate;
        db.Count.Add(nlist);
        db.SaveChanges();
    }

    static public bool IsExit(int id)
    {
        var count = db.Count.SingleOrDefault(a => a.AID == id);
        return count == null ? false : true;
    }

    static public bool Add(int aid)
    {
        string ip = HttpContext.Current.Request.UserHostAddress;
        var record = db.Record.FirstOrDefault(a => a.AID == aid && a.IP.Equals(ip));
        var sum = db.Count.FirstOrDefault(a => a.AID == aid);
        if (record == null)
        {
            sum.number++;
            record = new Record();
            record.IP = ip;
            record.AID = aid;
            db.Record.Add(record);

            db.SaveChanges();
            return true;
        }
        else return false;
    }

    static public List<Count> Get(string cate = "全部")
    {
        if (cate.Equals("全部"))
        {
            var counts = from u in db.Count
                         orderby u.date descending
                         select u;
            return counts.ToList();
        }
        else
        {
            var counts = from u in db.Count
                         where u.cate.Equals(cate)
                         orderby u.date descending
                         select u;
            return counts.ToList();
        }
    }


}
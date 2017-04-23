using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// CourseHelper 的摘要说明
/// </summary>
public static  class CourseHelper
{
   // private static oucITEntities db = new oucITEntities();
    public static List<Course> GetCoursesOfTheMajor(string major, oucITEntities db)
    {
        var query = from course in db.Course
                    where course.Major == major
                    select course;
        return query.ToList();
    }
    public static Course GetCourseById(int id, oucITEntities db)
    {
        try
        {
            return db.Course.First(e => e.CourseID == id);
        }
        catch { return null; }
    }
    public static bool AddCourse(Course co, oucITEntities db)
    {
       // try
      //  {
            db.Course.Add(co);
            db.SaveChanges();
            return true;
      //  }
     //   catch { return false; }

    }
    public static bool Delete(int id, oucITEntities db)
    {
        try
        {
            var query = from m in db.Course
                        where m.CourseID == id
                        select m;
            db.Course.Remove(query.First());
            db.SaveChanges();
            return true;
        }
        catch { return false; }
    }
    public static bool ChangeCourse(Course co, oucITEntities db)
    {
        try
        {
            Course c = db.Course.First(e => e.CourseID == co.CourseID);
            db.Entry(c).CurrentValues.SetValues(co);
            // Course c = db.Course.First(e => e.CourseID == co.CourseID);
            //c = co;
            // db.Entry(c).State = EntityState.Modified;
            //  db.Course.First(e => e.CourseID == co.CourseID) = co;
            //db.Course.Attach(co);
            //db.ApplyCurrentValues<Course>("Course", co);
            db.SaveChanges();
            return true;
        }
        catch { return false; }

    }
}
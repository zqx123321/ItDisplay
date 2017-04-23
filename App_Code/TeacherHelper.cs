using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;

/// <summary>
/// TeacherHelper 的摘要说明
/// </summary>
public class TeacherHelper
{
	public TeacherHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public static bool Add(int userID, string name, string Department)
    {
        try
        {
            var db = new oucITEntities();
            Teacher teac = new Teacher();
            teac.UserID = userID;
            teac.Name = name;
            teac.Department = Department;
            db.Teacher.Add(teac);
            db.SaveChanges();
            return true;
        }
        catch (DbEntityValidationException dbEx)
        {
            return false;
        }
    }

    public static bool Delete(int userID)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.Teacher
                         where a.UserID == userID
                         select a).SingleOrDefault();
            db.Teacher.Remove(query);
            db.SaveChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public static Teacher Select(int userID)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.Teacher
                         where a.UserID == userID
                         select a).FirstOrDefault();
            return query;
        }
        catch
        {
            return null;
        }
    }

    public static bool Update(int userID, string name, string department)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.Teacher
                         where a.UserID == userID
                         select a).SingleOrDefault();
            query.Name = name;
            query.Department = department;
            db.SaveChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public static string ChangeJobTitle(int num)
    {
        string JobTitle = "";
        switch (num)
        {
            case 1: JobTitle = "教授"; break;
            case 2: JobTitle = "副教授"; break;
            case 3: JobTitle = "高级工程师"; break;
            case 4: JobTitle = "高级实验师"; break;
            case 5: JobTitle = "讲师"; break;
            case 6: JobTitle = "助理工程师"; break;
            case 7: JobTitle = "助理实验师"; break;
            default: break;
        }
        return JobTitle;
    }

    public static int ChangeJobTitle(string jobtitle)
    {
        int num = 0;
        switch(jobtitle)
        {
            case "教授": num = 1; break;
            case "副教授": num = 2; break;
            case "高级工程师": num = 3; break;
            case "高级实验师": num = 4; break;
            case "讲师": num = 5; break;
            case "助理工程师": num = 6; break;
            case "助理实验师": num = 7; break;
            default: break;
        }
        return num;
    }

    public static string ChangeJob(int num)
    {
        string Job = "";
        switch (num)
        {
            case 1: Job = "院长"; break;
            case 2: Job = "副院长"; break;
            case 3: Job = "系主任"; break;
            case 4: Job = "系副主任"; break;
            case 5: Job = "其他"; break;
            default: break;
        }
        return Job;
    }

    public static int ChangeJob(string Job)
    {
        int num = 0;
        switch (Job)
        {
            case "院长": num = 1; break;
            case "副院长": num = 2; break;
            case "系主任": num = 3; break;
            case "系副主任": num = 4; break;
            case "其他": num = 5; break;
            default: break;
        }
        return num;
    }

    public static string ChangeTutor(int num)
    {
        string Tutor = "";
        switch (num)
        {
            case 1: Tutor = "博士生导师"; break;
            case 2: Tutor = "硕士生导师"; break;
            case 3: Tutor = "其他"; break;
            default: break;
        }
        return Tutor;
    }

    public static int ChangeTutor(string Tutor)
    {
        int num = 0;
        switch (Tutor)
        {
            case "博士生导师": num = 1; break;
            case "硕士生导师": num = 2; break;
            case "其他": num = 3; break;
            default: break;
        }
        return num;
    }

    public static bool Update(int userid,string url, string name, DateTime birthday, string status, string education, string mobile, string office, string email, string work, string address, int jobTitle, int job, int tutor, string department, string course, string experience, string direction, string project, string achievements, string paper, string enrolment, string remark)
    {
        try
        {
            var db = new oucITEntities();
            var query = (from a in db.Teacher
                         where a.UserID == userid
                         select a).FirstOrDefault();
            query.ImgUrl = url;
            query.Name = name;
            query.Birthday = birthday;
            query.PoliticsStatus = status;
            query.Education = education;
            query.MobilePhone = mobile;
            query.OfficePhone = office;
            query.Email = email;
            query.WorkPlace = work;
            query.Address = address;
            if (jobTitle != 0)
            {
                query.JobTitle = jobTitle;
            }
            else
            {
                query.JobTitle = 0;
            }
            if (job != 0)
            {
                query.Job = job;
            }
            else
            {
                query.Job = 0;
            }
            query.Tutor = tutor;
            query.Department = department;
            query.Course = course;
            query.Experience = experience;
            query.ResearchDirection = direction;
            query.ResearchProject = project;
            query.Achievements = achievements;
            query.Paper = paper;
            query.Enrolment = enrolment;
            query.Remark = remark;
            db.SaveChanges();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
}
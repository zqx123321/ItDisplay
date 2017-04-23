using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Teacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] == "")
            {
                Response.Redirect("Index.aspx");
            }
            else
            {
                int id = 0;
                try
                {
                    id = Convert.ToInt32(Request.QueryString["id"]);
                }
                catch (Exception ex)
                {
                    Response.Redirect("Index.aspx");
                }
                var query = TeacherHelper.Select(id);
                if (query == null)
                {
                    Response.Redirect("Index.aspx");
                }
                else
                {
                    lblName.Text = query.Name;
                    Image1.ImageUrl = (query.ImgUrl == "" || query.ImgUrl == null) ? "images/blogo.png" : query.ImgUrl;
                    //lblNum.Text = query.User.Number;
                    //lblBirth.Text = query.Birthday.ToShortDateString();
                    lblStatus.Text = query.PoliticsStatus;
                    lblEducation.Text = query.Education;
                    //lblMobile.Text = query.MobilePhone;
                    lblOffice.Text = query.OfficePhone;
                    lblEmai.Text = query.Email;
                    lblWork.Text = query.WorkPlace;
                    lblDepartment.Text = query.Department;
                    //lblAddress.Text = query.Address;
                    if (query.Department == "行政人员")
                    {
                        Panel1.Visible = false;
                    }
                    else
                    {
                        //lblJobTitle.Text = TeacherHelper.ChangeJobTitle(query.JobTitle);
                        //lblJob.Text = TeacherHelper.ChangeJob(query.Job);
                        //lblTutor.Text = TeacherHelper.ChangeTutor(query.Tutor);
                        lblCourse.Text = query.Course;
                    }
                    Experience.Text = query.Experience;
                    Direction.Text = query.ResearchDirection;
                    Project.Text = query.ResearchProject;
                    Achievements.Text = query.Achievements;
                    Paper.Text = query.Paper;
                    Enrolment.Text = query.Enrolment;
                    Remark.Text = query.Remark;
                    if (Experience.Text == "")
                    {
                        lblExperience.Visible = false;
                    }
                    if (Direction.Text == "")
                    {
                        lblDirection.Visible = false;
                    }
                    if (Project.Text == "")
                    {
                        lblProject.Visible = false;
                    }
                    if (Achievements.Text == "")
                    {
                        lblAchievements.Visible = false;
                    }
                    if (Paper.Text == "")
                    {
                        lblPaper.Visible = false;
                    }
                    if (Enrolment.Text == "")
                    {
                        lblEnrolment.Visible = false;
                    }
                    if (Remark.Text == "")
                    {
                        lblRemark.Visible = false;
                    }
                }
            }
        }
    }
}
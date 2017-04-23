<%@ Page Title="" Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="Teacher.aspx.cs" Inherits="Display_Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <body class="teacher">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="container">
        <h1>
            <asp:label id="lblName" runat="server" text="Label"></asp:label>
        </h1>
        <div class="content-con">
            <h2>基本信息</h2>
            <div class="teacher-pic">
                <asp:image id="Image1" runat="server" alt="老师名字" title="老师名字" />
            </div>
            <div class="teacher-info">
                <%--p>
                    <span class="title">工号：</span>
                    <asp:label id="lblNum" runat="server" text="Label"></asp:label>
                </p>
                <p>
                    <span class="title">出生日期：</span>
                    <asp:label id="lblBirth" runat="server" text="Label"></asp:label>
                </p--%>
				<p>
                    <span class="title">所在系（中心）：</span>
                    <asp:label id="lblDepartment" runat="server" text="Label"></asp:label>
                </p>
                <p>
                    <span class="title">政治面貌：</span>
                    <asp:label id="lblStatus" runat="server" text="Label"></asp:label>
                </p>
                <p>
                    <span class="title">学历：</span>
                    <asp:label id="lblEducation" runat="server" text="Label"></asp:label>
                </p>
                <%--p>
                    <span class="title">移动电话：</span>
                    <asp:label id="lblMobile" runat="server" text="Label"></asp:label>
                </p--%>
                <p>
                    <span class="title">办公电话：</span>
                    <asp:label id="lblOffice" runat="server" text="Label"></asp:label>
                </p>
                <p>
                    <span class="title">邮件地址：</span>
                    <asp:label id="lblEmai" runat="server" text="Label"></asp:label>
                </p>
                <p>
                    <span class="title">办公室：</span>
                    <asp:label id="lblWork" runat="server" text="Label"></asp:label>
                </p>
                <%--p>
                    <span class="title">通信地址：</span>
                    <asp:label id="lblAddress" runat="server" text="Label"></asp:label>
                </p--%>
                <asp:panel id="Panel1" runat="server">
                <p>
                    <span class="title">职称：</span>
                    <asp:label id="lblJobTitle" runat="server" text="Label"></asp:label>
                </p>
                <p>
                    <span class="title">职务：</span>
                    <asp:label id="lblJob" runat="server" text="Label"></asp:label>
                </p>
                <p>
                    <span class="title">导师：</span>
                    <asp:label id="lblTutor" runat="server" text="Label"></asp:label>
                </p>
                <p>
                    <span class="title">教授课程：</span>
                    <asp:label id="lblCourse" runat="server" text="Label"></asp:label>
                </p>
                    </asp:panel>
            </div>
        </div>
        <div class="content-con">
            <h2>
                <asp:Label ID="lblExperience" runat="Server" Text="教育及工作经历"></asp:Label>
            </h2>
            <asp:Literal ID="Experience" runat="server"></asp:Literal>
        </div>
        <div class="content-con">
            <h2>
                <asp:Label ID="lblDirection" runat="Server" Text="研究方向"></asp:Label>
            </h2>
            <asp:Literal ID="Direction" runat="server"></asp:Literal>
        </div>
        <div class="content-con">
            <h2>
                <asp:Label ID="lblProject" runat="Server" Text="科研项目"></asp:Label>
            </h2>
            <asp:Literal ID="Project" runat="server"></asp:Literal>
        </div>
        <div class="content-con">
            <h2>
                <asp:Label ID="lblAchievements" runat="Server" Text="学术成果"></asp:Label>
            </h2>
            <asp:Literal ID="Achievements" runat="server"></asp:Literal>
        </div>
        <div class="content-con">
            <h2>
                <asp:Label ID="lblPaper" runat="Server" Text="论文专利"></asp:Label>
            </h2>
            <asp:Literal ID="Paper" runat="server"></asp:Literal>
        </div>
        <div class="content-con">
            <h2>
                <asp:Label ID="lblEnrolment" runat="Server" Text="研究生招生条件"></asp:Label>
            </h2>
            <asp:Literal ID="Enrolment" runat="server"></asp:Literal>
        </div>
        <div class="content-con">
            <h2>
                <asp:Label ID="lblRemark" runat="Server" Text="备注"></asp:Label>
            </h2>
            <asp:Literal ID="Remark" runat="server"></asp:Literal>
        </div>
    </section>
</asp:Content>


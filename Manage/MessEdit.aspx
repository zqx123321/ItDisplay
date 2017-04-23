<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="MessEdit.aspx.cs" Inherits="Manage_MessEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" charset="utf-8" src="ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>教师信息更改：</h3>
    <label>照片：</label>
    <asp:Image ID="Image1" runat="server" />
	<br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="btnUpload" runat="server" Text="上传" OnClick="btnUpload_Click" />
    <label>姓名：</label>
	<br />
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valrName" runat="server" ErrorMessage="该项不能为空" ControlToValidate="txtName"></asp:RequiredFieldValidator>
    <div class="man-time">
    <label>生日：</label>
    <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>年
    <asp:TextBox ID="txtMonth" runat="server"></asp:TextBox>月
    <asp:TextBox ID="txtDay" runat="server"></asp:TextBox>日
    </div>
    <label>政治面貌：</label>
    <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valrStatus" runat="server" ErrorMessage="该项不能为空" ControlToValidate="txtStatus"></asp:RequiredFieldValidator>
    <br />
    <label>学历：</label>
    <asp:TextBox ID="txtEducation" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valrEducation" runat="server" ErrorMessage="该项不能为空" ControlToValidate="txtEducation"></asp:RequiredFieldValidator>
    <br />
    <label>移动电话：</label>
    <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valrMobile" runat="server" ErrorMessage="该项不能为空" ControlToValidate="txtMobile"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="checkMobile" runat="server" ErrorMessage="移动电话不合法" ControlToValidate="txtMobile" ValidationExpression="^1[0-9]{10}$"></asp:RegularExpressionValidator>
    <br />
    <label>办公电话：</label>
    <asp:TextBox ID="txtOffice" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valrOffice" runat="server" ErrorMessage="该项不能为空" ControlToValidate="txtOffice"></asp:RequiredFieldValidator>
    <br />
    <label>Email：</label>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valrEmail" runat="server" ErrorMessage="该项不能为空" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="checkEmail" runat="server" ErrorMessage="email不合法" ControlToValidate="txtEmail" ValidationExpression="^[0-9a-zA-Z]+@[0-9a-zA-Z]+[\.]{1}[0-9a-zA-Z]+[\.]?[0-9a-zA-Z]+$"></asp:RegularExpressionValidator>
    <br />
    <label>办公室：</label>
    <asp:TextBox ID="txtWork" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valrWork" runat="server" ErrorMessage="该项不能为空" ControlToValidate="txtWork"></asp:RequiredFieldValidator>
    <br />
    <label>通信地址：</label>
    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valrAddress" runat="server" ErrorMessage="该项不能为空" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
    <br />
    <label>职称：</label>
    <asp:DropDownList ID="ddlJobTitle" runat="server">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>教授</asp:ListItem>
        <asp:ListItem>副教授</asp:ListItem>
        <asp:ListItem>高级工程师</asp:ListItem>
        <asp:ListItem>高级实验师</asp:ListItem>
        <asp:ListItem>讲师</asp:ListItem>
        <asp:ListItem>助理工程师</asp:ListItem>
        <asp:ListItem Value="助理实验师">助理实验师</asp:ListItem>
    </asp:DropDownList>
    <br />
    <label>职务：</label>
    <asp:DropDownList ID="ddlJob" runat="server">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>院长</asp:ListItem>
        <asp:ListItem>副院长</asp:ListItem>
        <asp:ListItem>系主任</asp:ListItem>
        <asp:ListItem>系副主任</asp:ListItem>
        <asp:ListItem>其他</asp:ListItem>
    </asp:DropDownList>
    <br />
    <label>导师：</label>
    <asp:DropDownList ID="ddlTutor" runat="server">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>博士生导师</asp:ListItem>
        <asp:ListItem>硕士生导师</asp:ListItem>
        <asp:ListItem>其他</asp:ListItem>
    </asp:DropDownList>
    <br />
    <label>单位：</label>
    <asp:DropDownList ID="ddlDepartment" runat="server">
        <asp:ListItem>物理系</asp:ListItem>
        <asp:ListItem>电子工程系</asp:ListItem>
        <asp:ListItem>计算机科学与技术系</asp:ListItem>
        <asp:ListItem>海洋技术系</asp:ListItem>
		<asp:ListItem>信息工程中心</asp:ListItem>
        <asp:ListItem>行政人员</asp:ListItem>
    </asp:DropDownList>
    <br />
    <label>教授课程：</label>
    <br />
    <asp:TextBox ID="txtCourse" runat="server"></asp:TextBox>
    <br />
    <label>教育及工作经历</label>
    <br />
    <asp:TextBox ID="txtExperience" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <label>研究方向</label>
    <br />
    <asp:TextBox ID="txtResearchDirection" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <label>科研项目</label>
    <br />
    <asp:TextBox ID="txtResearchProject" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <label>学术成果</label>
    <br />
    <asp:TextBox ID="txtAchievements" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <label>论文专利</label>
    <br />
    <asp:TextBox ID="txtPaper" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <label>研究生招生条件</label>
    <br />
    <asp:TextBox ID="txtEnrolment" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <label>备注</label>
    <br />
    <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Button ID="btnEdit" runat="server" Text="保存修改" OnClick="btnEdit_Click" />
</asp:Content>


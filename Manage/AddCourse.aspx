<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="Manage_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
	ul {
		margin: 1em 0;
		padding: 0;
		list-style: none;
	}
	li {
		display: block;
	}
	.red {
		color: red;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
    window.onload = function () {
        var courseTypeSelect = document.getElementById("ContentPlaceHolder1_courseType");
        var allChangeInput = document.getElementsByTagName("li");
        courseTypeSelect.onchange = function () {
            for (var i = 0; i < allChangeInput.length; i++) {
                if (allChangeInput[i].style.display == "none") {
                    allChangeInput[i].style.display = "block";
                }
                if ((courseTypeSelect.selectedIndex == 0) && (allChangeInput[i].className.indexOf("a") > -1)) {
                    allChangeInput[i].style.display = "none";
                }
                if ((courseTypeSelect.selectedIndex == 1) && (allChangeInput[i].className.indexOf("b") > -1)) {
                    allChangeInput[i].style.display = "none";
                }
                if ((courseTypeSelect.selectedIndex == 2) && (allChangeInput[i].className.indexOf("c") > -1)) {
                    allChangeInput[i].style.display = "none";
                }
            }
        }
    }
</script>
    <title>添加课程</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<ul>
		<li>课程名称:
			<asp:TextBox ID="courseName" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="courseName" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
		</li>
		<li>开课院系:
			<asp:DropDownList ID="department" runat="server">
				<asp:ListItem>物理系</asp:ListItem>
				<asp:ListItem>电子工程系</asp:ListItem>
				<asp:ListItem>计算机科学与技术系</asp:ListItem>
				<asp:ListItem>海洋技术系</asp:ListItem>
			</asp:DropDownList>
		</li>
		<li>所属专业:
			<asp:DropDownList ID="major" runat="server">
				<asp:ListItem>物理学</asp:ListItem>
				<asp:ListItem>光信息科学与技术</asp:ListItem>
				<asp:ListItem>电子信息科学与技术</asp:ListItem>
				<asp:ListItem>电子信息工程</asp:ListItem>
				<asp:ListItem>通信工程</asp:ListItem>
				<asp:ListItem>计算机科学与技术</asp:ListItem>
				<asp:ListItem>海洋技术</asp:ListItem>
			</asp:DropDownList>
		</li>
		<li>课程类型:
			<asp:DropDownList ID="courseType" runat="server">
				<asp:ListItem Value="1">无实验理论课或纯试验课程</asp:ListItem>
				<asp:ListItem Value="2">含实验理论课</asp:ListItem>
				<asp:ListItem Value="3">课程设计(或以周为教学单位的试验课)</asp:ListItem>
			</asp:DropDownList>
		</li>
		<li>课程编号:
			<asp:TextBox ID="CoNumber" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" ControlToValidate="CoNumber" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
		</li>
		<li>课程英文名称:
			<asp:TextBox ID="EnglishName" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="不能为空" ControlToValidate="EnglishName" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
		</li>
		<li>课程总学时（请输入数字）:
			<asp:TextBox ID="TotalHours" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TotalHours" ErrorMessage="不能为空" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
		</li>
		<li>课程总学分（请输入数字）:
			<asp:TextBox ID="TotalMark" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TotalMark" ErrorMessage="不能为空" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
		</li>
		<li class="a b" style="display:none;">周学时（实验课）（请输入数字）:
			<asp:TextBox ID="WeekHours" runat="server"></asp:TextBox>
		</li>
		<li class="a b" style="display:none;">学期安排（实验课）:
			<asp:TextBox ID="TermArrange" runat="server"></asp:TextBox>
		</li>
		<li  class="c">含实验或实践学时（请输入数字）:
			<asp:TextBox ID="ExperimentHours" runat="server"></asp:TextBox>
		</li>
		<li class="c">含实验或实践学分（请输入数字）:
			<asp:TextBox ID="ExperimentMark" runat="server"></asp:TextBox>
		</li>
		<li>推荐使用教材:
			<asp:TextBox ID="Textbook" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Textbook" ErrorMessage="不能为空" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
		</li>
		<li>推荐使用教材编者:
			<asp:TextBox ID="TextbookAuthor" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextbookAuthor" ErrorMessage="不能为空" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
		</li>
		<li>推荐使用教材出版社:
			<asp:TextBox ID="TextbookPublisher" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextbookPublisher" ErrorMessage="不能为空" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
		</li>
		<li>推荐使用教材出版时间及版次:
			<asp:TextBox ID="TextbookVersion" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextbookVersion" ErrorMessage="不能为空" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
		</li>
		<li class="a c" style="display:none;">实验指导书（含实验理论课）:
			<asp:TextBox ID="ExperimentGuideBook" runat="server"></asp:TextBox>
		</li>
		<li class="a" style="display:none;">实验、实习场所（实验课、含实验理论课）:
			<asp:TextBox ID="ExperimentPlace" runat="server"></asp:TextBox>
		</li>
		<li>课程教学目标与基本要求:
			<asp:TextBox ID="CourseObject" runat="server" Rows="4" TextMode="MultiLine" Width="505px"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="CourseObject" ErrorMessage="不能为空" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
		</li>
		<li class="a c" style="display:none;">实验环节教学目标与基本要求（含实验理论课）：
			<asp:TextBox ID="ExperimentPartObject" runat="server" Height="59px" Style="margin-left: 3px" TextMode="MultiLine" Width="335px"></asp:TextBox>
		</li>
		<li>考试形式:
			<asp:TextBox ID="ExamType" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ExamType" ErrorMessage="不能为空" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
		</li>
		<li class="a b" style="display:none;">实验教学目标（实验课）：
			<asp:TextBox ID="ExperimentObject" runat="server" Height="48px" Width="499px" TextMode="MultiLine"></asp:TextBox>
		</li>
		<li>学习参考书：
			<asp:TextBox ID="reference" runat="server" TextMode="MultiLine"></asp:TextBox>
		</li>
		<li><span class="red">上传更多信息:</span>
			<asp:FileUpload ID="FileUpload1" runat="server" />（支持格式：".doc",".docx",".xls"）
			<asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
			<asp:Button ID="Button2" runat="server" Text="上传" CausesValidation="False" OnClick="Button2_Click" />
			<asp:HiddenField ID="HiddenField1" runat="server" />
		</li>
	</ul>
	<asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" ValidationGroup="1" />&nbsp;&nbsp;
	<asp:Button ID="Button3" runat="server" CausesValidation="False" OnClick="Button3_Click" Text="返回"  />
	<br/><br/>
    <a href="coursehelp.html" target="_blank" style="color:red "><strong>点我查阅帮助文档</strong></a>
</asp:Content>

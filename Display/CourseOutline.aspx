<%@ Page Title="" Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="CourseOutline.aspx.cs" Inherits="Display_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
	<title>课程介绍</title>
	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <header>
		<h1>课程介绍</h1>
		<nav class="nav">
			<ul>
				<li><a href="CourseOutline.aspx">人才培养方案</a></li>
                <li><a href="Coursewuli.aspx">物理系</a></li>
                <li><a href="Coursedianzi.aspx">电子工程系</a></li>
                <li><a href="Coursejisuanji.aspx">计算机科学与技术系</a></li>
                <li><a href="Coursehaiji.aspx">海洋技术系</a></li>
			</ul>
		</nav>
	</header>
	<section class="department">
		<!-- 一个section为一个系 -->
		<h2>人才培养方案</h2>
		<nav>
			<ul class="department-nav">
				<li class="active">物理系</li>
				<li>电子工程系</li>
				<li>计算机科学与技术系</li>
                <li>海洋技术系</li>
			</ul>
		</nav>
		<div class="specialty active">
			<!-- 一个div为一个专业的课程 -->
			<ul>
				<li class="course">
					<h3>物理学</h3>
					<div class="course-con">
						<!-- 这里是课程的详细内容 -->
						<a href='../Uploads/outlines/<%:GetFileName("wuli") %>' target="_blank">点击下载</a>
					</div>
				</li>
				<li class="course">
					<h3>光信息科学与技术</h3>
					<div class="course-con">
						<!-- 这里是课程的详细内容 -->
						<a href='../Uploads/outlines/<%:GetFileName("guangke") %>'  target="_blank">点击下载</a>
					</div>
				</li>
			</ul>
		</div>
		<div class="specialty">
			<!-- 一个div为一个专业的课程 -->
			<ul>
				
                <li class="course">
					<h3>电子信息科学与技术</h3>
					<div class="course-con">
						<!-- 这里是课程的详细内容 -->
						<a href='../Uploads/outlines/<%:GetFileName("dianke") %>' target="_blank">点击下载</a>
					</div>
				</li>
                <li class="course">
					<h3>通信工程</h3>
					<div class="course-con">
						<!-- 这里是课程的详细内容 -->
						<a href='../Uploads/outlines/<%:GetFileName("tongxin") %>' target="_blank">点击下载</a>
					</div>
				</li>
				<li class="course">
					<h3>电子信息工程</h3>
					<div class="course-con">
						<!-- 这里是课程的详细内容 -->
						<a href='../Uploads/outlines/<%:GetFileName("diangong") %>' target="_blank">点击下载</a>
					</div>
				</li>
                 <li class="course">
					<h3>电子信息工程-中法卓越班</h3>
					<div class="course-con">
						<!-- 这里是课程的详细内容 -->
						<a href='../Uploads/outlines/<%:GetFileName("zhongfa") %>' target="_blank">点击下载</a>
					</div>
				</li>
				
			</ul>
		</div>
		<div class="specialty">
			<!-- 一个div为一个专业的课程 -->
			<ul>
				<li class="course">
					<h3>计算机科学与技术</h3>
					<div class="course-con">
						<!-- 这里是课程的详细内容 -->
						<a href='../Uploads/outlines/<%:GetFileName("jisuanji") %>' target="_blank">点击下载</a>
					</div>
				</li>
			</ul>
		</div>
        <div class="specialty">
			<!-- 一个div为一个专业的课程 -->
			<ul>
				<li class="course">
					<h3>海洋技术</h3>
					<div class="course-con">
						<!-- 这里是课程的详细内容 -->
						<a href='../Uploads/outlines/<%:GetFileName("haiji") %>' target="_blank">点击下载</a>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="js/script.js" type="text/javascript"></script>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="TeachPlan.aspx.cs" Inherits="Display_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>信息科学与工程学院</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
      <body class="course">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
		<aside class="page-nav" id="aside">
			<h1>课程介绍</h1>
			<hr />
			<ul>
				 <li><a href="#">培养计划</a></li>
                <li><a href="Course.aspx?depart=物理系">物理系</a></li>
                <li><a href="Course.aspx?depart=电子工程系">电子工程系</a></li>
                <li><a href="Course.aspx?depart=计算机科学与技术系">计算机科学与技术系</a></li>
                <li><a href="Course.aspx?depart=海洋技术系">海洋技术系</a></li>
			</ul>
		</aside>
		<section class="container right">
			<h1>培养计划</h1>
			<hr />
			<div class="tag-wrapper">
				<div class="tag">
					<nav>
						<ul class="tag-nav">
							<li class="active">物理系</li>
				<li>电子工程系</li>
				<li>计算机科学与技术系</li>
                <li>海洋技术系</li>
						</ul>
					</nav>
					<div class="tag-con active">
						<ul class="flod-list">
							<li >
					<h2>物理学</h2>
					<div class="flod-list-con">
						<!-- 这里是课程的详细内容 -->
                        <div class="txt-line">
										
									
						<a href='../Uploads/outlines/<%:GetFileName("wuli") %>' target="_blank">点击下载</a></div>
					</div>
				</li>
				<li >
					<h2>光信息科学与技术</h2>
					<div class="flod-list-con">
						<!-- 这里是课程的详细内容 --> <div class="txt-line">
						<a href='../Uploads/outlines/<%:GetFileName("guangke") %>'  target="_blank">点击下载</a></div>
					</div>
				</li>
						</ul>
					</div>
					<div class="tag-con">
						<ul class="flod-list">
							<li class="course">
					<h2>电子信息科学与技术</h2>
					<div class="flod-list-con">
						<!-- 这里是课程的详细内容 --> <div class="txt-line">
						<a href='../Uploads/outlines/<%:GetFileName("dianke") %>' target="_blank">点击下载</a></div>
					</div>
				</li>
                <li>
					<h2>通信工程</h2>
					<div class="flod-list-con">
						<!-- 这里是课程的详细内容 --> <div class="txt-line">
						<a href='../Uploads/outlines/<%:GetFileName("tongxin") %>' target="_blank">点击下载</a></div>
					</div>
				</li>
				<li >
					<h2>电子信息工程</h2>
					<div class="flod-list-con">
						<!-- 这里是课程的详细内容 --> <div class="txt-line">
						<a href='../Uploads/outlines/<%:GetFileName("diangong") %>' target="_blank">点击下载</a></div>
					</div>
				</li>
                 <li >
					<h2>电子信息工程-中法卓越班</h2>
					<div class="flod-list-con">
						<!-- 这里是课程的详细内容 --> <div class="txt-line">
						<a href='../Uploads/outlines/<%:GetFileName("zhongfa") %>' target="_blank">点击下载</a></div>
					</div>
				</li>
						</ul>
					</div>
                    <div class="tag-con">
						<ul class="flod-list">
							<li >
					<h2>计算机科学与技术</h2>
					<div class="flod-list-con">
						<!-- 这里是课程的详细内容 --> <div class="txt-line">
						<a href='../Uploads/outlines/<%:GetFileName("jisuanji") %>' target="_blank">点击下载</a></div>
					</div>
				</li>
						</ul>
					</div>
                    <div class="tag-con">
						<ul class="flod-list">
							<li >
					<h2>海洋技术</h2>
					<div class="flod-list-con">
						<!-- 这里是课程的详细内容 --> <div class="txt-line">
						<a href='../Uploads/outlines/<%:GetFileName("haiji") %>' target="_blank">点击下载</a></div>
					</div>
				</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<div class="clear"></div>
	</div>
</asp:Content>


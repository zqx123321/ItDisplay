<%@ Page Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Display_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>信息科学与工程学院</title>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server">
<body class="index">
	<div class="loading-bg" id="load-bg">
		<section class="loading" id="load">
			<h1>中国海洋大学</h1>
			<h2>信息科学与工程学院</h2>
			<div class="loader">
				<img src="images/loader.gif" alt="请稍后" />
			</div>
		</section>
	</div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="focus-warp">
		<div class="container focus" id="focus">
           <!-- <asp:Repeater ID="dynamicImg" runat="server" ItemType="Article">
                <HeaderTemplate><ul></HeaderTemplate>
                <ItemTemplate>
                    <li><a href="Content.aspx?id=<%#Item.ArticleID %>" title=""><img src='<%#Item.ImgUrl %>' alt=""/></a><h2><%#Item.Title %></h2></li>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </asp:Repeater>-->
			<%--<ul>
				<li><a href="#" title=""><img src="images/banner1.jpg" alt=""/></a></li>
				<li><a href="#" title=""><img src="images/banner2.jpg" alt=""/></a></li>
			</ul>--%>
                <ul>
                    <li><img src="images/it-banner1.jpg"/></li>
                    <li><img src="images/it-banner2.jpg"/></li>
                    <li><img src="images/it-banner3.jpg"/></li>
                    <li><img src="images/it-banner4.jpg"/></li>
                    <li><img src="images/it-banner5.jpg"/></li>
                    <li><img src="images/it-banner6.jpg"/></li>
                    <li><img src="images/it-banner7.jpg"/></li>
                </ul>
		</div>
	</div>
	<section class="container">
		<h1>新闻动态</h1>
		<a href="news.aspx" class="more">查看更多</a>
		<hr />
		<div class="crad-wrapper">
            <asp:Repeater ID="news" runat="server" ItemType="IndexCard">
                <ItemTemplate>
                    <section class="card">
                        <h2><a href="Content.aspx?id=<%#Item.id %>" title="<%#Item.title%>"><%#Item.title.Length>28?Item.title.Substring(0,27)+"...":Item.title %></a></h2>
                        <div class="card-img"><asp:Image ID="Image1" runat="server" ImageUrl="<%#Item.img%>" Visible="<%#Item.HasImg %>" /></div>
                        <p><%#Item.text %></p>
                        <a href="Content.aspx?id=<%#Item.id %>">查看全文</a>
                        <span class="time"><%#Item.time.ToLongDateString() %></span>
                    </section>
                </ItemTemplate>
            </asp:Repeater>
		
			<div class="clear"></div>
		</div>
   
	</section>
    <section class="container notice">
		<h1>通知公告</h1>
		<a href="news.aspx?type=2" class="more">查看更多</a>
		<hr />
		<div class="crad-wrapper">
            <asp:Repeater ID="tongzhi" runat="server" ItemType="IndexCard">
                <ItemTemplate>
                    <section class="card">
                        <h2><a href="Content.aspx?id=<%#Item.id %>" title="<%#Item.title%>"><%#Item.title.Length>28?Item.title.Substring(0,27)+"...":Item.title %></a></h2>
                        <div class="card-img"><asp:Image ID="Image2" runat="server" ImageUrl="<%#Item.img%>" Visible="<%#Item.HasImg %>" /></div>
                        <p><%#Item.text %></p>
                        <a href="Content.aspx?id=<%#Item.id %>">查看全文</a>
                        <span class="time"><%#Item.time.ToLongDateString() %></span>
                    </section>
                </ItemTemplate>
            </asp:Repeater>
		
			<div class="clear"></div>
		</div>
   
	</section>
    <section class="container employ">
		<h1>就业信息</h1>
		<a href="dangtuan-con.aspx?type=就业工作&item=招聘信息" class="more">查看更多</a>
		<hr />
		<div class="crad-wrapper">
            <asp:Repeater ID="job" runat="server" ItemType="IndexCard">
                <ItemTemplate>
                    <section class="card">
                        <h2><a href="Content.aspx?id=<%#Item.id %>" title="<%#Item.title%>"><%#Item.title.Length>28?Item.title.Substring(0,27)+"...":Item.title %></a></h2>
                        <div class="card-img"><asp:Image ID="Image3" runat="server" ImageUrl="<%#Item.img%>" Visible="<%#Item.HasImg %>" /></div>
                        <p><%#Item.text %></p>
                        <a href="Content.aspx?id=<%#Item.id %>">查看全文</a>
                        <span class="time"><%#Item.time.ToLongDateString() %></span>
                    </section>
                </ItemTemplate>
            </asp:Repeater>
		
			<div class="clear"></div>
		</div>
   
	</section>
</asp:Content>

<%--<!doctype html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title>信息科学与工程学院</title>
	<link href="css/style.css" rel="stylesheet" />
    <!-- enable HTML5 elements in IE -->
    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href="css/ie.css" />
    <script type="text/javascript" src="js/html5.js"></script>
    <![endif]-->
</head>

<body class="index">
	<header>
		<div class="container">
			<div class="logo">
				<a href="#" title="返回首页">
					<img src="images/tlogo.png" alt="信息科学与工程学院" />
				</a>
			</div>
			<nav class="nav">
				<ul id="navigation">
					<li class="second">
						<a href="#">概况</a>
						<ul>
							<li class="third">
								<a href="#">学院概况</a>
								<ul>
									<li><a href="Introduce.aspx?name=学院介绍">学院介绍</a></li>
									<li><a href="Introduce.aspx?name=物理系">物理系</a></li>
									<li><a href="Introduce.aspx?name=电子工程系">电子工程系</a></li>
                                    <li><a href="Introduce.aspx?name=计算机科学与技术系">计算机科学与技术系</a></li>
                                    <li><a href="Introduce.aspx?name=海洋技术系">海洋技术系</a></li>
                                    <li><a href="Introduce.aspx?name=信息工程中心">信息工程中心</a></li>
								</ul>
							</li>
							<li class="third">
								<a href="#">组织机构</a>
								<ul>
									<li><a href="#">院办公室</a></li>
									<li><a href="#">党委团委</a></li>
									<li><a href="#">院行政</a></li>
                                    <li><a href="#">院公会,妇委会</a></li>
                                    <li><a href="#">队伍建设</a></li>
								</ul>
							</li>
							<li class="third">
								<a href="#">师资队伍</a>
								<ul>
									
									<li><a href="#">物理系</a></li>
									<li><a href="#">电子工程系</a></li>
                                    <li><a href="#">计算机科学与技术系</a></li>
                                    <li><a href="#">海洋技术系</a></li>
                                    <li><a href="#">行政人员</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li class="second">
						<a href="#">教育教学</a>
						<ul>
							<li class="third">
								<a href="#">本科生教学</a>
								<ul>
									<li><a href="#">物理学</a></li>
									<li><a href="#">光信息科学与技术</a></li>
									<li><a href="#">电子信息科学与技术</a></li>
                                    <li><a href="#">电子信息工程</a></li>
                                    <li><a href="#">通信工程</a></li>
                                    <li><a href="#">计算机科学与技术</a></li>
                                    <li><a href="#">海洋技术</a></li>
                                  
								</ul>
							</li>
							<li class="third">
								<a href="#">研究生教学</a>
								<ul>
									
								</ul>
							</li>
							
						</ul>
					</li>
					<li class="second">
						<a href="dangtan.aspx">党团工作</a>
						<ul>
							<li class="third">
								<a href="dangtuan-con.aspx?type=党建工作&item=规章制度">党建工作</a>
								<ul>
									<li><a href="dangtuan-con.aspx?type=党建工作&item=规章制度">规章制度</a></li>
									<li><a href="dangtuan-con.aspx?type=党建工作&item=党员发展">党员发展</a></li>
									<li><a href="dangtuan-con.aspx?type=党建工作&item=党支部建设">党支部建设</a></li>
								</ul>
							</li>
                            <li class="third">
								<a href="dangtuan-con.aspx?type=团建工作&item=规章制度">团建工作</a>
								<ul>
									<li><a href="dangtuan-con.aspx?type=团建工作&item=规章制度">规章制度</a></li>
									<li><a href="dangtuan-con.aspx?type=团建工作&item=团支部建设">团支部建设</a></li>
									<li><a href="dangtuan-con.aspx?type=团建工作&item=特色活动">特色活动</a></li>
								</ul>
							</li>
							<li class="third">
								<a href="dangtuan-con.aspx?type=奖助工作&item=通知公告">奖助工作</a>
								<ul>
									<li><a href="dangtuan-con.aspx?type=奖助工作&item=通知公告">通知公告</a></li>
									<li><a href="dangtuan-con.aspx?type=奖助工作&item=相关下载">相关下载</a></li>
									<li><a href="dangtuan-con.aspx?type=奖助工作&item=获奖情况">获奖情况</a></li>
								</ul>
							</li>
                            <li class="third">
								<a href="dangtuan-con.aspx?type=就业工作&item=通知公告">就业工作</a>
								<ul>
									<li><a href="dangtuan-con.aspx?type=就业工作&item=通知公告">通知公告</a></li>
									<li><a href="dangtuan-con.aspx?type=就业工作&item=就业政策">就业政策</a></li>
									<li><a href="dangtuan-con.aspx?type=就业工作&item=招聘信息">招聘信息</a></li>
								</ul>
							</li>
                           <li><a href="StuOrg.aspx?type=2">学生组织</a></li>
                            <%--<li class="third">
								<a href="StuOrg.aspx?type=2">学生组织</a>
								<ul>

									<li><a href="#">学生会</a></li>
									<li><a href="#">研究生会</a></li>
									<li><a href="#">研究会</a></li>
                                    <li><a href="#">东乡行西部志愿者协会</a></li>
                                    <li><a href="#">爱特工作室</a></li>
                                    <li><a href="#">自强社</a></li>
                                    <li><a href="#">心晴协会</a></li>
                                    <li><a href="#">信息之光志愿者服务协会</a></li>
                                    <li><a href="#">蓝鲸俱乐部</a></li>
								</ul>
							</li>
                            <li><a href="dangtuan-con.aspx?type=常用下载&item=常用下载">常用下载</a></li>
						</ul>
					</li>
					<li class="second">
						<a href="StuOrg.aspx?type=3">科研</a>
						
					</li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>
	<div class="focus-warp">
		<div class="focus" id="focus">
            <asp:Repeater ID="dynamicImg" runat="server" ItemType="Article">
                <HeaderTemplate><ul></HeaderTemplate>
                <ItemTemplate>
                    <li><a href="Content.aspx?id=<%#Item.ArticleID %>" title=""><img src='<%#Item.ImgUrl %>' alt=""/></a></li>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </asp:Repeater>
			<%--<ul>
				<li><a href="#" title=""><img src="images/banner1.jpg" alt=""/></a></li>
				<li><a href="#" title=""><img src="images/banner2.jpg" alt=""/></a></li>
			</ul>
		</div>
	</div>
	<section class="container">
		<h1>新闻动态</h1>
		<a href="news.aspx" class="more">查看更多</a>
		<hr />
		<div class="crad-wrapper">
            <asp:Repeater ID="news" runat="server" ItemType="IndexCard">
                <ItemTemplate>
                    <section class="card">
                        <h2><%#Item.title %></h2>
                        <asp:Image ID="Image1" runat="server" ImageUrl="<%#Item.img%>" Visible="<%#Item.HasImg %>" />
                        <p><%#Item.text %></p>
                        <a href="Content.aspx?id=<%#Item.id %>">查看全文</a>
                        <span class="time"><%#Item.time.ToLongDateString() %></span>
                    </section>
                </ItemTemplate>
            </asp:Repeater>
		
			<div class="clear"></div>
		</div>
   
	</section>
  
	<footer class="footer">
		<div class="container">
			<div class="blogo">
				<img src="images/blogo.png" alt="信息科学与工程学院"/>
			</div>
			<div class="footer-con">
				<h3>联系我们</h3>
				<ul>
				  <li>电话：XXXX-XXXX</li>
				  <li>地址：XXXXXXXXXXXXX</li>
				  <li>邮编：XXXXXX</li>
				</ul>
			</div>
			<div class="footer-con">
				<h3>网站地图</h3>
				<ul>
				  <li><a href="#">一级导航</a></li>
				  <li><a href="#">一级导航</a></li>
				  <li><a href="#">一级导航</a></li>
				  <li><a href="#">一级导航</a></li>
				</ul>
			</div>
			<div class="footer-con">
				<h3>友情链接</h3>
				<ul>
				  <li><a href="#">友情链接一</a></li>
				  <li><a href="#">友情链接二</a></li>
				  <li><a href="#">友情链接三</a></li>
				  <li><a href="#">友情链接四</a></li>
				</ul>
			</div>
		</div>
	</footer>
	<script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="js/script.js" type="text/javascript"></script>
	<script type="text/javascript">
	    $.focus("#focus");
	</script>
</body>
</html>--%>

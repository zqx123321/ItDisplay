<%@ Page Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="dangtan.aspx.cs" Inherits="Display_dangtan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>信息科学与工程学院</title>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server"><body class="dangtuan"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



	<div class="container">
		<aside class="page-nav" id="aside">
			<h1>党团工作</h1>
			<hr />
			<ul>
				<li><a href="dangtuan-con.aspx?type=党建工作&item=规章制度">党建工作</a></li>
				<li><a href="dangtuan-con.aspx?type=团建工作&item=规章制度">团建工作</a></li>
				<li><a href="dangtuan-con.aspx?type=奖助工作&item=通知公告">奖助工作</a></li>
				<li><a href="dangtuan-con.aspx?type=就业工作&item=通知公告">就业工作</a></li>
				<li><a href="dangtuan-con.aspx?type=科技创新&item=科技创新">科技创新</a></li>
				<li><a href="dangtuan-con.aspx?type=学生风采&item=学生风采">学生风采</a></li>
				<li><a href="StuOrg.aspx?type=2">学生组织</a></li>
				<li><a href="dangtuan-con.aspx?type=管理规定&item=管理规定">管理规定</a></li>
				<li><a href="dangtuan-con.aspx?type=常用下载&item=常用下载">常用下载</a></li>
			</ul>
		</aside>
		<section class="container right">
			<h1>党建工作</h1>
			<a href="dangtuan-con.aspx?type=党建工作&item=规章制度" class="more">查看更多</a>
			<hr />
			<div class="list-wrapper">
				<ul class="list">
                    <asp:Repeater ID="dangjian" runat="server" ItemType="Article">
                        <ItemTemplate>
                            <li>
                                <div class="time">
						<span class="day"><%#Item.UpdateTime.Day %></span>
						<span class="mon"><%#Item.UpdateTime.Year %>.<%#Item.UpdateTime.Month>9?Item.UpdateTime.Month.ToString():"0"+Item.UpdateTime.Month %></span>
					</div>
                                <a class="type" >【<%#Item.Type.Substring(Item.Type.IndexOf(":")+1) %>】</a>
					<a href="<%#Item.Link??"Content.aspx?id="+Item.ArticleID %>"><h2><%#Item.Title %></h2></a>
					<p><%#MyHtmlHelper.RemoveTags(Item.Content).Length>=50?MyHtmlHelper.RemoveTags(Item.Content).Substring(0,50):MyHtmlHelper.RemoveTags(Item.Content) %></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    
					<%--<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【规章制度】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【党员发展】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【规章制度】</a>
						<a href="#"><h2>这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【支部建设】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~</p>
					</li>--%>
				</ul>
			</div>
		</section>
		<section class="container right">
			<h1>团建工作</h1>
			<a href="dangtuan-con.aspx?type=团建工作&item=规章制度" class="more">查看更多</a>
			<hr />
			<div class="list-wrapper">
				<ul class="list">
                    <asp:Repeater ID="tuanjian" runat="server" ItemType="Article">
                        <ItemTemplate>
                            <li>
                                <div class="time">
						<span class="day"><%#Item.UpdateTime.Day %></span>
						<span class="mon"><%#Item.UpdateTime.Year %>.<%#Item.UpdateTime.Month>9?Item.UpdateTime.Month.ToString():"0"+Item.UpdateTime.Month %></span>
					</div>
                                <a class="type" >【<%#Item.Type.Substring(Item.Type.IndexOf(":")+1) %>】</a>
					<a href="<%#Item.Link??"Content.aspx?id="+Item.ArticleID %>"><h2><%#Item.Title %></h2></a>
					<p><%#MyHtmlHelper.RemoveTags(Item.Content).Length>=50?MyHtmlHelper.RemoveTags(Item.Content).Substring(0,50):MyHtmlHelper.RemoveTags(Item.Content) %></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
					<%--<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【基本知识】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【支部建设】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【支部建设】</a>
						<a href="#"><h2>这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【基本知识】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~</p>
					</li>--%>
				</ul>
			</div>
		</section>
		<section class="container right">
			<h1>奖助工作</h1>
			<a href="dangtuan-con.aspx?type=奖助工作&item=通知公告" class="more">查看更多</a>
			<hr />
			<div class="list-wrapper">
				<ul class="list">
                    <asp:Repeater ID="jianzu" runat="server" ItemType="Article">
                        <ItemTemplate>
                            <li>
                                <div class="time">
						<span class="day"><%#Item.UpdateTime.Day %></span>
						<span class="mon"><%#Item.UpdateTime.Year %>.<%#Item.UpdateTime.Month>9?Item.UpdateTime.Month.ToString():"0"+Item.UpdateTime.Month %></span>
					</div>
                                <a class="type" >【<%#Item.Type.Substring(Item.Type.IndexOf(":")+1) %>】</a>
					<a href="<%#Item.Link??"Content.aspx?id="+Item.ArticleID %>"><h2><%#Item.Title %></h2></a>
					<p><%#MyHtmlHelper.RemoveTags(Item.Content).Length>=50?MyHtmlHelper.RemoveTags(Item.Content).Substring(0,50):MyHtmlHelper.RemoveTags(Item.Content) %></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
					<%--<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~</p>
					</li>--%>
				</ul>
			</div>
		</section>
		<section class="container right">
			<h1>就业工作</h1>
			<a href="dangtuan-con.aspx?type=就业工作&item=通知公告" class="more">查看更多</a>
			<hr />
			<div class="list-wrapper">
				<ul class="list">
                    <asp:Repeater ID="jiuye" runat="server" ItemType="Article">
                        <ItemTemplate>
                            <li>
                                <div class="time">
						<span class="day"><%#Item.UpdateTime.Day %></span>
						<span class="mon"><%#Item.UpdateTime.Year %>.<%#Item.UpdateTime.Month>9?Item.UpdateTime.Month.ToString():"0"+Item.UpdateTime.Month %></span>
					</div>
                                <a class="type">【<%#Item.Type.Substring(Item.Type.IndexOf(":")+1) %>】</a>
					<a href="<%#Item.Link??"Content.aspx?id="+Item.ArticleID %>"><h2><%#Item.Title %></h2></a>
					<p><%#MyHtmlHelper.RemoveTags(Item.Content).Length>=50?MyHtmlHelper.RemoveTags(Item.Content).Substring(0,50):MyHtmlHelper.RemoveTags(Item.Content) %></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
					<%--<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~</p>
					</li>--%>
				</ul>
			</div>
		</section>
		<section class="container right">
			<h1>科技创新</h1>
			<a href="dangtuan-con.aspx?type=科技创新&item=科技创新" class="more">查看更多</a>
			<hr />
			<div class="list-wrapper">
				<ul class="list">
                    <asp:Repeater ID="keji" runat="server" ItemType="Article">
                        <ItemTemplate>
                            <li>
                                <div class="time">
						<span class="day"><%#Item.UpdateTime.Day %></span>
						<span class="mon"><%#Item.UpdateTime.Year %>.<%#Item.UpdateTime.Month>9?Item.UpdateTime.Month.ToString():"0"+Item.UpdateTime.Month %></span>
					</div>
                                <a class="type">【<%#Item.Type.Substring(Item.Type.IndexOf(":")+1) %>】</a>
					<a href="<%#Item.Link??"Content.aspx?id="+Item.ArticleID %>"><h2><%#Item.Title %></h2></a>
					<p><%#MyHtmlHelper.RemoveTags(Item.Content).Length>=50?MyHtmlHelper.RemoveTags(Item.Content).Substring(0,50):MyHtmlHelper.RemoveTags(Item.Content) %></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
					<%--<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~</p>
					</li>--%>
				</ul>
			</div>
		</section>
		
		
		<section class="container right">
			<h1>学生风采</h1>
			<a href="dangtuan-con.aspx?type=学生风采&item=学生风采" class="more">查看更多</a>
			<hr />
			<div class="list-wrapper">
				<ul class="list">
                    <asp:Repeater ID="stud" runat="server" ItemType="Article">
                        <ItemTemplate>
                            <li>
                                <div class="time">
						<span class="day"><%#Item.UpdateTime.Day %></span>
						<span class="mon"><%#Item.UpdateTime.Year %>.<%#Item.UpdateTime.Month>9?Item.UpdateTime.Month.ToString():"0"+Item.UpdateTime.Month %></span>
					</div>
                                <a class="type" >【<%#Item.Type.Substring(Item.Type.IndexOf(":")+1) %>】</a>
					<a href="<%#Item.Link??"Content.aspx?id="+Item.ArticleID %>"><h2><%#Item.Title %></h2></a>
					<p><%#MyHtmlHelper.RemoveTags(Item.Content).Length>=50?MyHtmlHelper.RemoveTags(Item.Content).Substring(0,50):MyHtmlHelper.RemoveTags(Item.Content) %></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
				</ul>
			</div>
		</section>
		
		<section class="container right">
			<h1>学生组织</h1>
			<a  class="more">查看更多</a>
			<hr />
			<div class="list-wrapper">
				<ul class="list">
                    <asp:Repeater ID="xuesheng" runat="server" ItemType="Article">
                        <ItemTemplate>
                            <li>
                                <div class="time">
						<span class="day"><%#Item.UpdateTime.Day %></span>
						<span class="mon"><%#Item.UpdateTime.Year %>.<%#Item.UpdateTime.Month>9?Item.UpdateTime.Month.ToString():"0"+Item.UpdateTime.Month %></span>
					</div>
                                <a class="type" >【<%#Item.Type.Substring(Item.Type.IndexOf(":")+1) %>】</a>
					<a href="<%#Item.Link??"Content.aspx?id="+Item.ArticleID %>"><h2><%#Item.Title %></h2></a>
					<p><%#MyHtmlHelper.RemoveTags(Item.Content).Length>=50?MyHtmlHelper.RemoveTags(Item.Content).Substring(0,50):MyHtmlHelper.RemoveTags(Item.Content) %></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
					<%--<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~</p>
					</li>
					<li>
						<div class="time">
							<span class="day">22</span>
							<span class="mon">2014.9</span>
						</div>
						<a class="type" href="#">【通知公告】</a>
						<a href="#"><h2>这里是标题啦啦啦！</h2></a>
						<p>这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~这里还是内容哦哦哦~</p>
					</li>--%>
				</ul>
			</div>
		</section>
		
		<section class="container right">
			<h1>常用下载</h1>
			<a href="dangtuan-con.aspx?type=常用下载&item=常用下载" class="more">查看更多</a>
			<hr />
			<div class="list-wrapper">
				<ul class="list">
                    <asp:Repeater ID="下载" runat="server" ItemType="Article">
                        <ItemTemplate>
                            <li>
                                <div class="time">
						<span class="day"><%#Item.UpdateTime.Day %></span>
						<span class="mon"><%#Item.UpdateTime.Year %>.<%#Item.UpdateTime.Month>9?Item.UpdateTime.Month.ToString():"0"+Item.UpdateTime.Month %></span>
					</div>
                                <a class="type" >【<%#Item.Type.Substring(Item.Type.IndexOf(":")+1) %>】</a>
					<a href="<%#Item.Link??"Content.aspx?id="+Item.ArticleID %>"><h2><%#Item.Title %></h2></a>
					<p><%#MyHtmlHelper.RemoveTags(Item.Content).Length>=50?MyHtmlHelper.RemoveTags(Item.Content).Substring(0,50):MyHtmlHelper.RemoveTags(Item.Content) %></p>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
				</ul>
			</div>
		</section>
		<div class="clear"></div>
	</div>

</asp:Content>
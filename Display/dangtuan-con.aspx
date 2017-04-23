<%@ Page Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="dangtuan-con.aspx.cs" Inherits="Display_dangtuan_con" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>信息科学与工程学院</title>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server"><body class="dangtuan"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


	<div class="container">
		<aside class="page-nav" id="aside">
			<h1>
                <asp:Literal ID="title" runat="server"></asp:Literal></h1>
			<hr />
			<ul>
                <asp:Repeater ID="menu" runat="server">
                    <ItemTemplate><li>
                        <a href="dangtuan-con.aspx?type=<%=(Request.QueryString["type"]).ToString().Replace('<', ' ').Replace('>', ' ').Replace('"', ' ') %>&item=<%#Container.DataItem.ToString().Equals("团支部建设")?"团支部":Container.DataItem %>"><%#Container.DataItem %></a>
                                  </li></ItemTemplate>
                </asp:Repeater>
				<%--<li class="active"><a href="#">规章制度</a></li>
				<li><a href="#">党员发展</a></li>
				<li><a href="#">支部建设</a></li>--%>
			</ul>
		</aside>
		<section class="container right">
		<h1><asp:Literal ID="item" runat="server"></asp:Literal></h1>
		<hr />
		<div class="list-wrapper">
			<ul class="list">
                <asp:Repeater ID="Repeater1" runat="server" ItemType="Article">
                    <ItemTemplate>
                        <li>
					<div class="time">
						<span class="day"><%#Item.UpdateTime.Day %></span>
						<span class="mon"><%#Item.UpdateTime.Year %>.<%#Item.UpdateTime.Month>9?Item.UpdateTime.Month.ToString():"0"+Item.UpdateTime.Month %></span>
					</div>
					<a href="<%#Item.Link??"Content.aspx?id="+Item.ArticleID %>"><h2><%#Item.Title %></h2></a>
					<p><%#MyHtmlHelper.RemoveTags(Item.Content).Length>=50?MyHtmlHelper.RemoveTags(Item.Content).Substring(0,50):MyHtmlHelper.RemoveTags(Item.Content) %></p>
				</li>
                    </ItemTemplate>
                </asp:Repeater>
		
			</ul>
		</div>
		<div class="list-control">
            <asp:HyperLink ID="First" runat="server"  >首页</asp:HyperLink>
            <asp:HyperLink ID="Prev" runat="server" >上一页</asp:HyperLink>
			<%--<a href="#">首页</a>
			<a href="#">上一页</a>--%>
			<span>当前是第<span><asp:Literal ID="currentPage" runat="server"></asp:Literal></span>页</span><!-- 这里是当前页数 -->
            <asp:HyperLink ID="Next" runat="server">下一页</asp:HyperLink>
            <asp:HyperLink ID="Last" runat="server">尾页</asp:HyperLink>
			<%--<a href="#">下一页</a>
			<a href="#">尾页</a>--%>
			<span>共有<span><asp:Literal ID="TotalPage" runat="server"></asp:Literal></span>页</span><!-- 这里是总共页数 -->
		</div>
	</section>
		<div class="clear"></div>
	</div>
	</asp:Content>


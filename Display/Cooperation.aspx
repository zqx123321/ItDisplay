<%@ Page Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="Cooperation.aspx.cs" Inherits="Display_Cooperation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server"><body class="list"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


	<section class="container">
		<h1>合作办学</h1>
		<hr />
		<div class="list-wrapper">
			<ul class="list">
                <asp:Repeater ID="Repeater1" runat="server" ItemType="Introduce">
                    <ItemTemplate>
                        <li>
					<div class="time">
						<span class="day"></span>
						<span class="mon"></span>
					</div>
					<a href="<%#"Introduce.aspx?id="+Item.id %>"><h2><%#Item.name %></h2></a>
					<p><%#MyHtmlHelper.RemoveTags(Item.text).Length>=50?MyHtmlHelper.RemoveTags(Item.text).Substring(0,50):MyHtmlHelper.RemoveTags(Item.text) %></p>
				</li>
                    </ItemTemplate>
                </asp:Repeater>
		
			</ul>
		</div>
		<div class="list-control">
            <asp:HyperLink ID="First" runat="server" NavigateUrl="~/Display/Cooperation.aspx?page=0" >首页</asp:HyperLink>
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
	</asp:Content>

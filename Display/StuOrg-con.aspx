<%@ Page Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="StuOrg-con.aspx.cs" Inherits="Display_StuOrg_con" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server"><body class="organization"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<section class="container">
		<h1>
            <asp:Literal ID="Gname" runat="server"></asp:Literal></h1>
		<hr />
		<div class="list-wrapper">
			<div class="organization-info">
				<!-- 下面这个图是组织的标志图片 -->
                <asp:Image ID="Gimg" runat="server" />
				<%--<img src="" alt="这里是组织名字！" title="这里也是组织名字！" />--%>
				
			</div>
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
	</asp:Content>
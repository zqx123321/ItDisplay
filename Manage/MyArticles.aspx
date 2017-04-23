<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="MyArticles.aspx.cs" Inherits="Manage_Default" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>我的文章</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" ItemType="Article" OnItemCommand="Repeater1_ItemCommand">
        <HeaderTemplate>
            <table>
        </HeaderTemplate>
        <ItemTemplate>
            <tr><td><%#:Item.Title %></td>
                <td><%#:Item.UpdateTime.Date.ToShortDateString() %></td>
                <td><%#:Item.Source %></td>
                <td><a href="AddArticle.aspx?id=<%#:Item.ArticleID %>">修改</a></td>
                <td><asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" CommandArgument='<%#:Item.ArticleID %>' OnClientClick="return confirm('确定删除?')" >删除</asp:LinkButton></td><!--  -->
                  
        </tr></ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater><br />
	<div class="pagelist">
    <asp:HyperLink ID="First" runat="server" NavigateUrl="MyArticles.aspx?page=0" >首页</asp:HyperLink>
            <asp:HyperLink ID="Prev" runat="server" >上一页</asp:HyperLink>
			<span>当前是第<span><asp:Literal ID="currentPage" runat="server"></asp:Literal></span>页</span><!-- 这里是当前页数 -->
            <asp:HyperLink ID="Next" runat="server">下一页</asp:HyperLink>
            <asp:HyperLink ID="Last" runat="server">尾页</asp:HyperLink>
			<span>共有<span><asp:Literal ID="TotalPage" runat="server"></asp:Literal></span>页</span><!-- 这里是总共页数 -->
	</div>
</asp:Content>


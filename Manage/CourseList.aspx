<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="CourseList.aspx.cs" Inherits="Manage_Default" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>课程列表</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" ItemType="Course" OnItemCommand="Repeater1_ItemCommand">
        <HeaderTemplate>
            <table>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%#:Item.CourseName %></td>
                <td><%#:Item.Major%></td>
                <td><a href="AddCourse.aspx?id=<%#:Item.CourseID%>">修改</a> </td>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" CommandArgument='<%#:Item.CourseID%>' OnClientClick="return confirm('确定删除?')">删除</asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
	<div class="pagelist">
		<asp:HyperLink ID="First" runat="server" NavigateUrl="CourseList.aspx?page=0" >首页</asp:HyperLink>
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
		<a href="AddCourse.aspx">添加新课程</a><br />
    <a href="CourseOutline.aspx">添加/修改教学大纲</a>
   <BR><BR><BR><A style="COLOR: red" href="coursehelp.html" target=_blank><STRONG>点我查阅帮助文档</STRONG></A> 
</asp:Content>


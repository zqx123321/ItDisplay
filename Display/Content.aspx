<%@ Page Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="Content.aspx.cs" Inherits="Display_Content" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>信息科学与工程学院</title>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server"><body class="content"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="container">
	<form id="form1" runat="server">
		<h1><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h1>
		<div class="content-info">
			<span>消息来源：<span><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></span></span>
            <span>作者：<span><asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></span></span>
			<span>点击数：<span><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></span></span>
			<span>更新时间：<span><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></span></span>
			<span><asp:LinkButton ID="LinkAdd" runat="server" OnClick="Add_Click" Visible="false" CommandArgument="Add">有意向点击我</asp:LinkButton>
			<asp:HiddenField ID="addID" runat="server" /></span>
		</div>
		</form>
		<div class="content-con">
			<asp:Literal ID="Literal1" runat="server"></asp:Literal>
		</div>
		<div class="back-link">
			<a href="javascript:history.back();">返回之前页面</a>
		</div>
	</section>
</asp:Content>



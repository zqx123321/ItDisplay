<%@ Page Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="Introduce.aspx.cs" Inherits="Display_Introduce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server"><body class="content"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




	<section class="container">
		<h1><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h1>
		
		<div class="content-con">
			<asp:Literal ID="Literal1" runat="server"></asp:Literal>
		</div>
	</section>
	</asp:Content>
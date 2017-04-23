<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="AddIntroduce.aspx.cs" Inherits="Manage_Default" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>添加简介</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem>学院介绍</asp:ListItem>
        <asp:ListItem>物理系</asp:ListItem>
        <asp:ListItem>电子工程系</asp:ListItem>
        <asp:ListItem>计算机科学与技术系</asp:ListItem>
        <asp:ListItem>海洋技术系</asp:ListItem>
        <asp:ListItem>信息工程中心</asp:ListItem>
    </asp:DropDownList><br />
    <br />
    <CKEditor:CKEditorControl ID="CKEditor1" runat="server"></CKEditor:CKEditorControl>
    <asp:Button ID="Button1" runat="server" Text="确定" OnClick="Button1_Click" />
</asp:Content>


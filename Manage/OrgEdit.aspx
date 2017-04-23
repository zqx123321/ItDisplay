<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="OrgEdit.aspx.cs" Inherits="Manage_OrgEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>修改组织机构个人信息</h3>
    <label>请选择所属的组织机构</label>
    <asp:DropDownList ID="ddlGroup" runat="server" OnSelectedIndexChanged="ddlGroup_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
    <br />
    <label>姓名：</label>
    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
    <br />
    <label>职务：</label>
    <asp:TextBox ID="txtJob" runat="server"></asp:TextBox>
    <br />
    <label>职责：</label>
    <asp:TextBox ID="txtDuty" runat="server"></asp:TextBox>
    <br />
    <label>联系电话：</label>
    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
    <br />
    <label>电子邮箱:</label>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnEdit" runat="server" Text="确认修改" OnClick="btnEdit_Click" />
</asp:Content>


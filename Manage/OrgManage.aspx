<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="OrgManage.aspx.cs" Inherits="Manage_OrgManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <h3>为组织机构添加成员</h3>
        <label>请选择有权限的Group</label>
        <asp:DropDownList ID="ddlGroup" runat="server"></asp:DropDownList>
        <br />
        <label>请输入要添加的老师的工号或学生的学号：</label>
        <asp:TextBox ID="txtNum" runat="server"></asp:TextBox>
        <asp:Button ID="btnCheck" runat="server" Text="检索" OnClick="btnCheck_Click" />
        <br />
        <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
        <label>请选择显示的等级：</label>
        <asp:DropDownList ID="ddlClass" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
        </asp:DropDownList>
        <br />
        <label>请选择权限：</label>
        <asp:DropDownList ID="ddlRight" runat="server">
            <asp:ListItem>管理员</asp:ListItem>
            <asp:ListItem>其他</asp:ListItem>
        </asp:DropDownList>
        <br />
        <label>请输入职务：</label>
        <asp:TextBox ID="txtJob" runat="server"></asp:TextBox>
        <br />
        <label>请输入职责：</label>
        <asp:TextBox ID="txtDuty" runat="server"></asp:TextBox>
        <br />
        <label>请输入电话：</label>
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        <br />
        <label>请输入Email:</label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="添加进Group" OnClick="btnAdd_Click" />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
        <h3>为组织机构删除成员</h3>
        <label>请选择有权限的Group</label>
        <asp:DropDownList ID="ddlDelete" runat="server"></asp:DropDownList>
        <br />
        <label>请输入要删除的老师的工号或学生的学号：</label>
        <asp:TextBox ID="txtDelete" runat="server"></asp:TextBox>
        <asp:Button ID="btnDelCheck" runat="server" Text="检索" OnClick="btnDelCheck_Click" />
        <br />
        <asp:Label ID="lblDelete" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="btnDelete" runat="server" Text="删除" OnClick="btnDelete_Click" />
    </asp:Panel>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="PswEdit.aspx.cs" Inherits="Manage_PswEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>修改密码</h3>
    <label>用户：</label>
    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
    <label>新密码：</label>
    <asp:TextBox ID="txtNewPsw" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valrNewPwd" runat="server" ErrorMessage="新密码不能为空" ControlToValidate="txtNewPsw"></asp:RequiredFieldValidator>
    <label>确认密码：</label>
    <asp:TextBox ID="txtAgainPsw" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="valrAgainPwd" runat="server" ErrorMessage="确认密码不能为空" ControlToValidate="txtAgainPsw"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="两次输入的密码不一致" ControlToCompare="txtNewPsw" ControlToValidate="txtAgainPsw"></asp:CompareValidator>
    <asp:Button ID="btnEdit" runat="server" Text="确认修改" OnClick="btnEdit_Click" />
</asp:Content>


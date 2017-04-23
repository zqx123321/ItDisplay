<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="CourseOutline.aspx.cs" Inherits="Manage_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>人才培养方案</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>人才培养方案</h2>
   
    <table>
        <tr>
            <td>课程名</td>
            <td>上传时间</td>
            <td>替换上传</td>
        </tr>
        <tr>
            <td>物理学：</td>
            <td><%:GetUpdateTime("wuli") %></td>
            <td>
                <asp:FileUpload ID="wuli" runat="server" /><asp:Button ID="Button1" runat="server" Text="替换上传" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td>光信息科学与技术 ：</td>
            <td><%:GetUpdateTime("guangke") %></td>
            <td>
                <asp:FileUpload ID="guangke" runat="server" /><asp:Button ID="Button2" runat="server" Text="替换上传" OnClick="Button2_Click" />
            </td>
        </tr>
        <tr>
            <td>电子信息工程：</td>
            <td><%:GetUpdateTime("diangong") %></td>
            <td>
                <asp:FileUpload ID="diangong" runat="server" /><asp:Button ID="Button3" runat="server" Text="替换上传" OnClick="Button3_Click" /></td>
        </tr>
         <tr>
            <td>电子信息工程中法卓越班：</td>
            <td><%:GetUpdateTime("zhongfa") %></td>
            <td>
                <asp:FileUpload ID="zhongfa" runat="server" /><asp:Button ID="Button8" runat="server" Text="替换上传" OnClick="Button8_Click" /></td>
        </tr>
        <tr>
            <td>电子信息科学与技术：</td>
            <td><%:GetUpdateTime("dianke") %></td>
            <td>
                <asp:FileUpload ID="dianke" runat="server" /><asp:Button ID="Button4" runat="server" Text="替换上传" OnClick="Button4_Click" /></td>
        </tr>
        <tr>
            <td>通信工程：</td>
            <td><%:GetUpdateTime("tongxin") %></td>
            <td>
                <asp:FileUpload ID="tongxin" runat="server" /><asp:Button ID="Button5" runat="server" Text="替换上传" OnClick="Button5_Click" /></td>
        </tr>
        <tr>
            <td>计算机科学与技术：</td>
            <td><%:GetUpdateTime("jisuanji") %></td>
            <td>
                <asp:FileUpload ID="jisuanji" runat="server" /><asp:Button ID="Button6" runat="server" Text="替换上传" OnClick="Button6_Click" /></td>
        </tr>
        <tr>
            <td>海洋技术：</td>
            <td><%:GetUpdateTime("haiji") %></td>
            <td>
                <asp:FileUpload ID="haiji" runat="server" /><asp:Button ID="Button7" runat="server" Text="替换上传" OnClick="Button7_Click" /></td>
        </tr>
    </table>
    
    <p><a href="CourseList.aspx">返回课程列表</a></p>
</asp:Content>


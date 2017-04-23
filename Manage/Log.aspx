<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/Master.master" AutoEventWireup="true" CodeFile="Log.aspx.cs" Inherits="Manage_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource1" PageSize="20">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                 <ItemTemplate>
                     <asp:CheckBox ID="CheckBox1" runat="server" /></ItemTemplate>
             </asp:TemplateField>
            <asp:BoundField DataField="LogID" HeaderText="LogID" ReadOnly="True" SortExpression="LogID"></asp:BoundField>
            <asp:BoundField DataField="Time" HeaderText="Time" ReadOnly="True" SortExpression="Time"></asp:BoundField>
            <asp:BoundField DataField="Info" HeaderText="Info" ReadOnly="True" SortExpression="Info"></asp:BoundField>
            <asp:BoundField DataField="IP" HeaderText="IP" ReadOnly="True" SortExpression="IP"></asp:BoundField>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:EntityDataSource runat="server" ID="EntityDataSource1" DefaultContainerName="oucITEntities1" ConnectionString="name=oucITEntities1" EnableFlattening="False" EntitySetName="Log" Select="it.[LogID], it.[Time], it.[Info], it.[IP], it.[UserID]" EntityTypeFilter="" OrderBy="it.[LogID] DESC"></asp:EntityDataSource>

    <asp:Button ID="delete" runat="server"  Text="删除所有选中项" OnClick="delete_Click" />
&nbsp;
   
&nbsp;
    <asp:Button ID="clearAll" runat="server" OnClick="clearAll_Click"  Text="清空所有记录" />
</asp:Content>


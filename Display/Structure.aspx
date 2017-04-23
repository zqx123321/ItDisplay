<%@ Page Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="Structure.aspx.cs" Inherits="Display_Structure" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server"><body class="structure"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container">
            <aside class="page-nav" id="aside">
                <h1>组织机构</h1>
                <hr />
                <ul>
                    <li><a href="Structure.aspx?type=dwtw">党委团委</a></li>
                    <li><a href="Structure.aspx?type=yxz">院行政</a></li>
                    <li><a href="Structure.aspx?type=ygh">院工会、妇委会</a></li>
                </ul>
            </aside>
            <asp:Panel ID="Panel1" runat="server">

                <section class="container right" runat="server" id="section1">
                    <h1>学院党委</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="10%">姓名</th>
                                            <th width="17%">职务</th>
                                            <th width="33%">职责</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Duty") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>

                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <section class="container right">
                    <h1>学院团委</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="10%">姓名</th>
                                            <th width="17%">职务</th>
                                            <th width="33%">职责</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Duty") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>

                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <section class="container right">
                    <h1>教工党支部</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater3" runat="server" OnItemDataBound="Repeater3_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="12%">姓名</th>
                                            <th width="48%">职务</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <section class="container right">
                    <h1>学生党支部</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater4" runat="server">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="100%">党支部名称</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                    <td>
                                        <%#Eval("Job")%>
									</td>
                                        </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <div class="clear"></div>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
                <section class="container right" runat="server" id="section2">
                    <h1>院行政</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater5" runat="server" OnItemDataBound="Repeater5_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="10%">姓名</th>
                                            <th width="17%">职务</th>
                                            <th width="33%">职责</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Duty") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <section class="container right" runat="server" id="section3">
                    <h1>院办公室</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater6" runat="server" OnItemDataBound="Repeater6_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="10%">姓名</th>
                                            <th width="17%">职务</th>
                                            <th width="33%">职责</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Duty") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <section class="container right" runat="server" id="section4">
                    <h1>物理系</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater7" runat="server" OnItemDataBound="Repeater7_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="10%">姓名</th>
                                            <th width="17%">职务</th>
                                            <th width="33%">职责</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Duty") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <section class="container right" runat="server" id="section5">
                    <h1>电子工程系</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater8" runat="server" OnItemDataBound="Repeater8_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="10%">姓名</th>
                                            <th width="17%">职务</th>
                                            <th width="33%">职责</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Duty") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <section class="container right" runat="server" id="section6">
                    <h1>计算机科学与技术系</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater9" runat="server" OnItemDataBound="Repeater9_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="10%">姓名</th>
                                            <th width="17%">职务</th>
                                            <th width="33%">职责</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Duty") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <section class="container right" runat="server" id="section7">
                    <h1>海洋技术系</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater10" runat="server" OnItemDataBound="Repeater10_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="10%">姓名</th>
                                            <th width="17%">职务</th>
                                            <th width="33%">职责</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Duty") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <section class="container right" runat="server" id="section8">
                    <h1>信息工程中心</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater11" runat="server" OnItemDataBound="Repeater11_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="10%">姓名</th>
                                            <th width="17%">职务</th>
                                            <th width="33%">职责</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Duty") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <div class="clear"></div>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server">
                <section class="container right" runat="server" id="section9">
                    <h1>院工会</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater12" runat="server" OnItemDataBound="Repeater12_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="10%">姓名</th>
                                            <th width="17%">职务</th>
                                            <th width="33%">职责</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Duty") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <section class="container right" runat="server" id="section10">
                    <h1>院妇女委员会</h1>
                    <hr />
                    <div class="table-wrapper">
                        <div class="table-con">
                            <asp:Repeater ID="Repeater13" runat="server" OnItemDataBound="Repeater13_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table-info" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th width="10%">姓名</th>
                                            <th width="17%">职务</th>
                                            <th width="33%">职责</th>
                                            <th width="12%">联系电话</th>
                                            <th width="28%">电子邮箱</th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="Teacher.aspx?id=<%#Eval("id")%>">
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>'></asp:Label></a></th>
                                        <td><%#Eval("Job") %></th>
                                        <td><%#Eval("Duty") %></th>
                                        <td><%#Eval("Phone") %></th>
                                        <td><%#Eval("Email") %></th>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>
                <div class="clear"></div>
            </asp:Panel>
        </div>
        </asp:Content>
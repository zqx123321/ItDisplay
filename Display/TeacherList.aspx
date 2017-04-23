<%@ Page Title="" Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="TeacherList.aspx.cs" Inherits="Display_TeacherList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <body class="teacher-list">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="container">
            <aside class="page-nav" id="aside">
                <h1>师资队伍</h1>
                <hr />
                <ul>
                    <li><a href="TeacherList.aspx?type=wl">物理系</a></li>
                    <li><a href="TeacherList.aspx?type=dg">电子工程系</a></li>
                    <li><a href="TeacherList.aspx?type=jsj">计算机系</a></li>
                    <li><a href="TeacherList.aspx?type=hj">海洋技术系</a></li>
					<li><a href="TeacherList.aspx?type=xxgczx">信息工程中心</a></li>
                </ul>
            </aside>
            <section class="container right">
                <h1>
                    <asp:label id="lblMajor" runat="server" text=""></asp:label>
                </h1>

                <hr />
                <asp:panel id="panelChoose" runat="server" cssclass="list-control">
                    <asp:linkbutton ID="lnkJob" runat="server" onclick="lnkJob_Click">按职称分类</asp:linkbutton>
                    <asp:linkbutton ID="lnkBshTutor" runat="server" onclick="lnkTutor_Click">博士生导师</asp:linkbutton>
                    <asp:linkbutton ID="lnkYjsTutor" runat="server" onclick="lnkYjsTutor_Click">硕士生导师</asp:linkbutton>
                </asp:panel>
                <asp:panel id="panel1" runat="server">
                    <div class="list-wrapper">
                    <h2>教授</h2>
                    <ul class="list download">
                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Teacher.aspx?id=<%#Eval("UserID") %>">
                                    <h2>
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("UserID") %>'></asp:Label></h2>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                        <h2>副教授</h2>
                    <ul class="list download">
                        <asp:Repeater ID="Repeater4" runat="server" OnItemDataBound="Repeater4_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Teacher.aspx?id=<%#Eval("UserID") %>">
                                    <h2>
                                    <asp:Label ID="lblName4" runat="server" Text='<%#Eval("UserID") %>'></asp:Label></h2>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                        <h2>高级工程师</h2>
                    <ul class="list download">
                        <asp:Repeater ID="Repeater5" runat="server" OnItemDataBound="Repeater5_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Teacher.aspx?id=<%#Eval("UserID") %>">
                                    <h2>
                                    <asp:Label ID="lblName5" runat="server" Text='<%#Eval("UserID") %>'></asp:Label></h2>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                        <h2>高级实验师</h2>
                        <ul class="list download">
                        <asp:Repeater ID="Repeater6" runat="server" OnItemDataBound="Repeater6_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Teacher.aspx?id=<%#Eval("UserID") %>">
                                    <h2>
                                    <asp:Label ID="lblName6" runat="server" Text='<%#Eval("UserID") %>'></asp:Label></h2>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>

                    </ul>
                        <asp:Panel ID="panel5" runat="server">
                        <h2>讲师</h2>
                        <ul class="list download">
                        <asp:Repeater ID="Repeater7" runat="server" OnItemDataBound="Repeater7_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Teacher.aspx?id=<%#Eval("UserID") %>">
                                    <h2>
                                    <asp:Label ID="lblName7" runat="server" Text='<%#Eval("UserID") %>'></asp:Label></h2>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                        <h2>助理工程师</h2>
                        <ul class="list download">
                        <asp:Repeater ID="Repeater8" runat="server" OnItemDataBound="Repeater8_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Teacher.aspx?id=<%#Eval("UserID") %>">
                                    <h2>
                                    <asp:Label ID="lblName8" runat="server" Text='<%#Eval("UserID") %>'></asp:Label></h2>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                        <h2>助理实验师</h2>
                        <ul class="list download">
                        <asp:Repeater ID="Repeater9" runat="server" OnItemDataBound="Repeater9_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Teacher.aspx?id=<%#Eval("UserID") %>">
                                    <h2>
                                    <asp:Label ID="lblName9" runat="server" Text='<%#Eval("UserID") %>'></asp:Label></h2>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                        </asp:panel>
        </div>
        </asp:panel>
                <asp:panel id="panel2" runat="server">
                    <div class="list-wrapper">
                    <ul class="list download">
                        <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Teacher.aspx?id=<%#Eval("UserID") %>">
                                    <h2>
                                    <asp:Label ID="lblName2" runat="server" Text='<%#Eval("UserID") %>'></asp:Label></h2>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                </div>
                </asp:panel>
                <asp:panel id="panel3" runat="server">
                    <div class="list-wrapper">
                    <ul class="list download">
                        <asp:Repeater ID="Repeater3" runat="server" OnItemDataBound="Repeater3_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Teacher.aspx?id=<%#Eval("UserID") %>">
                                    <h2>
                                    <asp:Label ID="lblName3" runat="server" Text='<%#Eval("UserID") %>'></asp:Label></h2>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                </div>
                </asp:panel>
                <asp:panel id="panel4" runat="server">
                    <div class="list-wrapper">
                    <ul class="list download">
                        <asp:Repeater ID="Repeater10" runat="server" OnItemDataBound="Repeater10_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <a href="Teacher.aspx?id=<%#Eval("UserID") %>">
                                    <h2>
                                    <asp:Label ID="lblName10" runat="server" Text='<%#Eval("UserID") %>'></asp:Label></h2>
                                </a>
                            </li>
                        </ItemTemplate>
                     </asp:Repeater>
                    </ul>
                </div>
                </asp:panel>
            </section>
            <div class="clear"></div>
        </div>
    </form>
</asp:Content>


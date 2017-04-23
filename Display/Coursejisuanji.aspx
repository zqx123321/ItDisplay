<%@ Page Title="" Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="Coursejisuanji.aspx.cs" Inherits="Display_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>课程介绍</title>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <h1>课程介绍</h1>
        <nav class="nav">
            <ul>
                <li><a href="CourseOutline.aspx">人才培养方案</a></li>
                <li><a href="Coursewuli.aspx">物理系</a></li>
                <li><a href="Coursedianzi.aspx">电子工程系</a></li>
                <li><a href="Coursejisuanji.aspx">计算机科学与技术系</a></li>
                <li><a href="Coursehaiji.aspx">海洋技术系</a></li>
            </ul>
        </nav>
    </header>
    <section class="department">
        <!-- 一个section为一个系 -->
        <h2>计算机科学与技术系</h2>
        <nav>
            <ul class="department-nav">
                <li class="active">计算机科学与技术</li>
                
            </ul>
        </nav>
        <div class="specialty active">
           
            <asp:Repeater ID="Repeater1" runat="server" ItemType="Course">
                <HeaderTemplate>
                    <ul>
                </HeaderTemplate>
                  <ItemTemplate>
                    <li class="course">
                        <h3><%#Item.CourseName %></h3>
                        <div class="course-con">
                            <!-- 这里是课程的详细内容 -->

                            <%--<div class="title"><%#Item.CourseName %>
                                </div>--%>
                            <div class="txt-line">
                                <div class="title">开课院系:</div>
                                <div>
                                    <%#Item.Department %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                <div class="title">课程编号:</div>
                                <div>
                                    <%#Item.Number %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                <div class="title">课程英文名称:</div>
                                <div>
                                    <%#Item.EnglishName %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                <div class="title">课程总学时:</div>
                                <div>
                                    <%#Item.CourseHours %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                <div class="title">课程总学分:</div>
                                <div>
                                    <%#Item.CourseMark %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                    <div class="title">含实验或实践学时:</div>
                                    <div>
                                        <%#Item.ExperimentHours??0 %><br />
                                    </div>
                                </div>
                                <div class="txt-line">
                                    <div class="title">含实验或实践学分:</div>
                                    <div><%#Item.ExperimentMark??0 %></div>
                                    <br />
                                </div>
                            <asp:Panel ID="experiment" runat="server" Visible='<%#Item.Type == 3 ? true : false %>'>
                               

                                    <div class="txt-line">
                                        <div class="title">周学时:</div>
                                        <div>
                                            <%#Item.WeekHours %><br />
                                        </div>
                                    </div>
                                
                                <div class="txt-line">
                                    <div class="title">学期安排:</div>
                                    <div>
                                        <%#Item.TermArrange %><br />
                                    </div>
                                </div>
                                <div class="txt-line">
                                    <div class="title">实验、实习场所:</div>
                                    <div>
                                        <%#Item.ExperimentPlace %><br />
                                    </div>
                                </div>
                               <div class="txt-line">
                                    <div class="title">实验教学目标:</div>
                                    <div>
                                        <%#Item.ExperimentObject %><br />
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="type12" runat="server" Visible='<%#Item.Type == 2 ? true : false %>'>
                                
                                <div class="txt-line">
                                    <div class="title">实验环节教学目标与基本要求:</div>
                                    <div>
                                        <%#Item.ExperimentPartObject%><br />
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel1" runat="server" Visible='<%#Item.Type != 1 ? true : false %>'>
                                <div class="txt-line">
                                    <div class="title">实验指导书:</div>
                                    <div>
                                        <%#Item.ExperimentGuideBook %><br />
                                    </div>
                                </div>
                            </asp:Panel>
                            <div class="txt-line">
                                <div class="title">推荐使用教材:</div>
                                <div>
                                    <%#Item.Textbook %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                <div class="title">推荐使用教材编者:</div>
                                <div>
                                    <%#Item.TextbookAuthor %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                <div class="title">推荐使用教材出版社:</div>
                                <div>
                                    <%#Item.TextbookPublisher %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                <div class="title">推荐使用教材出版时间及版次:</div>
                                <div>
                                    <%#Item.TextbookVersion %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                <div class="title">课程教学目标与基本要求:</div>
                                <div>
                                    <%#Item.CourseObject %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                <div class="title">考试形式:</div>
                                <div>
                                    <%#Item.ExamType %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                <div class="title">参考书:</div>
                                <div>
                                    <%#Item.Reference %><br />
                                </div>
                            </div>
                            <div class="txt-line">
                                <div class="title">了解更多:</div>
                                <div>
                                    <a href="<%#Item.ContentAndTimeArrange %>" target="_blank">点击下载</a><br />
                                </div>
                            </div>


                        </div>
                    </li>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </asp:Repeater>
        </div>
       

    </section>
    <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="js/script.js" type="text/javascript"></script>
    
</asp:Content>




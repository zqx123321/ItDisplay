<%@ Page Title="" Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="Course.aspx.cs" Inherits="Display_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>信息科学与工程学院</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
   <body class="course">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
		<aside class="page-nav" id="aside">
			<h1>课程介绍</h1>
			<hr />
			<ul>
                <li><a href="TeachPlan.aspx">培养计划</a></li>
                <li><a href="Course.aspx?depart=物理系">物理系</a></li>
                <li><a href="Course.aspx?depart=电子工程系">电子工程系</a></li>
                <li><a href="Course.aspx?depart=计算机科学与技术系">计算机科学与技术系</a></li>
                <li><a href="Course.aspx?depart=海洋技术系">海洋技术系</a></li>
			</ul>
		</aside>
		<section class="container right">
			<h1><asp:label runat="server" ID="LTitle"></asp:label></h1>
			<hr />
			<div class="tag-wrapper">
				<div class="tag">
					<nav>
						<ul class="tag-nav">
                            <li class="active">
                    <asp:label ID="MenuFirstItem" runat="server" text="Label"></asp:label>
                </li>
                <asp:repeater ID="menu" runat="server">
                     <ItemTemplate>
                    <li><%#Container.DataItem%></li>
                     </ItemTemplate>
                </asp:repeater>
							
						</ul>
					</nav>
					<div class="tag-con active">
						<ul class="flod-list">
                         <asp:repeater ID="Repeater1" runat="server" ItemType="Course">   
                            <ItemTemplate>
							<li>
								<h2><%#Item.CourseName %></h2>
								<div class="flod-list-con">
									<!-- 这里是课程的详细内容 -->
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
                                    <a href="<%#Item.ContentAndTimeArrange %>"  target="_blank">点击下载</a><br />
                                </div>
                            </div>
								</div>
							</li></ItemTemplate></asp:repeater>
						</ul>
					</div>
                
					<div class="tag-con">
						<ul class="flod-list">
                         <asp:repeater runat="server" ID="Repeater2" ItemType="Course">   
                            <ItemTemplate>
							<li>
								<h2><%#Item.CourseName %></h2>
								<div class="flod-list-con">
									<!-- 这里是课程的详细内容 -->
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
                            <asp:Panel ID="Panel2" runat="server" Visible='<%#Item.Type == 3 ? true : false %>'>
                               

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

                            <asp:Panel ID="Panel3" runat="server" Visible='<%#Item.Type == 2 ? true : false %>'>
                                
                                <div class="txt-line">
                                    <div class="title">实验环节教学目标与基本要求:</div>
                                    <div>
                                        <%#Item.ExperimentPartObject%><br />
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel4" runat="server" Visible='<%#Item.Type != 1 ? true : false %>'>
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
                                    <a href="<%#Item.ContentAndTimeArrange %>"  target="_blank">点击下载</a><br />
                                </div>
                            </div>
								</div>
							</li></ItemTemplate></asp:repeater>
						</ul>
					</div>
                
                    <div class="tag-con">
						<ul class="flod-list">
                         <asp:repeater runat="server" ID="Repeater3" ItemType="Course">   
                            <ItemTemplate>
							<li>
								<h2><%#Item.CourseName %></h2>
								<div class="flod-list-con">
									<!-- 这里是课程的详细内容 -->
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
                            <asp:Panel ID="Panel5" runat="server" Visible='<%#Item.Type == 3 ? true : false %>'>
                               

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

                            <asp:Panel ID="Panel6" runat="server" Visible='<%#Item.Type == 2 ? true : false %>'>
                                
                                <div class="txt-line">
                                    <div class="title">实验环节教学目标与基本要求:</div>
                                    <div>
                                        <%#Item.ExperimentPartObject%><br />
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel7" runat="server" Visible='<%#Item.Type != 1 ? true : false %>'>
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
                                    <a href="<%#Item.ContentAndTimeArrange %>"  target="_blank">点击下载</a><br />
                                </div>
                            </div>
								</div>
							</li></ItemTemplate></asp:repeater>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<div class="clear"></div>
	</div>
  
</asp:Content>


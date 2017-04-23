<%@ Page Language="C#" MasterPageFile="~/Display/Display.master" AutoEventWireup="true" CodeFile="StuOrg.aspx.cs" Inherits="Display_StuOrg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" runat="server"><body class="organization"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


	<section class="container">
		<h1>
            <asp:label runat="server" ID="label1" text="Label"></asp:label>
           </h1>
		<hr />
		<div class="list-wrapper">
			<ul class="blist">
                <asp:Repeater ID="Repeater1" runat="server" ItemType="ITGroup">
                    <ItemTemplate>
                        <li>
					<a href="<%#string.IsNullOrEmpty( Item.Link)?"StuOrg-con.aspx?name="+Item.GroupName:Item.Link %>">
						<img src="<%#Item.Img %>" alt="<%#Item.GroupName %>" title="<%#Item.GroupName %>" />
						<h2><%#Item.GroupName %></h2>
					</a>
				</li>
                    </ItemTemplate>
                </asp:Repeater>
				<%--<li>
					<a href="#">
						<img src="images/banner2.jpg" alt="组织名字" title="组织名字" />
						<h2>这里是组织的名字。</h2>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="images/banner2.jpg" alt="组织名字" title="组织名字" />
						<h2>这里是组织的名字。</h2>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="images/banner2.jpg" alt="组织名字" title="组织名字" />
						<h2>这里是组织的名字。</h2>
					</a>
				</li>--%>
			</ul>
		</div>
	</section>
	</asp:Content>
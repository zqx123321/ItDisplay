﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Manage_Login" %>
<!doctype html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title>信息科学与工程学院</title>
	<link href="css/manage.css" rel="stylesheet" />
    <!-- enable HTML5 elements in IE -->
    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href="../css/ie.css" />
    <script type="text/javascript" src="../js/html5.js"></script>
    <![endif]-->
</head>

<body>
	<div class="login">
		<!--[if lt IE 8]>
	    <div class="ie-login">
	    	请使用以下任意一项浏览器登录！
	    	<ul>
	    		<li>IE8+ 浏览器</li>
	    		<li>谷歌，火狐等现代浏览器</li>
	    		<li>混合浏览器（360，搜狗，猎豹...）<br />的极速模式</li>
	    	</ul>
	    </div>
	    <![endif]-->
		<h1>信息科学与工程学院管理登陆</h1>
		<form id="form1" runat="server">
			<p>
				<asp:TextBox ID="txtID" runat="server" MaxLength="16" placeholder="请输入用户名"></asp:TextBox>
				<asp:RequiredFieldValidator ID="valrName" runat="server" ErrorMessage="学号/工号不能为空" ControlToValidate="txtID" ForeColor="Red" ValidationGroup="valid"></asp:RequiredFieldValidator>
				<!--input type="text" value="" placeholder="请输入用户名" /-->
			</p>
			<p>
				<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="16" placeholder="请输入密码"></asp:TextBox>
				<asp:RequiredFieldValidator ID="valrPassword" runat="server" ErrorMessage="密码不能为空" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="valid"></asp:RequiredFieldValidator>
				<!--input type="password" placeholder="请输入密码" /-->
			</p>
			<p class="login-btn">
				<asp:Button ID="BtnLogin" runat="server" Text="登录" CausesValidation="true" OnClick="BtnLogin_Click" ValidationGroup="valid"/>
				<asp:Button ID="BtnReturn" runat="server" Text="返回首页" PostBackUrl="~/Default.aspx" />
			</p>
		</form>
	</div>
	<canvas class="login-bg" id="bg">
	</canvas>
	<script type="text/javascript">
		var bg = document.getElementById("bg");
		var ctx = bg.getContext("2d");
		
		//making the canvas full screen
		bg.height = window.innerHeight;
		bg.width = window.innerWidth;
		
		//chinese characters - taken from the unicode charset
		var chinese = "01";
		//converting the string into an array of single characters
		chinese = chinese.split("");
		
		var font_size = 14;
		var line_height = 18;
		var columns = bg.width/(font_size + line_height); //number of columns for the rain
		//an array of drops - one per column
		var drops = [];
		//x below is the x coordinate
		//1 = y co-ordinate of the drop(same for every drop initially)
		for(var x = 0; x < columns; x++) {
			drops[x] = 1; 
		}
		
		var loop = 0;
		//drawing the characters
		function draw()
		{
			loop++;
			if (loop > 100) {
				//清空背景
				ctx.fillStyle = "rgba(245, 249, 250, .5)";
				//ctx.fillStyle = "rgba(0, 0, 0, .5)";
				ctx.fillRect(0, 0, bg.width, bg.height);
				loop = 0;
			} else {
				//Black BG for the canvas
				//translucent BG to show trail
				ctx.fillStyle = "rgba(245, 249, 250, .12)"; //字符消失速度
				//ctx.fillStyle = "rgba(0, 0, 0, .12)";
				ctx.fillRect(0, 0, bg.width, bg.height);
			}
			
			ctx.fillStyle = "#9ba0a3"; //green text
			//ctx.fillStyle = "#2ECC71";
			ctx.font = font_size + "px arial";
			//looping over drops
			var dropsL = drops.length
			for(var i = 0; i < dropsL; i++)
			{
				//a random chinese character to print
				var text = chinese[Math.floor(Math.random()*chinese.length)];
				//x = i*font_size, y = value of drops[i]*font_size
				ctx.fillText(text, i*(font_size + line_height), drops[i]*(font_size + 4));
				
				//sending the drop back to the top randomly after it has crossed the screen
				//adding a randomness to the reset to make the drops scattered on the Y axis
				if(drops[i]*font_size > bg.height && Math.random() > 0.995) //密集程度，越大越稀疏
					drops[i] = 0;
				
				//incrementing Y coordinate
				drops[i]++;
			}
		}
		setInterval(draw, 40);  //重复绘制，下降速度
	</script>
</body>
</html>

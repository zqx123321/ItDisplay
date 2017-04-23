// JavaScript Document
// Author: Maplor
// Date: 2015-06-11
// Changes(每次修改+1): 29
(function() {
	$.extend({
		focus: function(slid) {
			var $slid = $(slid);
			if ($slid.length > 0) {
				var sWidth = $slid.width(); //获取焦点图的宽度（显示面积）
				var $li = $slid.find("ul li");
				var len = $li.length; //获取焦点图个数
				var index = 0;
				var picTimer;
				var supportTrans = false;
				if (("MozTransform" in document.documentElement.style || "WebkitTransform" in document.documentElement.style || "OTransform" in document.documentElement.style || "transform" in document.documentElement.style) && ("WebkitTransition" in document.documentElement.style || "MozTransition" in document.documentElement.style || "OTransition" in document.documentElement.style || "transition" in document.documentElement.style)) {
					supportTrans = true;//支持CSS3 transform 和 transition 则为true
				}
				
				//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
				//var btn = "<div class='btnBg'></div>";  //带半透明条
				var btn = ""; //"<div class='btn'" +"style='margin-left:-"+ (28*len+20)/2 +"px'></div>";  //不带半透明条
	//			for(var i=0; i < len; i++) {
	//				var ii = i+1;
	//				//btn += "<span>"+ii+"</span>"; //带数字
	//				btn += "<span>" + "</span>"; //不带数字
	//			}
				btn += "<div class='preNext pre'><div class='pre-btn'></div></div><div class='preNext next'><div class='next-btn'></div></div>";
				$slid.append(btn);
				//$slid.find("div.btnBg").css("opacity",0.5);
			
				//为小按钮添加鼠标滑入事件，以显示相应的内容
				$(slid+" div.btn span").css("opacity",0.8).mouseenter(function() {
					index = $(slid+" .btn span").index(this);
					showPics(index);
				}).eq(0).trigger("mouseenter");
			
				//上一页、下一页按钮透明度处理
				$(slid+" .preNext").css("opacity",0.6).hover(function() {
					$(this).stop(true,false).animate({"opacity":"0.8"},200);
				},function() {
					$(this).stop(true,false).animate({"opacity":"0.6"},200);
				});
			
				//上一页按钮
				$(slid+" .pre").click(function() {
					index -= 1;
					if(index == -1) {index = len - 1;}
					showPics(index);
				});
			
				//下一页按钮
				$(slid+" .next").click(function() {
					index += 1;
					if(index == len) {index = 0;}
					showPics(index);
				});
			
				//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
				//$(slid+" ul").css("width",sWidth * (len));
				
				//滚动图片作居中处理
				var showH = $li.height();
				$li.find("img").each(function (i, e) {
					$(this).css("margin-top", (showH - $(this).height())/2);
				});
				
				//当页面宽度改变时，相应改变数据，实现响应式
				$(window).resize(function(e) {
					sWidth = $slid.width();
					$li.find("img").each(function (i, e) {
						$(this).css("margin-top", (showH - $(this).height())/2);
					});
				});
		
				//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
				$slid.hover(function() {
					clearInterval(picTimer);
				},function() {
					picTimer = setInterval(function() {
						index += 1;
						if(index == len) {index = 0;}
						showPics(index);
					},5000); //此4000代表自动播放的间隔，单位：毫秒
				}).trigger("mouseleave");
				
				//显示图片函数，根据接收的index值显示相应的内容
				function showPics(index) { //普通切换
					var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
					if (supportTrans) {
						$(slid+" ul").stop(true,false).css({
							"WebkitTransform": "translate(" + nowLeft + "px,0)",
							"MozTransform": "translate(" + nowLeft + "px,0)",
							"OTransform": "translate(" + nowLeft + "px,0)",
							"transform": "translate(" + nowLeft + "px,0)"
						}); //通过transform调整ul元素滚动到计算出的position
					} else{
						$(slid+" ul").stop(true,false).animate({"left":nowLeft},500); //通过animate()调整ul元素滚动到计算出的position
					}
//					$(slid+" .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
//					$(slid+" .btn span").stop(true,false).animate({"opacity":"0.8"},300).eq(index).stop(true,false).animate({"opacity":"1"},300); //为当前的按钮切换到选中的效果
				}
			}
		},
		
		newFocus: function(slide, hasBtn, hasNum, direction, autoTime) {
			var $slide = $(slide);
			if ($slide.length <= 0) {
				return false;
			}
			//配置参数
			hasBtn = hasBtn || false;//是否生成标记导航块
			hasNum = hasNum || false;//标记导航块是否生成数字
			direction = direction || "left";//滚动方向
			autoTime = autoTime || 5000;//自动播放间隔时间
			
			//内部参数
			var $li = $slide.find("li"),//图片块
				num = $li.length,//图片个数
				slideWidth = $li.eq(0).width(),//每次移动宽度
				index = 0,//位置标识
				dom = "",//需要插入的dom代码
				imgTimer = null,//计时器
				isScrolling = false,//是否正在移动
				supportTrans = false;//硬件加速支持标识
			if (("MozTransform" in document.documentElement.style || "WebkitTransform" in document.documentElement.style || "OTransform" in document.documentElement.style || "transform" in document.documentElement.style) && ("WebkitTransition" in document.documentElement.style || "MozTransition" in document.documentElement.style || "OTransition" in document.documentElement.style || "transition" in document.documentElement.style)) {
				supportTrans = true;//支持CSS3 transform 和 transition 则为true
			}
			
			if( num < 3 ){
				return false; //图片小于三张不执行
			}
			//dom操作
//			if (hasBtn) {
//				dom += "<div class='btn'" +"style='margin-left:-"+ (28*num+20)/2 +"px'>";
//				for(var i=0; i < len; i++) {
//					if (hasNum) {
//						dom += "<span>" + ( i + 1 ) + "</span>"; //带数字
//					} else {
//						dom += "<span></span>"; //不带数字
//					}
//				}
//				dom += "</div>";
//			}
			dom += "<div class='preNext pre'><div class='pre-btn'></div></div><div class='preNext next'><div class='next-btn'></div></div>";
			$slide.append(dom);
			
			//事件绑定
//			if (hasBtn) {
//				//为小按钮添加鼠标滑入事件，以显示相应的内容
//				$slide.find("div.btn span").mouseenter(function() {
//					index = $(this).index();
//					showPics(index);
//				}).eq(0).trigger("mouseenter");
//			}
			//上一页、下一页按钮透明度处理
			$slide.find(".preNext").css("opacity",0.6).hover(function() {
				$(this).stop(true,false).animate({"opacity":"0.8"},200);
			},function() {
				$(this).stop(true,false).animate({"opacity":"0.6"},200);
			});
			//上一页按钮点击事件
			$slide.on("click", ".pre", function (e) {
				if (!isScrolling) {
					slideLast();
				}
				return false;
			});
			//下一页按钮点击事件
			$slide.on("click", ".next", function (e) {
				if (!isScrolling) {
					slideNext();
				}
				return false;
			});
			//滚动图片作居中处理
			var showH = $li.height();
			$li.find("img").each(function (i, e) {
				$(this).css("margin-top", (showH - $(this).height())/2);
			});
			//当页面宽度改变时，相应改变数据，实现响应式
			$(window).resize(function(e) {
				$li.find("img").each(function (i, e) {
					$(this).css("margin-top", (showH - $(this).height())/2);
				});
			});
			//设置定时器 - 鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
			$slide.hover(function() {
				clearInterval(imgTimer);
			},function() {
				imgTimer = setInterval(slideNext, autoTime);
			}).trigger("mouseleave");
			
			//初始化图片位置
			for (var i = 0; i < num; i++) {
				if (i == num - 1) {
					$li.eq(i).css("left", -slideWidth);
				} else{
					$li.eq(i).css("left", i * slideWidth);
				}
			}
			
			//图片滚动
			function slideNext () {
				isScrolling = true;//开始移动
				var slideConPosition = 0,
					slideCon = null;
				for (var i = 0; i < num; i++) {
					var slideCon = $li.eq(i);
					slideConPosition = parseInt(slideCon.css("left"));
					if (slideConPosition == -slideWidth) {//判断是第一个图片
						slideCon.animate({left:(slideConPosition - slideWidth)}, "slow", function () {
							$(this).css("left", slideWidth * (num - 2));//回到最后一个
							isScrolling = false;//移动结束
						});
					} else{
						slideCon.animate({left:(slideConPosition - slideWidth)}, "slow");//向左移动一格
					}
				}
			}
			function slideLast () {
				isScrolling = true;//开始移动
				var slideConPosition = 0,
					slideCon = null;
				for (var i = 0; i < num; i++) {
					slideCon = $li.eq(i);
					slideConPosition = parseInt(slideCon.css("left"));
					if (slideConPosition == slideWidth * (num - 2)) {//判断是最后个图片
						slideCon.css("left", -slideWidth)//回到第一个
					} else{
						slideCon.animate({left:slideConPosition + slideWidth}, "slow", function () {//向左移动一格
							isScrolling = false;//移动结束
						})
					}
				}
			}
		},
		
		cardImg: function (card) {
			var $card = $(card);
			if ($card.length > 0) {
				$card.find("div.card-img").each(function (i, e) {
					var showH = $(this).height();
					if (showH > 1) {
						var imgH = $(this).children("img").height();
						$(this).children("img").css("margin-top", (showH - imgH)/2);
					} else{
						$(this).hide();
					}
				})
				$(window).resize(function() {
					$card.find("div.card-img").each(function (i, e) {
						var showH = $(this).height();
						if (showH > 1) {
							var imgH = $(this).children("img").height();
							$(this).children("img").css("margin-top", (showH - imgH)/2);
						} else{
							$(this).hide();
						}
					})
				});
			}
		},
		
		manNav: function (nav) {
			var $manNav = $(nav);
			$manNav.children(".second").children("a").on("click", function () {
				$(this).next("ul").slideToggle();
				return false;
			})
		}
	});
}(jQuery));

(function () {
	//首页正在加载提示
	var loadBg = document.getElementById("load-bg");
	if (!!loadBg) {
		var t = 0;
		var isReady = false;
		var timer = setInterval(function () {
			t += 1;
			if (isReady && (t <= 3)) {
				$(loadBg).fadeOut("200");//加载完成，隐藏遮罩
				clearInterval(timer);
			} else if (isReady && (t > 9)) {
				$(loadBg).fadeOut("400");
				clearInterval(timer);
			} else if (t == 2) {
				document.getElementById("load").style.display = "block";
			}else if(t>30){
				$(loadBg).fadeOut("200");
				clearInterval(timer);
			}
		}, 100);
		window.onload = function () {
			$.newFocus("#focus");
			$.cardImg(".card");
			isReady = true;
		}
	}
}());

$(document).ready(function () {
	// 绑定二级菜单功能
	$("#navigation").find("li.second").hover(function () {
		$(this).children("ul").stop(true,false).slideDown("fast");
	},
	function () {
		$(this).children("ul").stop(true,false).slideUp("fast");
	});

	//绑定侧边栏功能
	var $aside = $("#aside");
	if ($aside.length > 0) {
		//侧边栏固定位置
		var top = $aside.offset().top;
		$(window).scroll(function() {
			if ($(window).scrollTop() > top) {
				$aside.addClass("fixed");
			} else if ( ($(window).scrollTop() < top) && ($aside.hasClass("fixed")) ) {
				$aside.removeClass("fixed");
			}
		});
		
		//显示所在位置
		var urlRequest = document.location.search;
		if (urlRequest) {
			$aside.find("a").each(function (i, e) {
				if ($(this).attr("href").split("?")[1] == decodeURI(urlRequest).substr(1)) {
					$(this).parent().addClass("active");
				}
			})
		}
	}
	
	//绑定标签页切换功能
	var $tag = $(".tag");
	if($tag.length > 0) {
		$tag.each(function (i,e) {
			$(e).find("ul.tag-nav").children("li").on("click", function () {
				$(this).addClass("active").siblings().removeClass("active");
				var index = $(this).index();
				var ele = $(e).children("div.tag-con")[index];
				$(ele).addClass("active").siblings("div").removeClass("active");
			})
		})
	}
	
	//绑定折叠列表功能
	var $flodList = $(".flod-list");
	if ($flodList.length > 0) {
		$flodList.each(function (i,e) {
			$(e).find("h2").on("click", function () {
				$(this).toggleClass("active").next().slideToggle(400);
			})
		})
		
	}
	
	//绑定回到顶部功能
	var topBtn = document.getElementById('to-top');
	if (!!topBtn) {
		var timer = null;
		var isTop = true;
		//获取页面可视区高度
		var cHeight = document.documentElement.clientHeight;
		//滚动时触发
		window.onscroll = function() {
			//获得已滚动距离
			var top = document.documentElement.scrollTop || document.body.scrollTop;
			if (top >= cHeight) {
				topBtn.style.display = 'block';
			} else {
				topBtn.style.display = 'none';
			}
			
			if (!isTop) {
				clearInterval(timer);
			}
			isTop = false;
		}
		topBtn.onclick = function() {
			//设置定时器
			timer = setInterval(function(){
				//获得已滚动距离
				var top = document.documentElement.scrollTop || document.body.scrollTop;
				//每次滚动的距离
				var speed = Math.floor(-top / 6);
				document.documentElement.scrollTop = document.body.scrollTop = top + speed;
				
				isTop = true;
				
				if (top == 0) {
					clearInterval(timer);
				}
			}, 30);
			return false;
		}
	}
	
	
	try {
		if (window.console && window.console.log) {
			console.log("%c全心学技术，用心去生活 —— 爱特工作室", "color:red");
			console.log("本网站由 爱特工作室 设计制作\n中国海洋大学 信息学院北楼B505，学生实践中心\n介绍视频：http://v.youku.com/v_show/id_XNzYyMTU2OTg0.html");
			console.log("网站意见反馈：maplor@163.com");
		}
	} catch(e) {}

})
//	$.fn.hoverDelay = function(options){
//      var defaults = {
//          hoverDuring: 100,
//          outDuring: 100,
//          hoverEvent: function(){
//              $.noop();
//          },
//          outEvent: function(){
//              $.noop();    
//          }
//      };
//      var sets = $.extend(defaults,options || {});
//      var hoverTimer, outTimer;
//      return $(this).each(function(){
//          $(this).hover(function(){
//              clearTimeout(outTimer);
//              hoverTimer = setTimeout(sets.hoverEvent, sets.hoverDuring);
//          },function(){
//              clearTimeout(hoverTimer);
//              outTimer = setTimeout(sets.outEvent, sets.outDuring);
//          });    
//      });
//  }

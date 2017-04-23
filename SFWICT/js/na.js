// JavaScript Document
function navPosition(){
	var leftPosition = $(".content").offset();
	$("#fixed").css("left",leftPosition.left)
	
};
$(document).ready(navPosition);
$(window).resize(navPosition);
$(window).scroll(function(){
	if($(window).scrollTop()>= 125){    //垂直滚动条钓offset 大于90时。
	$("#fixed").css({
		"top":"0",       //修改相关div样式
	});}
	else{    //垂直滚动条钓offset 大于90时。
	$("#fixed").css({
		"top":125-$(window).scrollTop() + 10 +'px',       //修改相关div样式
	});
	}
});
function lislide(list, prevOrNext) {
	var arrayListItemSize = new Array($(list).find("li").map(function(e) {
		return $(this).height()+ 10;
	}).get());
    arrayListItemSize[0].push("-1");
	var arrayListItemPosition = new Array();
	arrayListItemPosition[0] = 0;
	var len = $(list).children('li').length;
	var flag = $(list).children('li').first();
	var position = 1*($(flag).css('margin-top').split("p")[0]);


    for (var i = 1; i < len; i++) {
        arrayListItemPosition[i] = arrayListItemPosition[i-1] + arrayListItemSize[0][i-1];
        if( (prevOrNext == 1)&&(arrayListItemPosition[i-1] == -position) ) {
            $(flag).animate({marginTop: -arrayListItemPosition[i]}, 600);
        } else if( (prevOrNext == 0)&&(arrayListItemPosition[i] == -position) ) {
            $(flag).animate({marginTop: -arrayListItemPosition[i-1]}, 600);
        }
    }
}


$(".pagelist").hover(function(){
		clearInterval(stoplast);
	},function() {
		stoplast = setInterval(function() {
			lislide($(".pagelist"), 1);;
		},3000);
}).trigger("mouseleave");
	
	
$('#fixed a').each(function () {
	var href = $(this).attr('href');
	if (location.pathname.slice(-href.length) === href) {
		$(this).addClass('current')
	}
})

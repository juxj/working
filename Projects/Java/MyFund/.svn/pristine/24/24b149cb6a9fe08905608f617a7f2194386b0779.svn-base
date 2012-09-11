//通用选项卡
$(document).ready(function() {
    $('.xxkbox:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu ul li');
    sb.hover(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox').eq(nb).show().siblings().hide();
    });
});
//通用选项卡2
$(document).ready(function() {
    $('.xxkbox2:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first2').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu2 ul li');
    sb.click(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox2').eq(nb).show().siblings().hide();
    });
});
//文本框触发焦点效果
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
});
function Scroll(ul, delay, speed, lineHeight) {
    var slideBox = (typeof ul == 'string') ? document.getElementById(ul) : ul;
    var delay = delay || 1000;
    var speed = speed || 20;
    var lineHeight = lineHeight || 24;
    var tid = null,
    pause = false;
    var start = function() {
        tid = setInterval(slide, speed);
    };
    var slide = function() {
        if (pause) return;
        slideBox.scrollTop += 2;
        if (slideBox.scrollTop % lineHeight == 0) {
            clearInterval(tid);
            slideBox.appendChild(slideBox.getElementsByTagName('li')[0]);
            slideBox.scrollTop = 0;
            setTimeout(start, delay);
        }
    };
    slideBox.onmouseover = function() {
        pause = true;
    };
    slideBox.onmouseout = function() {
        pause = false;
    };
    setTimeout(start, 2000);
}
function changeProvince(provinceid,cityid,districtid){
	$("#"+districtid).html("<option value='0'>--请选择--</option>");
	if($("#"+provinceid).val()=='0'){
		$("#"+cityid).html("<option value='0'>--请选择--</option>");
	}else{
		$.post("/DataCommon!findCity.act",{provinceId:$("#"+provinceid).val()},function(a){
			$("#"+cityid).html(a);
			changeCity(cityid,districtid);
		});
	}
}
function changeCity(cityid,districtid){
	if($("#"+cityid).val()=='0'){
		$("#"+districtid).html("<option value='0'>--请选择--</option>");
	}else{
		$.post("/DataCommon!findDistrict.act",{cityId:$("#"+cityid).val()},function(a){
			$("#"+districtid).html(a);
		});
	}
}
function changeindustry(industryParent,industry){
	if($("#"+industryParent).val()=='0'){
		$("#"+industry).html("<option value='0'>--请选择--</option>");
		$("#"+industry).hide();
	}else{
		$.post("/DataCommon!findIndustry.act",{industryId:$("#"+industryParent).val()},function(a){
			$("#"+industry).show();
			$("#"+industry).html(a);
		});
	}
}
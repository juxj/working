<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
$(function() {
    var sb = $('.tab_menu ul li');
    sb.hover(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkboxmenu').eq(nb).show().siblings().hide();
    });
});

function loadmenu(num){
	$('.tab_menu ul li').eq(num).addClass('hover').siblings().removeClass();
	$('.xxkboxmenu').eq(num).show().siblings().hide();
}
</script>
<%
String mid = request.getParameter("mparamid");
if(mid != null && !mid.trim().equals("")){
	session.setAttribute("mparamid", mid);
}
 %>
<div class="container_960 top">
	<div class="fl logo">
    	<h1><a  href="/user/UserAction.act">中国资金网</a></h1>
	</div>
	<div class="fr logo_r">
		<div class="hr_10"> &nbsp; </div>
		<div class="user_menu">${session._user.realname} 您好，欢迎来到中国资金网！ | <a href="/Account!logout.act"> 退出</a>| <a href="/Index.act"> 网站首页</a></div>
		<div class="hr_10"> &nbsp; </div>
		<div class="pic_logo_r fr"><img src="/images/logo_right_pic.jpg"/></div>
	</div>
	<div class="clear"> &nbsp; </div>
</div>
<s:set name="t2" value="0"/><s:set name="t3" value="0"/><s:set name="t4" value="0"/><s:set name="t5" value="0"/>
<div class="container_960">
	<s:action name="menu" namespace="/user" executeResult="true" ignoreContextParams="true"/>
</div>
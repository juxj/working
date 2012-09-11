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
//alert(11);
	//clsObj.show().siblings().hide();
	$('.tab_menu ul li').eq(num).addClass('hover').siblings().removeClass();
	$('.xxkboxmenu').eq(num).show().siblings().hide();
	//alert($('.xxkbox').eq(num).html());
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
<div class="tab_menu user_nav">
	<ul>
		<s:iterator value="@com.zj198.util.Constants@MENU_MAP[#session._user.userTypeGroup]" id="menu">
		<s:if test="#menu.parentid==0">
			<li><a href="${menu.action}">${menu.menuname }</a></li>
			<s:if test="#menu.id==2"><s:set name="t2" value="1"/></s:if><s:if test="#menu.id==3"><s:set name="t3" value="1"/></s:if><s:if test="#menu.id==4"><s:set name="t4" value="1"/></s:if><s:if test="#menu.id==5"><s:set name="t5" value="1"/></s:if>
		</s:if>
		</s:iterator>
    </ul>
</div>
<div class="clear"> &nbsp; </div>
<div class="user_subnav" style="position:relative;">
	<div class="xxkboxmenu">
		<s:if test="#session.mparamid == null">
			<script type="text/javascript">loadmenu(0);</script>
		</s:if>
	</div>
	
	<s:if test="#t2==1"><div class="xxkboxmenu" style="display:none">
	<s:iterator value="@com.zj198.util.Constants@MENU_MAP[#session._user.userTypeGroup]" id="submenu">
	<s:if test="#submenu.parentid==2">| 
		<s:if test="action.indexOf('?') > 0">
			<a href="${action}&mparamid=${id}" <s:if test="#session.mparamid == id">style="color:#97181d;"</s:if>>${menuname }</a>
		</s:if>
		<s:else>
			<a href="${action}?mparamid=${id}" <s:if test="#session.mparamid == id">style="color:#97181d;"</s:if>>${menuname }</a>
		</s:else>
		<s:if test="#session.mparamid == id">
			<script type="text/javascript">loadmenu(1);</script>
		</s:if>
	</s:if>
	</s:iterator>
	</div></s:if>
	
	<s:if test="#t3==1"><div class="xxkboxmenu" style="display:none">
	<s:iterator value="@com.zj198.util.Constants@MENU_MAP[#session._user.userTypeGroup]" id="submenu">
	<s:if test="#submenu.parentid==3">| 
		<s:if test="action.indexOf('?') > 0">
			<a href="${action}&mparamid=${id}" <s:if test="#session.mparamid == id">style="color:#97181d;"</s:if>>${menuname }</a>
		</s:if>
		<s:else>
			<a href="${action}?mparamid=${id}" <s:if test="#session.mparamid == id">style="color:#97181d;"</s:if>>${menuname }</a>
		</s:else>
		<s:if test="#session.mparamid == id">
			<script type="text/javascript">loadmenu(2);</script>
		</s:if>
	</s:if>
	</s:iterator>
	</div></s:if>
	
	<s:if test="#t4==1"><div class="xxkboxmenu" style="display:none">
	<s:iterator value="@com.zj198.util.Constants@MENU_MAP[#session._user.userTypeGroup]" id="submenu">
	<s:if test="#submenu.parentid==4">| 
		<s:if test="action.indexOf('?') > 0">
			<a href="${action}&mparamid=${id}" <s:if test="#session.mparamid == id">style="color:#97181d;"</s:if>>${menuname }</a>
		</s:if>
		<s:else>
			<a href="${action}?mparamid=${id}" <s:if test="#session.mparamid == id">style="color:#97181d;"</s:if>>${menuname }</a>
		</s:else>
		<s:if test="#session.mparamid == id">
			<script type="text/javascript">loadmenu(3);</script>
		</s:if>
	</s:if>
	</s:iterator>
	</div></s:if>
	
	<s:if test="#t5==1"><div class="xxkboxmenu" style="display:none">
	<s:iterator value="@com.zj198.util.Constants@MENU_MAP[#session._user.userTypeGroup]" id="submenu">
	<s:if test="#submenu.parentid==5">| 
		<s:if test="action.indexOf('?') > 0">
			<a href="${action}&mparamid=${id}" <s:if test="#session.mparamid == id">style="color:#97181d;"</s:if>>${menuname }</a>
		</s:if>
		<s:else>
			<a href="${action}?mparamid=${id}" <s:if test="#session.mparamid == id">style="color:#97181d;"</s:if>>${menuname }</a>
		</s:else>
		<s:if test="#session.mparamid == id">
			<script type="text/javascript">loadmenu(4);</script>
		</s:if>
	</s:if>
	</s:iterator>
	</div></s:if>
	
</div>
</div>
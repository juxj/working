<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<div class="tab_menu user_nav">
	<ul>
		<s:iterator value="menuList" id="menu">
		<s:if test="#menu.parentid==0">
			<li><a href="${menu.action}">${menu.menuname }</a></li>
			<s:if test="#menu.id==2"><s:set name="t2" value="1"/></s:if><s:if test="#menu.id==3"><s:set name="t3" value="1"/></s:if><s:if test="#menu.id==4"><s:set name="t4" value="1"/></s:if><s:if test="#menu.id==5"><s:set name="t5" value="1"/></s:if><s:if test="#menu.id==20"><s:set name="t6" value="1"/></s:if>
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
	<s:iterator value="menuList" id="submenu">
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
	<s:iterator value="menuList" id="submenu">
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
	<s:iterator value="menuList" id="submenu">
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
	<s:iterator value="menuList" id="submenu">
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
	
	<s:if test="#t6==1"><div class="xxkboxmenu" style="display:none">
	<s:iterator value="menuList" id="submenu">
	<s:if test="#submenu.parentid==20">| 
		<s:if test="action.indexOf('?') > 0">
			<a href="${action}&mparamid=${id}" <s:if test="#session.mparamid == id">style="color:#97181d;"</s:if>>${menuname }</a>
		</s:if>
		<s:else>
			<a href="${action}?mparamid=${id}" <s:if test="#session.mparamid == id">style="color:#97181d;"</s:if>>${menuname }</a>
		</s:else>
		<s:if test="#session.mparamid == id">
			<script type="text/javascript">loadmenu(5);</script>
		</s:if>
	</s:if>
	</s:iterator>
	</div></s:if>
	
</div>
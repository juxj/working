<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="pagination" align="center">
<s:iterator id="i" value="pager.pages">
	<s:if test="#i==-1"><span class="gap">&hellip;</span></s:if>
	<s:elseif test="#i==pager.currentPage"><span class="current"><font color="white">${i}</font></span></s:elseif>
	<s:else>
		<a href="javascript:void(0);" onclick="return toPage(${i},${pager.pageCount});">${i}</a>
	</s:else>
</s:iterator>
</div>
<style>
.pagination{padding:5px;float:right;}
.pagination a,.pagination a:link,.pagination a:visited{padding: 2px 8px 2px 8px;margin:2px;border:1px solid #aaaadd;text-decoration:none;color:#006699;}
.pagination a:hover,.pagination a:active {border: 1px solid #006699;color:#000;text-decoration:none;}
.pagination span.current{cursor:default;padding: 2px 8px 2px 8px;margin: 2px;border: 1px solid #006699;font-weight:bold;background-color:#006699;color:#FFF;}
</style>
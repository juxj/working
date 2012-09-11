<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  <div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
	 	<div class="block">
			<div class="block_head">
				<div class="bheadl"></div>
				<div class="bheadr"></div>
				<h2>新闻类型维护</h2>
				<ul>
					<li class="nobg"><a href="/admin/knwType!edit.act?typeId=">增加新类别</a></li>
					<li></li>
				</ul>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
					<thead>
						<tr>
							<th>名称</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator id="item" value="knwTypeList" status="st">
						<s:if test="#st.even==true">
							<tr id="item_${item.id}" class="odd">
						</s:if>
						<s:else>
							<tr id="item_${item.id}" class="even">
						</s:else>
							<td>${item.name}&nbsp;</td>
							
						</tr>
			   			</s:iterator>
					</tbody>
				</table>
				<!-- .tableactions ends -->
			</div>
   	</div>
   	</div>
</div>
</body>
</html>
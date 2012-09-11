<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!--[if IE]><script type="text/javascript" src="/script/admin/excanvas.js"></script><![endif]-->
	<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
	<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 8]><style type="text/css" media="all">@import url("/css/admin/ie.css");</style><![endif]-->	
	<script language="javascript">
	
		function refresh(){
			var url="/admin/knwTitle!refresh.act";
			$.post(url, null, function(data, status, response){
				if (status=="success") {
					console.log(status);
					$("#msgSuccess").html("<p>刷新成功</p>");
					$("#msgSuccess").show();
				}
			})
		}
	
		function showPageByType(typeId) {
			var url = "/admin/knwTitle!showHome.act?typeId="+typeId;
			window.location.href = url;
		}
		
		function editKnwTitle(id){
			var url = "/admin/knwTitle!edit.act?id="+id+"&typeId=";
			url = url + $("#typeId").attr("value");
			window.location.href = url;
		}
		
		function doPagination(typeId, pageNo) {
			var url = "/admin/knwTitle!showHome.act?pageNo="+pageNo+"&typeId="+typeId;
			window.location.href = url;
		}
		
		function toPage(pageNo, kk){
			var typeId = document.getElementById("typeId").value;
			doPagination(typeId, pageNo);
		}
		
	</script>
  </head>
  
  <body>
  <div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
	 	<div class="block">
	 			<input type="hidden" id="typeId" value="${typeId}"/>
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>新闻标题</h2>
					<ul>
						<li><a href="javascript:refresh();"> 刷新新闻 </a></li>
						<li><a href="javascript:editKnwTitle(0)">新建标题</a></li>
					</ul>
				</div>
				
				<!-- .block_head ends -->
				<div class="block_content">
				<div id="msgSuccess" class="message success" style="display: none; ">
						<p>A success message goes here</p>
				</div>
				<div>
					<ul>
						<li>
							<s:if test="typeId==0">
								<a href="javascript:showPageByType(0)"  style="color:blue;font-weight:bolder">全部</a>
							</s:if> <s:else>
								<a href="javascript:showPageByType(0)" >全部</a>
							</s:else>&nbsp;&nbsp;
							<s:iterator id="item" value="knwTypeList" status="st">
								<s:if test="#item.id==typeId">
									<a href="javascript:showPageByType(${item.id })" style="color:#009900;font-weight:bolder" >${item.name }</a>
								</s:if> <s:else>
									<a href="javascript:showPageByType(${item.id })">${item.name }</a>
								</s:else>&nbsp;&nbsp;
								
							</s:iterator>
							</li>
					</ul>
				</div>
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
							<thead>
								<tr>
									<th>类型</th>
									<th>主题</th>
									<th>作者</th>
									<th>来源</th>
									<th>发布日期</th>
									<th>审核状态</th>
									<th>启用状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator id ="item" value="pager.data" status="st">
					   				<tr>
					   				<td><label>
					   					${item.typeName}
					   					</label>
					   				</td>
									<td>
										<label title="${item.title}">
											<s:if test="#item.url.length()>8">
												<s:if test="#item.title.length()>25">
						   						<a href="${item.url}">
						   							<s:property value="#item.title.substring(0,25)"></s:property>...</a>
							   					</s:if><s:else>
							   						<a href="${item.url}">${item.title}</a>
							   					</s:else>
						   					</s:if> <s:else>
						   						<s:if test="#item.title.length()>25">
						   						<a href="/admin/knwTitle!showDetail.act?titleId=${item.id}">
						   							<s:property value="#item.title.substring(0,25)"></s:property>...</a>
							   					</s:if><s:else>
							   						<a href="/admin/knwTitle!showDetail.act?titleId=${item.id}">${item.title}</a>
							   					</s:else>
						   					</s:else>
					   					</label>
									</td>
									<td><label>${item.author}&nbsp;</label> </td>
									<td><label>${item.source}&nbsp;</label></td>
									<td><label><s:date name="#item.issuedDate"></s:date>&nbsp;</label></td>
									<td><label>
										<s:if test="#item.isAuthenticated==0">
											未审核
										</s:if><s:else>
											已审核
										</s:else>
										</label>
									</td>
									
									<td><label>
										<s:if test="#item.isActive==0">
											停用
										</s:if><s:else>
											启用
										</s:else>
										</label>
									</td>
									<td><label><a href="javascript:editKnwTitle(${item.id })">编辑</a>,
									
										<s:if test="#item.isActive==0">
											<a href="/admin/knwTitle!changeActiveStatus.act?id=${item.id}&isActive=1">启用</a></label>
										</s:if><s:else>
											<a href="/admin/knwTitle!changeActiveStatus.act?id=${item.id}&isActive=0">停用</a></label>
										</s:else>
										
										
										</td>
					   				</tr>
					   			</s:iterator>
							</tbody>
						</table>
						<div class="tableactions">
						</div>
						<!-- .tableactions ends -->
						<div class="pagination right">
							<jsp:include page="/public/pagination.jsp" />
				</div>
		</div>	
   	</div>
   	</div>
  </body>
</html>

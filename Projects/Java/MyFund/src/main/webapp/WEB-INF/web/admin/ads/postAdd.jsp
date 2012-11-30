<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script>
$(function(){$(":button").button();});
function checkform(){
	if($("#place").val() && $("#items").val()){
		$("#addform").submit();
	}
}
function returnList(){
	document.location.href="/admin/ads/post.act";
}
</script>
</head>
<body>
<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
		<div class="block">
			<div class="block_head">
				<div class="bheadl"></div>
				<div class="bheadr"></div>
				<h2>广告管理 » 广告发布管理 » 新增广告发布</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<p><s:if test="msg!=null">
				<div class="message success">
					<p>${msg}</p>
				</div>
				</s:if></p>
				<form action="/admin/ads/post!add.act" method="post" id="addform">
					<p>
						<label>广&nbsp;告&nbsp;位：</label> <s:select id="place" name="adsPost.placeid" list="adsPlaceList" listKey="id" listValue="placename" headerKey="0" headerValue="--- 选择广告位 ---"/>
					</p>
					<p>
						<label>广&nbsp;告&nbsp;项：</label> <s:checkboxlist id="items" name="adsPost.itemids" listKey="id" listValue="name" list="adsItemList"/>
					</p>
					<p>
						<label>开始日期：</label> <input name="adsPost.startddate" class="text" onclick="" style="width:120px;"/>
					</p>
					<p>
						<label>结束日期：</label> <input name="adsPost.startddate" class="text" onclick="" style="width:120px;"/>
					</p>
					<p>
						<label>状&nbsp;&nbsp;&nbsp;&nbsp;态：</label> <s:radio name="adsPost.status" list="#{'0':'正常','1':'停止'}" value="0"/>
					</p>
					<hr/>
					<p>
						<input type="button" value="返 回" onclick="returnList();"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="保 存 " onclick="checkform();"/>
					</p>
				</form>
			</div>
			<!-- .block_content ends -->
			<div class="bendl"></div>
			<div class="bendr"></div>
		</div>
		<!-- .block ends -->
	</div>
</div>
</body>
</html>
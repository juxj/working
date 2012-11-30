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
	if($("#height").val() && $("#width").val()){
		$("#editform").submit();
	}
}
function returnList(){
	document.location.href="/admin/ads/place.act";
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
				<h2>广告管理 » 广告位管理 » 编辑广告位</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<p><s:if test="msg!=null">
				<div class="message success">
					<p>${msg}</p>
				</div>
				</s:if></p>
				<form action="/admin/ads/place!update.act" method="post" id="editform">
					<p>
						<label>广告位名称：</label> <s:textfield cssClass="text" id="placename" name="adsPlace.placename" cssStyle="width:300px;"/> <span class="note">描述广告位的位置，45字以内含标点符号</span>
					</p>
					<p>
						<label>高度（像素）</label> <s:textfield cssClass="text" id="height" name="adsPlace.height" cssStyle="width:40px;"/> <span class="note">广告位的高度，允许整数</span>
					</p>
					<p>
						<label>宽度（像素）</label> <s:textfield id="width" name="adsPlace.width" cssClass="text" cssStyle="width:40px;"/> <span class="note">广告位的宽度，允许整数</span>
					</p>
					<p>
						<label>广告位类型：</label> <s:radio name="adsPlace.type" list="#{0:'文字',1:'单图片',2:'多图切换'}" cssClass="radio" value="1"/> 
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
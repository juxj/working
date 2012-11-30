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
$(function(){
	$("#type0").attr("disabled",true);
	$(":button").button();}
);
function checkform(){
	if($("#type0").val() || $("#type1").val()){
		$("#editform").submit();
	}
}
function returnList(){
	document.location.href="/admin/ads/item.act";
}
function choose(type){
	if(type==0){
		$("#type0").attr("disabled",false);
		$("#type1").attr("disabled",true);
		$("#type1").val("");
	}
	if(type==1){
		$("#type0").attr("disabled",true);
		$("#type0").val("");
		$("#type1").attr("disabled",false);
	}
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
				<h2>广告管理 » 广告项管理 » 编辑广告项</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<p><s:if test="msg!=null">
				<div class="message success">
					<p>${msg}</p>
				</div>
				</s:if></p>
				<form action="/admin/ads/item!update.act" method="post" id="editform" enctype="multipart/form-data">
					<p>
						<label>广告名称：</label> <s:textfield cssClass="text" id="placename" name="adsItem.name" cssStyle="width:200px;"/> <span class="note">广告名称，45字以内含标点符号</span>
					</p>
					<p>
						<label><input type="radio" name="type" value="0" onclick="choose(0)"/> 文&nbsp;&nbsp;字：</label>
						<s:textfield cssClass="text" name="adsItem.content" cssStyle="width:200px;" id="type0"/> <span class="note">广告的内容, 如果是文字广告，直接填写广告内容至输入框。</span>
					</p>
					<p>
						<label><input type="radio" name="type" value="1" checked="checked" onclick="choose(1)"/> 图&nbsp;&nbsp;片：</label>
						<s:file name="images" id="type1"/><span class="note">广告的内容, 如果是图片，直接选择图片上传。</span><br/>
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
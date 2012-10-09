<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--[if IE]><script type="text/javascript" src="/script/admin/excanvas.js"></script><![endif]-->
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/jquery.validate.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 8]><style type="text/css" media="all">@import url("/css/admin/ie.css");</style><![endif]-->
<script language="javascript">
	$(function() {
		$("#frmKnwTitle").validate();
	});
	
	$(document).ready(function(){
		getSelectorValue('#title','#typeName');		
		}
	);

	function getSelectorValue(tagName, inputName) {
		var value = $(tagName).find("option:selected").text();
		$(inputName).attr("value", value);
	}
</script>
<!--[if lt IE 8]><style type="text/css" media="all">@import url("/css/admin/ie.css");</style><![endif]-->
</head>
<body>
	<div id="hld">
		<div class="wrapper">
			<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
			<div class="block">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>编辑信息</h2>
					<ul>
						<li class="nobg"><a href="/admin/knwTitle!edit.act">增加新信息</a>
						</li>
						<li></li>
					</ul>
				</div>
				<!-- .block_head ends -->
				<div class="block_content">
					<p class="breadcrumb">
						<a href="/admin/">管理主页</a> « <a href="/admin/knwType!showHome.act">新闻类型主页</a>
					</p>
					<div class="message errormsg" style="display: none; ">
						<p>An error message goes here</p>
						<span class="close" title="Dismiss"></span>
					</div>
					<div class="message success" style="display: none; ">
						<p>A success message goes here</p>
						<span class="close" title="Dismiss"></span>
					</div>
					<div class="message info" style="display: none; ">
						<p>An informative message goes here</p>
						<span class="close" title="Dismiss"></span>
					</div>
					<div class="message warning" style="display: none; ">
						<p>A warning message goes here</p>
						<span class="close" title="Dismiss"></span>
					</div>
					<form id="frmKnwTitle" action="/admin/knwTitle!save.act" method="post">
						<s:hidden id="titleId" name="knwTitle.id"></s:hidden>
						<s:hidden id="typeName" name="knwTitle.typeName"></s:hidden>
						<s:hidden id="issuedDate" name="knwTitle.issuedDate"></s:hidden>
						<p>
							<label>类别:</label><br />
							<s:select id="title" list="knwTypeList" name="knwTitle.typeId"
								listKey="id" listValue="name"
								onChange="getSelectorValue('#title','#typeName')" headerValue="1"></s:select>
						</p>
						<p>
							<label>标题:</label><br />
							<s:textfield name="knwTitle.title" cssClass="required text small"></s:textfield>
						</p>
						<p>
							<label>关键字:</label><br />
							<s:textfield name="knwTitle.keyword"
								cssClass="required text small"></s:textfield>
						</p>
						<p>
							<label>作者:</label><br />
							<s:textfield name="knwTitle.author"
								cssClass="text small"></s:textfield>
						</p>
						<p>
							<label>新闻来源:</label><br />
							<s:textfield name="knwTitle.source"
								cssClass="text small"></s:textfield>
						</p>
						<p>
							<label>自定义URL:</label><br />
							<s:textfield name="knwTitle.url" cssClass="text small"></s:textfield>
						</p>

						<p>
							<label>内容:</label><br />
							<textarea id="contents" name="knwTitle.contents" class="required xheditor">${knwTitle.contents}</textarea>
						</p>

						<p>
							<label>审核标记：</label>
							<s:radio list="#{'0':'未审核','1':'已审核'}"
								name="knwTitle.isAuthenticated"></s:radio>
						</p>
						
						<p>
							<label>启用标记：</label>
							<s:radio list="#{'0':'停用','1':'启用'}"
								name="knwTitle.isActive"></s:radio>
						</p>
						<hr />
						<p>
							<input type="submit" class="submit small" value="提交" /> <input
								type="reset" class="submit small" value="重置" />
						</p>
					</form>
				</div>
			</div>
		</div>
		</div>
</body>
</html>
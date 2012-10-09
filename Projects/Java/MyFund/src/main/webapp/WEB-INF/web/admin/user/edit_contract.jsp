<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.22/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/script/jquery.validate.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.22/themes/base/jquery-ui.css" type="text/css" media="all" />
<script language="javascript">
	var userType = 1;
	$(function() {
		$("#frmContract").validate();
		$(".date_picker").datepicker();
		$('input[name="userType"]').click(
			function (){
				changeUserType();
			}
		);
		userType =  $('input[name="userType"]:checked').val();
		$( "#userName" ).autocomplete({
			source: function( request, response ) {
				$.ajax({
					url: "/json/UList.act",
					dataType: "json",
					type: "POST",
					data: {
						userType: userType,
						userName: function(){return $('#userName').val();}
					},
					success: function( data ) {
						console.log(data);
						response( $.map( data, function( item ) {
							return {
								label: item.name,
								value: item.name,
								key: item.id
							}
						}));
					}
				});
			},
			minLength: 2,
			select: function( event, ui ) {
				$("#userId").attr("value", ui.item.key);
			},
			open: function() {
				$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
			},
			close: function() {
				$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
			}
		});
	});
	
	function changeUserType(){
		userType =  $('input[name="userType"]:checked').val();
	}

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
					<h2>会员管理»协议管理»录入协议</h2>
					<ul>
						<li class="nobg"></li>
						<li></li>
					</ul>
				</div>
				<!-- .block_head ends -->
				<div class="block_content">
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
					<div>
						<p>
							<label><input type="radio"  value="1" name="userType" checked="checked"/> 企业</label>
							<label><input type="radio"  value="2" name="userType" /> 银行</label>
							<label><input type="radio"  value="3" name="userType"/> 非银行金融机构</label>
							<label><input type="radio"  value="4" name="userType"/> 服务机构</label>
							<label><input type="radio"  value="5" name="userType"/> 个人</label>
						</p>
					</div>
					<form id="frmContract" action="/admin/userContract!saveContract.act" method="post">
						<s:hidden id="id" name="contract.id"></s:hidden>
						<s:hidden id="contractTypeName" name="contract.contractTypeName"></s:hidden>
						<s:hidden id="userId" name="contract.userId" value="%{#session._admin.id}"></s:hidden>
						<p>
							<label>签约方</label><br />
							<s:textfield id="userName" name="contract.userName" cssClass="required text small"></s:textfield>
						</p>
						
						<p>
							<label>类别:</label><br />
							<s:select id="contractTypeId" list="contractList" name="contract.contractTypeId"
								listKey="id" listValue="name" headerValue="#contract.contractTypeId"
								onChange="getSelectorValue('#contractTypeId','#contractTypeName')"></s:select>
						</p>
						<p>
							<label>标题:</label><br />
							<s:textfield name="contract.title" cssClass="required text small"></s:textfield>
						</p>
						<p>
							<label>合同编号:</label><br />
							<s:textfield name="contract.contractNumber"
								cssClass="required text small"></s:textfield>
						</p>
						<p>
							<label>签署日期:</label><br />
							<input type="text" name="contract.signedDate" class="required text small date_picker" value="<s:date name="contract.signedDate"/>"/>
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
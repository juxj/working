<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>资料管理</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript" src="/script/jquery.form.js" > </script>

<script language="javascript">
	$(function(){
    	$('#ufile').bind('click',function(){  
    		$('#ufile').val(''); 
    		$('#message').html('');
        });
    	//$("#underForm").validate();
    })
	function watchIt(id){
		$('#img_app').html("<img src='/user/loan/downloadAttach.act?type=0&falistId="+id+"'/>");
		$('#img_app').dialog({
			width : 700,
    		modal:true
		});
	}
	
	function agreeWatchIt(id){
		$('#img_app').html("<img src='/user/loan/downloadAttach!downAgree.act?applyId="+id+"'/>");
		$('#img_app').dialog({
			width : 700,
    		modal:true
		});
	}
	
	function openIt(id){
		$.post("/user/loan/downloadAttach.act",{type:0,falistId:id},function(data){
			
		})
	}
    function uploadFile(attachid,attachType){
    	var url = "financeAttach!viewAttach.act";
    	var param = {'attachId':attachid};
    	//window.location= url + "?attachId=" + attachid;
    	$.post(url,param, function(data){
    	//alert(data);
    		$('#fileList').html(data);
    	}, 'html');
    	$('#attach_id').val(attachid);
    	$('#attachType').val(attachType);
    	$('#uload').show();
    	
    	$('#uploadFileObj').html($('<input type="file" name="upload" id="ufile"/>'));
    	
    	$("#upload_file").dialog({
    		width:500,
    		modal:true,
    		close: function(event, ui) { 
				//$('#financeManage').attr('action','financeAttach!attachMana.act');
				//$('#financeManage').submit();
				
    		}
    		
    	});
    	$('#ufile').val('');
    	$('#message').html('');
    }
    
    function downloadAttach(attachid){
    	var url = "financeAttach!viewAttach.act";
    	var param = {'attachId':attachid};
    	//window.location= url + "?attachId=" + attachid;
    	$.post(url,param, function(data){
    	//alert(data);
    		var da = $('#downloadform');
    		if(da.length == 0){
    			da = $("<div id='downloadform'></div>");
    		}else{
    			da.remove();
    			da = $("<div id='downloadform'></div>");
    		}
    		da.append(data);
    		$('#download_attach').append(da);
    		$('#download_attach').dialog({width:400,modal:true});
    	}, 'html');
    }
    function updateAttachStatus(attachId, attachStatus){
    	$("#upload_attach_id").val(attachId);
    	$("#uploadStatus").val(attachStatus);
    	$("#financeManage").submit();
    }
    
    
    
	function uploadsubmit() {
    	if($('#ufile').val()=='' || $('#ufile').val()==null){
    		$('#message').html("请选择上传文件！");
    		return false;
    	}
    	
		var uploadfile = $('#ufile').val();
		if (uploadfile != "") {
			var types = [ "png", "jpg", "jpeg", "bmp", "doc", "docx", "xls","xlsx", "pdf","rar","zip" ];
			var ext = uploadfile.substring(uploadfile.lastIndexOf(".") + 1).toLowerCase();
			
			var sing = false;
			for ( var i = 0; i < types.length; i++) {
				if (ext == types[i]) {
					sing = true;
				}
			}
			if (!sing) {
				$('#message').html("您选择的文件类型不符合要求!");
				return false;
			}
		}
		$('#message').html("正在上传文件,请稍候...");
		//$('#uploadForm').submit();
		$('#uploadForm').ajaxSubmit({
			datatype : "html",
			success : function(data) {
				if(data.indexOf('error') >= 0){
					$('#uload').hide();
					$('#message').html("上传失败，只支持上传小于3M的png、jpg、jpeg、bmp、word、excel、pdf、rar、zip文件！");
				}else{
					var attid= $('#attach_id').val();
					var countValue = 1;
					if($('#attCount' + attid).text() != ''){
						countValue = parseInt($('#attCount' + attid).text()) +1
					}
					var ast = '#attStatus' + attid;
					$(ast).html(data);
					$('#attCount' + attid).html($('<span>' + countValue + '</span>'));
					$("#upload_file").dialog("close");
					if($('#operatOffline' + attid).length >0){
						$('#operatOffline' + attid).html("");
					}
				}
			}
		});
	}

    function uploadFinish1(){
    	var res = true;
    	$(".upstatus").each(function(){
    		var j = $(this).val();
    		if(j=='212'||j=='215'){
    			res = false;
    			return false;
    		}
    	});
    	if(res){
    		$.ajax({
	    		url : '/user/loan/financeAttach!uploadOverToZjw.act',
				dataType : 'json',
				data: {'apply.id':${apply.id}},
				cache : false,
				success : function(r) {
					if (r.success) {
						alert("您的申贷资料已提交成功，我们将尽快对资料进行审核，请您耐心等待审核结果。谢谢！");
						window.location='/user/loan/userApplyManag!viewFinanceApply.act?apply.id=' + '${apply.id}';
					}
				},
				type : "POST",
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.responseText);
				} 
	    	})
    		$('.hid').hide();
    	}else{
    		alert("您还有未提交的申贷材料，请全部提交完成后再进行此操作");
   			return false;
    	}
    }
    function uploadFinish2(){
    	var res = true;
    	$(".upstatus").each(function(){
    		var j = $(this).val();
    		if(j=='212'||j=='215'){
    			res = false;
    			return false;
    		}
    	});
    	if(res){
    		$.ajax({
	    		url : '/user/loan/financeAttach!uploadOverToZjf.act',
				dataType : 'json',
				data: {'apply.id':${apply.id}},
				cache : false,
				success : function(r) {
					if (r.success) {
						alert("您的申贷资料已提交成功，我们将尽快对资料进行审核，请您耐心等待审核结果。谢谢！");
						window.location='/user/loan/userApplyManag!viewFinanceApply.act?apply.id=' + '${apply.id}';
					}
				},
				type : "POST",
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.responseText);
				} 
	    	})
    		$('.hid').hide();
    	}else{
    		alert("您还有未提交的申贷材料，请全部提交完成后再进行此操作");
   			return false;
    	}
    }
    
    //线下弹出层
    function underDiv(itemid,type,attachMemo,postid){
    	$("#underbox").val(itemid);
    	$("#underAttachType").val(type);
    	if(attachMemo != ''){
	    	$("#undername").val(attachMemo);
    	}
    	if(postid != ''){
	    	$("#undercode").val(postid);
    	}
    	$("#underline").dialog({
    		width : 500,
    		modal : true
    	});
    }
    //填写完快递单号后，线下提交
    function underSubmit(){
    	var url = "/user/loan/financeAttach!underSubmit.act";
    	var attId = $('#underbox').val();
    	var applyid = '${apply.id}';
    	if($('#undername').val() == '' || $('#undercode').val() == ''){
    		alert("请输入快递公司与快递单号！");
    		return ;
    	}
    	var param = {'attach.id':attId,'apply.id':applyid,'attachType':$('#underAttachType').val(),'attach.attachMemo':$('#undername').val(),'attach.postid':$('#undercode').val()};
    	$.post(url,param, function(data){
    		$('#attStatus' + attId).html(data);
    	}, 'html');
    	//$("#underForm").submit();
   		$("#underline").dialog("close");
   		if($('#operatOnline' + attId).length >0){
			$('#operatOnline' + attId).html("");
		}
    }
    function viewAgreeAttach(){
    	$('#agreeAttach').dialog({width : 500,modal : true});
    }

</script>
<style>
#t_border{width:100%; border-top: 1px solid #ddd; border-right: 1px solid #ddd;}
#t_border td{border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; padding:8px;}
</style>
</head>

<body>
<div id="mainBody">
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--理财服务产品列表页面开始-->
	<div class="M_menu">
	  	融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/user/loan/userApplyManag.act">融资申请管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/user/loan/financeAttach!attachMana.act?viewAttachType=${viewAttachType }&applyId=${applyId}">资料管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#97181d;">${msg }</span>
	</div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="container_950 box_4">
		  <div class="P_title">上传资料</div>
		  <div class="line">
			  <s:if test="viewAttachType == 1">
			  <ul>
				<li>•&nbsp;请在5个工作日内将需要线下提交的材料邮寄或者传真给我们</li>
				<li>•&nbsp;上海市浦东新区张杨路707号生命人寿大厦501室中国资金网 邮编：200120</li>
				<li>•&nbsp;传真号：021-56784323</li>
			 </ul>	
			 </s:if>
		  </div>
	</div>
  <s:form id="financeManage" action="financeAttach!checkAttach.act" namespace="/user/loan">
  <s:hidden name="applyId"></s:hidden>
  <s:hidden name="viewAttachType"></s:hidden>
  <s:hidden name="attach.id" id="upload_attach_id"></s:hidden>
  <s:hidden name="attach.uploadStatus" id="uploadStatus"></s:hidden>
  <div class="hr_10"> &nbsp; </div> 
  <div class="container_950 box_4">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
     		<tr class="top_color">
	            <td style="padding-left:25px; width:350px;">资料名称</td>
	            <td style="width:160px;">要求递交方式</td>
	            <td >状态</td>
	            <td align="center">操作</td>
            </tr>
          <tbody>
           	<tr class="top_color01">
	           	<td style="padding:5px 20px;">
	           		<span>中国资金网融资咨询服务协议(加盖公章)&nbsp;</span>
	           		<a href="javascript:viewAgreeAttach();" class="red">查看</a>
	           		<a href="/user/loan/downloadAttach!downAgreeTemplate.act" target="_blank" class="red">模板下载</a>
	           	</td>
	           	<td>网上提交或线下邮寄</td>
	           	<td id="attStatus0" style="padding:5px 0;">
	           		<s:if test="apply.agreeStatus == 212 || apply.agreeStatus == 215">
	   					<font color="#426D7D"><common:print valueId="apply.agreeStatus"/></font>
	   				</s:if>
	   				<s:else>
		   				<font color="#426D7D"><common:print valueId="apply.agreeStatus"/></font>
	   				</s:else>
	           	</td>
	           	<td align="right" style="padding-right:25px;">
   					<s:if test="apply.agreeStatus == 212 || apply.agreeStatus == 213 || apply.agreeStatus == 215">
			   			<span id="operatOnline0"><input type="button" class="but_gray" value="网上提交" onclick="uploadFile(0,1);"/></span>
		   			</s:if>
   					<s:if test="apply.agreeStatus == 212 || apply.agreeStatus == 215 || apply.agreeStatus == 218">
			   			<span id="operatOffline0"><input type="button" class="bgray hid" value="线下邮寄" onclick="underDiv(0,1,'${apply.agreeMemo}','${apply.agreeFileUpload }')"/></span>
		   			</s:if>
	           	</td>
           	</tr>
          <% int num = 1; %>
		 	<s:iterator id ="item" value="attachList">
			<tr class="top_color01">
				<td style="padding:5px 25px 5px 20px;">
						<%=num++ %>.&nbsp;${item.dataName }
						${item.supplyName }
						<a href="javascript:downloadAttach('${item.id}');" class="red">查看</a><br/>
						<s:if test="haveMemo == 1">
							<div style="padding:5px 35px;">${otherMemo }</div>
						</s:if>
				</td>
				<td>
					<s:if test="supplyWay.indexOf(',') >= 0">
						网上提交或线下邮寄
					</s:if>
					<s:else>
						<common:print valueId="supplyWay"/>
					</s:else>
				</td>
	   			<td id="attStatus${id }" style="padding:5px 0;">
	   				<s:if test="uploadStatus == 212 || uploadStatus == 215">
	   					<font color="#426D7D"><common:print valueId="uploadStatus"/></font>
	   				</s:if>
	   				<s:else>
	   					<font color="#426D7D"><common:print valueId="uploadStatus"/></font>
	   				</s:else>
	   				<s:if test="uploadStatus == 218">
	   					<br/>快递公司：${attachMemo }<br/>
	   					快递单号：${postid }
	   				</s:if>
	   				<s:if test="uploadStatus == 213">
	   					<br/>已上传份数：<span id="attCount${id }">${attachCount }</span>
	   				</s:if>
	   				<input type="hidden" value="${item.uploadStatus }" class="upstatus"/>
	   			</td>
	   			<td align="right" style="padding-right:25px;" >
	   				<s:if test="supplyWay == '' || supplyWay.indexOf('175') >=0">
	   					<s:if test="(apply.applyStatus==302 || apply.applyStatus==308) && (uploadStatus == 212 || uploadStatus == 213 || uploadStatus == 215)">
				   			<span id="operatOnline${id }"><input type="button" class="bgray hid" value="网上提交" onclick="uploadFile('${item.id}',0);"/></span>
			   			</s:if>
	   				</s:if>
	   				<s:if test="supplyWay == '' || supplyWay.indexOf('176') >=0">
	   					<s:if test="(apply.applyStatus==302 || apply.applyStatus==308) && (uploadStatus == 212 || uploadStatus == 215 || uploadStatus == 218)">
				   			<span id="operatOffline${id }"><input type="button" class="bgray hid" value="线下邮寄" onclick="underDiv('${item.id}',0,'${attachMemo }','${postid }')"/></span>
			   			</s:if>
	   				</s:if>
	   			</td>
			</tr>
			</s:iterator>
			</tbody>
        </table>
  </div>
  </s:form>
   <div class="hr_10"> &nbsp;</div>
<!--弹出框内容登录页面-->
<div id="upload_file" style="display:none;" title="文件上传">
<div id="fileList">
</div>
   <div class="hr_10"> &nbsp;</div>
	<s:form id="uploadForm" action="financeAttach!upload.act" namespace="/user/loan" method="post" enctype="multipart/form-data">
	<s:hidden name="applyId"></s:hidden>
	<s:hidden name="viewAttachType"></s:hidden>
	<s:hidden name="attachId" id="attach_id"></s:hidden>
	<s:hidden name="attachType" id="attachType"></s:hidden>
	<table id="t_border">
		<tr>
			<td><h6>选择资料 &nbsp;&nbsp; <span id="message" style="color: red"></span></h6></td>
		</tr>
		<tr id="uload">	
			<td>
			<span id="uploadFileObj"><s:file name="upload" theme="simple" id="ufile" ></s:file></span>
			<input type="button" value="上传"  onclick="uploadsubmit();"/></td> 
		</tr>
		<tr>	
			<td>说明：支持png、jpg、jpeg、bmp、doc、xls、pdf、rar、zip格式 文件小于3M</td>
		</tr>
	</table>
	</s:form>
</div>   
	<div id="download_attach" style="display:none;" title="文件下载">
	</div>   
	<div id="img_app" style="display:none;" title="图片预览">
	</div>  


		<div class="hr_10"> &nbsp;</div>
		<s:if test="apply.applyStatus==302">
		<div align="center">
			<input id="over" class="btnsub blue1 hid" type="button" value="所有资料上传完成" onclick="uploadFinish1()"/>
		</div>
		</s:if>
		<s:if test="apply.applyStatus==308">
		<div align="center">
			<input id="over" class="btnsub blue1 hid" type="button" value="所有资料上传完成" onclick="uploadFinish2()"/>
		</div>
		</s:if>
</div>


<!--弹出框线下提交页面-->
	<div id="underline" title="填写线下提交快递单号：" style="display: none;">
		<form action="/user/loan/financeAttach!underSubmit.act" id="underForm" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id" ></s:hidden>
			<s:hidden name="attach.id" id="underbox"></s:hidden>
			<s:hidden name="attachType" id="underAttachType"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table>
				<tr>
					<td class="p_td" style="vertical-align: top;">快递公司名称：</td>
					<td class="p_td"><input id="undername" type="text" class="required" name="attach.attachMemo" maxlength="50"/></td>
				</tr>
				<tr>
					<td class="p_td" style="vertical-align: top;">快递单号：</td>
					<td class="p_td"><input id="undercode" type="text" class="required" name="attach.postid" maxlength="25"/></td>
				</tr>
			 </table>
			 <div align="center">
				<td class="p_td"><input type="button" value="提交" class="but_gray" onclick="underSubmit();"></input></td>
			 
			 </div>
		</form>
	 </div>
<div id="agreeAttach" title="中国资金网融资咨询服务协议" style="display: none;">
<s:if test="apply.agreeUploadWay == 0">
	<li>
		中国资金网融资咨询服务协议(<s:date name="apply.agreeUploadTime" format="yyyy-MM-dd HH:mm"/>) &nbsp;&nbsp;<a href="/user/loan/downloadAttach!downAgree.act?applyId=${applyId}">下载</a>
		<s:if test="apply.agreeFileUpload.indexOf('.png')>=0||apply.agreeFileUpload.indexOf('.jpg')>=0||apply.agreeFileUpload.indexOf('.jpeg')>=0||apply.agreeFileUpload.indexOf('.bmp')>=0">| <a href="javascript:void(0);" onclick="agreeWatchIt('${applyId}')">预览</a></s:if>
	</li>
</s:if>
<s:else>
	<li>资料提交使用的快递公司名称：${apply.agreeMemo }</li>
	<li>快递单号：${apply.agreeFileUpload }</li>
</s:else>
</div>
<!--foot-->
<div class="hr_10"> &nbsp;</div>
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>

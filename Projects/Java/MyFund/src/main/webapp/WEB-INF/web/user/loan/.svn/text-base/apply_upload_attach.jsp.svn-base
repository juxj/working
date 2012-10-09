<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>资料管理</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript" src="/script/jquery.form.js" > </script>

<script language="javascript">
	function watchIt(id){
		$('#img_app').html("<img src='/user/loan/downloadAttach.act?type=0&falistId="+id+"'/>");
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
    	$('#attach_id').val(attachid);
    	$('#attachType').val(attachType);
    	$("#upload_file").dialog({
    		width:500,
    		modal:true,
    		close: function(event, ui) { 
				$('#financeManage').attr('action','financeAttach!attachMana.act');
				$('#financeManage').submit();
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
    
    $(function(){
    	$('#ufile').bind('click',function(){  
    		$('#ufile').val(''); 
    		$('#message').html('');
        });
    	
    })
    
	function uploadsubmit() {
    	
    	if($('#ufile').val()=='' || $('#ufile').val()==null){
    		$('#message').html("请选择上传文件！");
    		return false;
    	}
    	
		var uploadfile = $('#ufile').val();
		if (uploadfile != "") {
			var types = [ "png", "jpg", "jpeg", "bmp", "doc", "docx", "xls","xlsx", "pdf" ];
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
		$('#message').html("正在上传文件,请稍后...");
		//$('#uploadForm').submit();
		$('#uploadForm').ajaxSubmit({
			datatype : "html",
			success : function(data) {
				$('#uload').hide();
				$('#message').html(data);
				
			}
		});
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
  	融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/user/loan/financeApply!applyManag.act">融资申请管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/user/loan/financeAttach!attachMana.act?viewAttachType=${viewAttachType }&applyId=${applyId}">资料管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#97181d;">${msg }</span>
  </div>
  <div class="hr_10"> &nbsp; </div> 
  <div class="hr_10"> &nbsp; </div> 
  <div class="M_box">
	  <div style="padding-left:20px;">
	  <s:if test="viewAttachType == 1">
		<li>请在5个工作日内将需要线下提交的材料邮寄或者传真给我们</li>
		<li>上海市浦东新区张杨路707号生命人寿大厦501室中国资金网 邮编：200120</li>
		<li>传真号：021-56784323</li>
	  </s:if>
	  </div>
  </div>
  <s:form id="financeManage" action="financeAttach!checkAttach.act" namespace="/user/loan">
  <s:hidden name="applyId"></s:hidden>
  <s:hidden name="viewAttachType"></s:hidden>
  <s:hidden name="attach.id" id="upload_attach_id"></s:hidden>
  <s:hidden name="attach.uploadStatus" id="uploadStatus"></s:hidden>
  <div class="hr_10"> &nbsp; </div> 
  <div class="hr_10"> &nbsp;</div>
  <div class="M_box">
        <table class="container_950 center box_4">
     		<tr class="top_color">
            <td style="padding-left:25px;">资料名称</td>
            <td>说明</td>
            <td>递交方式</td>
            <td>状态</td>
            <td>操作</td>

          </tr>
          <tbody>
           <tr class="top_color01">
           	<td class="view_detail" style="padding-left:25px;">
           		<label>中国资金网融资咨询服务协议加盖公章&nbsp;</label>
           		<s:if test="viewAttachType == 1">
           		  <a href="/user/loan/downloadAttach!downAgreeTemplate.act" target="_blank" style="float:left;">模板下载</a>
           		</s:if>
           	</td>
           	<td></td>
           	<td></td>
           	<td>
           		<s:if test="apply.agreeFileUpload == null || apply.agreeFileUpload == ''">
           			未递交
           		</s:if>
           		<s:else>
           			已上传
           		</s:else>
           	</td>
           	<td>
          	   <s:if test="viewAttachType == 1">
           		<input type="button" class="but_gray" value="上传" onclick="uploadFile(0,1);"/>
          	   </s:if>
          	   <s:if test="apply.agreeFileUpload != null && apply.agreeFileUpload != ''">
           		<input type="button" class="but_gray" value="下载" onclick="window.open('/user/loan/downloadAttach!downAgree.act?applyId=${applyId}');"/>
          	   </s:if>
           	</td>
           </tr>
          
		 	<s:iterator id ="item" value="attachList">
			<tr class="top_color01">
				<td style="padding-left:25px;">
						${item.dataName }
						${item.supplyName }
				</td>
				<td>${item.dataSupply }
				${item.supplyMemo }
				</td>
				<td><common:print valueId="#item.supplyWay"/></td>
	   			<td><common:print valueId="#item.uploadStatus"/></td>
	   			<td class="view_detail">
	   			<s:if test="viewAttachType == 1">
		   			<input type="button" class="but_gray" value="上传" onclick="uploadFile('${item.id}',0);"/>
	   			</s:if>
	   			<s:if test="#item.uploadStatus != 212">	   			
	   				<input type="button" class="but_gray" value="下载" onclick="downloadAttach('${item.id}');"/>
	   			</s:if>
	   			</td>
			</tr>
			<s:if test="haveMemo == 1">
					<tr>
						<td colspan="5">
							<div style="padding-left:40px;">${otherMemo }</div>
						</td>
					</tr>
				</s:if>
			</s:iterator>
			</tbody>
        </table>
  </div>
  </s:form>
   <div class="hr_10"> &nbsp;</div>
<!--弹出框内容登录页面-->
<div id="upload_file" style="display:none;" title="文件上传">
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
			<s:file name="upload" theme="simple" id="ufile"></s:file>
			<input type="button" value="上传"  onclick="uploadsubmit();"/></td> 
		</tr>
		<tr>	
			<td>说明：支持png、jpg、jpeg、bmp、doc、xls、pdf格式 文件小于3M</td>
		</tr>
	</table>
	</s:form>
</div>   
<div id="download_attach" style="display:none;" title="文件下载">

</div>   
  
<div id="img_app" style="display:none;" title="图片预览">

</div>  
<!-- 
未递交
递交待确认
已确认
已退回
修改待确认
 -->
  <!--理财服务产品列表页面结束--> 

<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</div>
</body>
</html>

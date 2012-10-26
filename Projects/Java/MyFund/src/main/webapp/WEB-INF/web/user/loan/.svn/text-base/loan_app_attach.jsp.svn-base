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
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript" src="/script/jquery.form.js" > </script>
<script language="javascript">
    function uploadFile(attachid){
    	$('#loandata_id').val(attachid);
    	$("#upload_file").dialog({
    		width:500,
    		modal:true,
    		close: function(event, ui) { 
				$('#financeManage').attr('action','/user/loan/appLoanAttach!attachManag.act');
				$('#financeManage').submit();
    		}
    		
    	});
    	$('#ufile').val('');
    	$('#message').html('');
    }
    
    function downloadAttach(attachid){
    	var url = "/user/loan/appLoanAttach!viewAttach.act";
    	var param = {'loanData.id':attachid};
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
				$('#message').html(data);
			}
		});
	}
</script>

</head>

<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--理财服务产品列表页面开始-->
  <div class="M_menu">
  	融资管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;<a href="/user/loan/loanAfter!loanAfterList.act">贷后管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;资料管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${msg }
  </div>
  <s:form id="financeManage" action="appLoanAttach!checkAttach.act" namespace="/user/loan">
  <s:hidden name="appLoanId"></s:hidden>
  <s:hidden name="viewAttachType"></s:hidden>
  <s:hidden name="loanData.id" id="upload_attach_id"></s:hidden>
  <s:hidden name="loanData.uploadStatus" id="uploadStatus"></s:hidden>
  <div class="hr_10"> &nbsp; </div> 
  <div class="container_950 ">
	<div class="P_title box_4" style="border-bottom:5px solid #003961;">查看材料</div>
        <table class="box_4" border="0" cellspacing="0" class="ctl" cellpadding="0" style="width:100%">
     		<tr class="top_color">
            <td style="padding-left:25px;">资料名称</td>
            <td style="padding-left:10px;">说明</td>
            <td style="padding-left:10px;">递交方式</td>
            <td style="padding-left:10px;">状态</td>
            <td width="200px" align="center">操作</td>
          </tr>
		 	<s:iterator id ="item" value="loanDataList">
			<tr class="gold_connect">
				<td style="padding-left:25px;">
					${item.supplyName }
				</td>
				<td>
					${item.supplyMemo }
				</td>
				<td><common:print valueId="#item.supplyWay"/></td>
	   			<td><common:print valueId="#item.uploadStatus"/></td>
	   			<td style="text-align:right;padding-right:20px">
	   			<s:if test="viewAttachType == 1">
		   			<input type="button" class="bgray" value="上传" onclick="uploadFile('${item.id}',0);"/>
	   			</s:if>
	   			<s:if test="#item.uploadStatus != 212">	   			
	   				<input type="button" class="bgray" value="下载" onclick="downloadAttach('${item.id}');"/>
	   			</s:if>
	   			<%
	   			/*
	   			<s:if test="viewAttachType ==0 && #item.uploadStatus ==213">
	   				<input type="button" class="but_gray" value="确认" onclick="updateAttachStatus('${item.id}','214');"/>
	   				<input type="button" class="but_gray" value="退回" onclick="updateAttachStatus('${item.id}','215');"/>
	   			</s:if>*/
	   			 %>
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
        </table>
  </div>
  </s:form>
   <div class="hr_10"> &nbsp;</div>
<!--弹出框内容登录页面-->

<div id="upload_file" style="display:none;" title="文件上传">
	<s:form id="uploadForm" action="appLoanAttach!upload.act" namespace="/user/loan" method="post" enctype="multipart/form-data">
			<s:hidden name="appLoanId"></s:hidden>
			<s:hidden name="viewAttachType"></s:hidden>
			<s:hidden name="loanData.id" id="loandata_id"></s:hidden>
	<table id="t_border">
		<tr>
			<td><h6>选择资料 &nbsp;&nbsp; <span id="message" style="color: red"></span></h6></td>
		</tr>
		<tr>	
			<td>
			<s:file name="upload" theme="simple" id="ufile"></s:file>
			<input type="button" value="上传"  onclick="uploadsubmit();"/></td> 
		</tr>
		<tr>	
			<td>说明：支持png、jpg、jpeg、bmp、word、excel、pdf格式 文件小于3M</td>
		</tr>
	</table>
	</s:form>
</div>  



<div id="download_attach" style="display:none;" title="文件下载">

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
</body>
</html>

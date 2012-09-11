<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	$(function() {
    	$(":button,:submit,:reset").button();
        $("#timeOne").datepicker();
    	$("#timeTwo").datepicker();
    });
    function uploadFile(attachid){
    	$('#attach_id').val(attachid);
    	$("#upload_file").dialog({width:440,modal:true});
    }
    
    function downloadAttach(attachid){
    	var url = "/admin/loan/financeAttach!viewAttach.act";
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
					<h2>融资申资料管理</h2>
					<ul>
						<li class="nobg"></li>
						<li></li>
					</ul>
				</div>
				<!-- .block_head ends -->
				<div class="block_content">
				  <form id="financeManage" action="#">
				  <s:hidden name="applyId"></s:hidden>
				  <s:hidden name="viewAttachType"></s:hidden>
				  <s:hidden name="attach.id" id="upload_attach_id"></s:hidden>
				  <s:hidden name="attach.uploadStatus" id="uploadStatus"></s:hidden>
				  <table cellpadding="0" cellspacing="0" width="100%" class="sortable">
				  	<thead>
			     	  <tr>
			            <th>资料名称</th>
			            <th>说明</th>
			            <th>递交方式</th>
			            <th>状态</th>
			            <th>操作</th>
			          </tr>
				    </thead>
				    <tbody>
				    
				      <tr class="gold_connect">
			           	<td class="view_detail" >
			           		<label>中国资金网融资咨询服务协议加盖公章&nbsp;</label>
			           		<a href="/admin/loan/downloadAttach!downAgreeTemplate.act" target="_blank" style="float:left;">模板下载</a>
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
			          	   <s:if test="apply.agreeFileUpload != null && apply.agreeFileUpload != ''">
			           		<input type="button" class="but_gray" value="下载" onclick="window.open('/admin/loan/downloadAttach!downAgree.act?applyId=${applyId}');"/>
			          	   </s:if>
			           	</td>
			           </tr>
				    
					 	<s:iterator id ="item" value="attachList" status="st">
							<s:if test="#st.even==true">
								<tr id="item_${item.id}" class="odd">
							</s:if>
							<s:else>
								<tr id="item_${item.id}" class="even">
							</s:else>
								<td>
										${item.dataName }
										${item.supplyName }
								</td>
								<td>${item.dataSupply }
								${item.supplyMemo }
								</td>
								<td><common:print valueId="#item.supplyWay"/></td>
					   			<td><common:print valueId="#item.uploadStatus"/></td>
					   			<td class="view_detail">
					   			<s:if test="#item.uploadStatus != 212">	   			
					   				<input type="button" class="but_gray" value="下载" onclick="downloadAttach('${item.id}');"/>
					   			</s:if>
					   			</td>
							</tr>
						</s:iterator>
					 </tbody>
				    </table>
				  </form>
				   <div class="hr_10"> &nbsp;</div>
				<!--弹出框内容登录页面-->  
				<div id="download_attach" style="display:none;" title="文件下载">
				
				</div>   
   			  </div>
   			 </div>
   	</div>
  </div>

</body>
</html>

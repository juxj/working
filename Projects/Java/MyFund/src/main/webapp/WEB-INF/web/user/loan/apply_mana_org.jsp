<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资申请管理</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script language="javascript">
    $(function() {
        $("#timeOne").datepicker();
    	$("#timeTwo").datepicker();
    });
	function doQuery(pageNo) {
		$("#pageNo").val(pageNo);
		$("#financeManage").submit();
	}
   
    function supplyAttach(applyId){
    	$("#apply_id").val(applyId);
    	$("#add_attach").dialog({width:500,modal:true});
    	//$('a.ui-dialog-titlebar-close').hide();  
    }
    function updatestatus(appid,statusid){
    	if (window.confirm('确定要提交吗！')) {
	    	$('#check_apply_id').val(appid);
			$('#apply_status').val(statusid);
			if(statusid == 187){
				$("#apply_check").dialog({width:440,modal:true});
				return;
			}
			
			$('#financeManage').attr('action','/user/loan/userApplyManag!checkAndSearchApply.act');
			$('#financeManage').submit();
			$('#financeManage').attr('action','/user/loan/userApplyManag.act');
    	}
	}
	function inputCheckView(cview){
		$('#check_view').val(cview);
		$('#financeManage').attr('action','/user/loan/userApplyManag!checkAndSearchApply.act');
		$('#financeManage').submit();
		$('#financeManage').attr('action','/user/loan/userApplyManag.act');
	}
	function toPage(pageNum, pageSize){
		var url = '/user/loan/userApplyManag.act?pager.currentPage=' + pageNum + "&pager.pageCount=" + pageSize;
		$('#financeManage').attr('action',url);
		$('#financeManage').submit();
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
  	融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;融资申请管理
  </div>
  <div class="hr_10"> &nbsp; </div>
  <div class="container_950 box_4">
	<div class="P_title" style="border-bottom:5px solid #003961;">融资申请管理</div>
  <form id="financeManage" action="/user/loan/userApplyManag.act" method="post">
	<s:hidden name="apply.id" id="check_apply_id"></s:hidden>
	<s:hidden name="apply.applyStatus" id="apply_status"></s:hidden>
	<s:hidden name="appCheck.checkView" id="check_view"></s:hidden>
	<s:hidden name="userType" value="1"></s:hidden>
	<table style="width:100%;margin:20px;!important display:inline;">
		<tr>
			<td  align="right">申请编号:</td>
			<td style="padding:5px;"><s:textfield name="spModel.applyNum"/></td>
			<td  align="right">融资产品名称:</td>
			<td  style="padding:5px;"><s:textfield name="spModel.productName"/></td>
		</tr>
		<tr>
			<td  align="right">类型:</td>
			<td  style="padding:5px;">
				<common:select name="spModel.applyType" headerKey="" headerValue="--请选择类型--" valueSetId="32"></common:select>
			</td>
			<td  align="right">申请方名称:</td>
			<td  style="padding:5px;"><s:textfield name="spModel.userName"/></td>
		</tr>
		<tr>
			<td  align="right">申请时间:</td>
			<td  style="padding:5px;">
				<s:textfield name="spModel.applyStartDt" id="timeOne" readonly="readonly">
					<s:param name="value"><s:date name="spModel.applyStartDt" format="yyyy-MM-dd"/></s:param> 
				</s:textfield>~
				<s:textfield name="spModel.applyEndDt" id="timeTwo" readonly="readonly">
					<s:param name="value"><s:date name="spModel.applyEndDt" format="yyyy-MM-dd"/></s:param> 
				</s:textfield>
				</td>
			<td  align="right">申请金额:</td>
			<td  style="padding:5px;">
				<s:textfield name="spModel.applyAmountLittle"/>~
				<s:textfield name="spModel.applyAmountBig"/>
			</td>
		</tr>
		<tr>
			<td  align="right">期限:</td>
			<td style="padding:5px;">
				<s:textfield name="spModel.startMonth"/>~
				<s:textfield name="spModel.endMonth"/>
			</td>
			<td  align="right">状态:</td>
			<td  style="padding:5px;">
				<common:select name="spModel.applyStatus" headerKey="" headerValue="--请选择类型--" valueSetId="80"></common:select>
			</td>
		</tr>
		<tr>
			<td colspan="4" ><input type="submit" value="查询" class="but_gray" style="width:100px;"/></td>
		</tr>
	</table>
  </div> 
  <div class="hr_10"> &nbsp; </div> 
        <table class="container_950 box_4">
	      <tr class="top_color">
            <td width="10%" style="padding-left:25px;">申请编号</td>
            <td width="15%">融资产品名称</td>
            <td width="13%">类型</td>
            <td width="13%">申请方名称</td>
            <td width="10%">申请时间</td>
            <td width="8%">申请金额</td>
            <td width="8%">期限</td>
            <td width="13%">状态</td>
            <td width="10%"align="center">操作</td>
          </tr>
          	<s:if test="pager.data.size()>0">
		 	<s:iterator id ="item" value="pager.data">
			<tr class="top_color01">
				<td style="padding-left:25px;">${item.applyNum}</td>
				<td width="120px;">${item.productName}</td>
				<td><common:print valueId="#item.applyType"/></td>
				<td>${item.applyUserName}</td>
	   			<td><s:date name="#item.createdt" format="yyyy-MM-dd"/></td>
				<td><s:number name="loanAmount" />万元</td>
	   			<td>${item.loanMonth}个月</td>
	   			<td><common:print valueId="#item.applyStatus"/></td>			
	   			<td align="right" class="view_detail01" style="padding:5px 20px 5px 0;">
					<a href="/user/loan/userApplyManag!viewFinanceApply.act?apply.id=${item.id }" style="margin-bottom:5px;">查看</a>
	   			</td>
			</tr>
			</s:iterator>
			</s:if>
        </table>
    <div style="width:960px; margin:0 auto; text-align:right;">
       <s:include value="/public/pagination.jsp"/>
    </div>
    </form>
       <div class="container_950 box_4">
			<s:else>
			<div class="l_out">
					<p>
					抱歉！未查询到相符的结果
					</p>
					</div>
			</s:else>
       </div> 
<div id="add_attach" style="display:none;" title="补充材料">
	<form id="uploadForm" action="/user/loan/userApplyManag!addAttach.act" method="post">
	<s:hidden name="apply.id" id="apply_id"></s:hidden>
	<dl>
		<dd>
			<h6>资料名称</h6>
			<s:textfield name="attach.supplyName" cssClass="input-text required"></s:textfield>
		</dd>
		<dd>
			<h6>备注</h6>
			<s:textarea name="attach.supplyMemo" rows="5" cols="70"></s:textarea>
		</dd>
		<dd>
			<h6>递交方式</h6>
			<common:checkbox name="supplyWay"  valueSetId="37"/>
		</dd>
	</dl>
	<div class="hr_10"> &nbsp;</div>
	<div class="center" style="width:200px;">
			<s:submit value="确定" cssClass="but_gray"></s:submit>	
	</div>
	</form>
</div>  
<div id="apply_check" style="display:none;" title="退回申请">
	<dl>
		<dd>
			<h6>处理意见:</h6>
			<textarea rows="5" cols="60" name="checkViewInput" id="checkViewInput"></textarea><br/>
			<input type="button" value="确定" class="but_gray" onclick="if($('#checkViewInput').val().length > 0){inputCheckView($('#checkViewInput').val());$('#apply_check').dialog('close');}else{alert('请输入处理意见！');}"/>
		</dd>
	</dl>
</div>

<!--理财服务产品列表页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>

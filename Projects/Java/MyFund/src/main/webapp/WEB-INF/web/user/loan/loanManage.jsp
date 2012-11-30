<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资意向单管理</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script language="javascript">

    //隔行变色
    $(function() {
    	$("#frmLoanManage").validate();
        $("table.gold-table tr:nth-child(odd)").addClass("gold-table-altrow");
    	$("#timeOne").datepicker();
    	$("#timeTwo").datepicker();
        var index = 0;
		showImg(index);//初始化
        $(".focus .btn span").mouseover(function() {
            index = $(".focus .btn span").index(this);
            showImg(index);
        });
        //滑入停止动画，滑出开始动画.
        $('.focus').hover(function() {
            if (MyTime) {
                clearInterval(MyTime);
            }
        },function() {
            MyTime = setInterval(function() {
                showImg(index);
				index++;
                if (index == 3) {
                    index = 0;
                }
            },3000);
        });
        //自动开始
        var MyTime = setInterval(function() {
            showImg(index);
			 index++;
            if (index == 3) {
                index = 0;
            }
        },3000);
        
       if($("#companyType").val()!=""){
    	   purposeSelect($("#companyType").find("option:selected").attr("id"),$("#sel").val());
       }
    })
    //关键函数：通过控制i，来显示不同的幻灯片
    function showImg(i) {
        $(".img img").eq(i).stop(true, true).fadeIn(800).parent().siblings().find("img").hide();
        $(".btn span").eq(i).addClass("hov").siblings().removeClass("hov");
    }

	function doQuery(pageNo) {
		var form = document.getElementById("frmLoanManage");
		form.submit();
	}
	//推荐产品
	function Recommend(id,appId){
		$("#pro_recommend").dialog({
			width:980,
			height:418,
			modal: true
		});
		$.post("/user/loan/financeProduct!recommendProduct.act",{requestId:id,appId:appId},function(data){
				$("#pro_recommend").html(data);
		});
		return false;
	} 
	//选择推荐产品后提交
	function SelectRecom(){
		var arrChk=$("input[name='checkId']:checked");
		if(arrChk.length>3){
			alert("最多只能推荐3款产品！");
			return false;
		}
		var checkIds = new Array(arrChk.length);
	    for(var j=0;j<arrChk.length;j++){
	    	checkIds[j] = arrChk[j].value
	    }
		$.post("/user/loan/recommendPro!selectRecProdcut.act",{checkId:checkIds.toString(),requestId:$("input[name='requestId']").val()});
		$("#pro_recommend").dialog("close");
	}
	
	//个人用户查看金融机构推荐的贷款产品
	function LookRecPro(id){
		location.href = "/user/loan/recommendPro!lookRecPro.act?requestId="+id;
	}
	//校验筛选条件
	function toPage(pageNum, pageSize){
		var loan1 = $("#loanAmountOne").val();
		var loan2 = $("#loanAmountTwo").val();
		var amount1 = $("#loanMonthOne").val();
		var amount2 = $("#loanMonthTwo").val();
		var time1 = $("#timeOne").val();
		var time2 = $("#timeTwo").val();
		if(loan1=="" && loan2!=""){
			$("#erro").html("请输入完整需求金额范围");
			return false;
		}else if(loan1!="" && loan2==""){
			$("#erro").html("请输入完整需求金额范围");
			return false;
		}else if(loan1 > loan2){
			$("#erro").html("需求金额输入范围有误.前小后大(如：10~20)");
			return false;
		}
		if(amount1=="" && amount2!=""){
			$("#erro").html("请输入完整贷款期限范围");
			return false;
		}else if(amount1!="" && amount2==""){
			$("#erro").html("请输入完整贷款期限范围");
			return false;
		}else if(amount1 > amount2){
			$("#erro").html("贷款期限输入范围有误.前小后大(如：10~20)");
			return false;
		}
		if(time1=="" && time2!=""){
			$("#erro").html("请输入完整发布时间范围");
			return false;
		}else if(time1!="" && time2==""){
			$("#erro").html("请输入完整发布时间范围");
			return false;
		}else if(time1 > time2){
			$("#erro").html("发布时间输入范围有误.前小后大(如：2012-1-1~2018-1-1)");
			return false;
		}
		$("#erro").html("");
		var url = "/user/loan/LoanRequest!loanManage.act?pager.currentPage=" + pageNum + "&pager.pageCount=" + pageSize;
		$('#frmLoanManage').attr('action',url);
		$('#frmLoanManage').submit();
	}
	function onSubmit(){
		var loan1 = $("#loanAmountOne").val();
		var loan2 = $("#loanAmountTwo").val();
		var amount1 = $("#loanMonthOne").val();
		var amount2 = $("#loanMonthTwo").val();
		var time1 = $("#timeOne").val();
		var time2 = $("#timeTwo").val();
		if(loan1=="" && loan2!=""){
			$("#erro").html("请输入完整需求金额范围");
			return false;
		}else if(loan1!="" && loan2==""){
			$("#erro").html("请输入完整需求金额范围");
			return false;
		}else if(loan1 > loan2){
			$("#erro").html("需求金额输入范围有误.前小后大(如：10~20)");
			return false;
		}
		if(amount1=="" && amount2!=""){
			$("#erro").html("请输入完整贷款期限范围");
			return false;
		}else if(amount1!="" && amount2==""){
			$("#erro").html("请输入完整贷款期限范围");
			return false;
		}else if(amount1 > amount2){
			$("#erro").html("贷款期限输入范围有误.前小后大(如：10~20)");
			return false;
		}
		if(time1=="" && time2!=""){
			$("#erro").html("请输入完整发布时间范围");
			return false;
		}else if(time1!="" && time2==""){
			$("#erro").html("请输入完整发布时间范围");
			return false;
		}else if(time1 > time2){
			$("#erro").html("发布时间输入范围有误.前小后大(如：2012-1-1~2018-1-1)");
			return false;
		}
		$("#erro").html("");
		$('#frmLoanManage').submit();
	}
	function purposeSelect(typeId,selected){
		if(typeId != null && typeId != ""){
			$("#loanPurpose").show();
			$.post("/loan/LoanRequest!loanPurposeByTypeId.act",{typeId:typeId,selected:selected},function(data){
				$("#loanPurpose").html(data);
			});
		}else{
			$("#loanPurpose").hide();
		}
	}
</script>
<style>
.ctl {
	table-layout: fixed
}

.ctl td {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	padding: 2px
}
</style>
</head>

<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--开始-->
  <div class="M_menu">
  	<div style="float: left;">融资管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;融资意向单管理</div>
  	<div class="view_detail" style="float: right;margin-top:5px;margin-right:5px;">
  	</div>
  </div>
  <div class="hr_10"> &nbsp; </div>
  <div class="container_950" >
	<div class="box_4">	
		<s:if test="groupType==5">
			<div class="P_title" >融资意向单管理</div>
			<div class="line" style="height:30px;"><input name="" type="button" value="融资意向申请"  class="but_gray" style="float: right; margin-right:20px;" onclick="javascript:window.location.href='/loan/LoanRequest.act?loan.applyType=138'"/></div>
		</s:if>
		<s:elseif test="groupType==1">
			<div class="P_title">融资意向单管理</div>
			<div class="line" style="height:30px;"><input name="" type="button" value="融资意向申请"  class="but_gray" style="float: right; margin-right:20px;" onclick="javascript:window.location.href='/loan/LoanRequest.act?loan.applyType=136'"/></div>
		</s:elseif>
		<s:else>
		<div class="container_950">
			<div class="P_title" style="border-bottom:5px solid #003961;">融资意向单管理</div>
		</div>
	 		</s:else>		
	</div>
  <form id="frmLoanManage" action="/user/loan/LoanRequest!loanManage.act" method="post">
  <input type="hidden" value="<s:property value="requestSearch.loanPurpose"/>" id="sel"/>
  <s:if test="groupType==2 || groupType==3">
  <div class="box_3" >
	<table style="margin:20px;!important display:inline; ">
		<tr>
			<td  align="right">意向编号:</td>
			<td style="padding:5px;"><s:textfield name="requestSearch.applyNum"/></td>
			<td  align="right">需求方名称:</td>
			<td  style="padding:5px;"><s:textfield name="requestSearch.busiName"/></td>
		</tr>
		<tr>
			<td  align="right">类型:</td>
			<td  style="padding:5px;">
				<select id="companyType" onchange="purposeSelect(this.options[this.options.selectedIndex].id,-1)" name="requestSearch.companyType" >
					<option id="-1" value="">--请选择--</option>
					<option id="14" value="136" <s:if test="requestSearch.companyType==136">selected="selected"</s:if>>企业经营快速申请</option>
					<option id="23" value="138" <s:if test="requestSearch.companyType==138">selected="selected"</s:if>>个人经营快速申请</option>
				</select>
			</td>
			<td  align="right">用途:</td>
			<td  style="padding:5px;"><select id="loanPurpose" name="requestSearch.loanPurpose"><option id="" value=''>--请选择--</option></select></td>
		</tr>
		<tr>
			<td  align="right">发布时间:</td>
			<td  style="padding:5px;">
				<s:textfield name="requestSearch.createdtFirst" id="timeOne" readonly="readonly">
					<s:param name="value"><s:date name="requestSearch.createdtFirst" format="yyyy-MM-dd"/></s:param> 
				</s:textfield>~
				<s:textfield name="requestSearch.createdtSecond" id="timeTwo" readonly="readonly">
					<s:param name="value"><s:date name="requestSearch.createdtSecond" format="yyyy-MM-dd"/></s:param> 
				</s:textfield>
			</td>
			<td  align="right">意向金额:</td>
			<td  style="padding:5px;"><s:textfield id="loanAmountOne" name="requestSearch.loanAmountOne" cssClass="digits"/>~<s:textfield id="loanAmountTwo" name="requestSearch.loanAmountTwo" cssClass="digits"/></td>
		</tr>
		<tr>
			<td  align="right">期限:</td>
			<td style="padding:5px;"><s:textfield id="loanMonthOne" name="requestSearch.loanMonthOne" cssClass="digits"/>~<s:textfield id="loanMonthTwo" name="requestSearch.loanMonthTwo" cssClass="digits"/></td>
			<td align="center" id="erro" colspan="2" style="color: red; padding:5px;">
				<label for="loanAmountOne" class="error" generated="true" style="display:none;"></label>
				<label for="loanAmountTwo" class="error" generated="true" style="display:none;"></label>
				<label for="loanMonthOne" class="error" generated="true" style="display:none;"></label>
				<label for="loanMonthTwo" class="error" generated="true" style="display:none;"></label>
			</td>
		</tr>
		<tr>
			<td colspan="4" ><input type="button" onclick="onSubmit();"  class="but_gray"  style="width:100px;" value="查询" /> </td>			
		</tr>
	</table>
  </div>
  </s:if>
  
  <div class="hr_10"> &nbsp;</div>
       <table class="container_950 box_4 ctl">
	      <tr class="top_color">
	        <td width="10%" style="padding-left:20px;">融资意向编号</td>
	        <td width="10%">发布时间</td>
	        <td width="9%">需求金额</td>	        	        
	        <td width="10%">用途</td>
	        <td width="8%">期限</td>	
	        <td width="10%">可接受年利率</td>	                
	        <td width="10%">有效期截止</td>
	        <td width="8%">状态</td>
	        <td align="center">操作</td>
	      </tr>
            <s:if test="pager.data.size()>0">
		 	<s:iterator id ="item" value="pager.data">
			<tr class="gold_connect">
				<td style="padding-left:20px;">${item.applyNum}</td>
	   			<td><s:date name="#item.createdt" format="yyyy-MM-dd"/></td>
	   			<td><s:number name="loanAmount" />万元</td>
	   			<td>
	   				<common:print valueId="#item.loanPurpose" />
	   			</td>
	   			<td>${item.loanMonth}个月</td>
	   			<td>${item.rateLowerLimit}~${item.rateUpperLimit}%</td>
	   			<td>${item.effectiveDateend}</td>
	   			<td><common:print valueId="#item.applyStatus"/></td>
	   			<td align="right">
		   			<div class="view_detail" style="padding:5px 20px 5px 0;">
			   				<span ><a href="/user/loan/LoanRequest!loanManageDetail.act?industryId=${item.id }">查看</a></span>
			   				<span >
				   				<s:if test="groupType==2 || groupType==3">
				   				<a href="#" onclick="return Recommend(${item.id },${item.applyType });">推荐产品</a>
				   				</s:if>	
				   				<s:else>
								<a href="#" onclick="return LookRecPro(${item.id });">查看推荐产品</a>
								</s:else>	   				
			   				</span>	   			
		   			</div>     
	   				<!--  <a href="/user/loan/LoanRequest!loanManageDetail.act?industryId=${item.id }">查看</a><br/>
	   				<s:if test="groupType==2 || groupType==3">
	   				<a href="#" onclick="return Recommend(${item.id },${item.applyType });">推荐产品</a>
	   				</s:if>
	   				<s:else>
	   				<a href="#" onclick="return LookRecPro(${item.id });">查看推荐产品</a>
	   				</s:else>-->
	   			</td>
			</tr>
			</s:iterator>
			 <tr class="top_color">
		        <td style="padding-left:22px; font-size:14px; " colspan="9">
		        <div class="pagination right">
				<s:include value="/public/pagination.jsp"/>
				</div>
				</td>
		   </tr>
			</s:if>
        </table>
       </form>
       <div class="hr_10">&nbsp;</div>
       <s:else>
	   <div class="container_950 box_4">
			<div class="l_out">
					<s:if test="groupType==5">
					<h1 class="l_title">您还未提交过融资意向</h1>
					<p>
					您可以<a href="/loan/LoanRequest.act?loan.applyType=138">点此提交融资意向</a><br/>
					您也可以去<a href="/loan/financeProduct.act?financeType=152&financeDate=12">融资服务频道</a>搜索适合您的融资产品
					</p>
					</s:if>
					<s:elseif test="groupType==1">
					<h1 class="l_title">您还未提交过融资意向</h1>
					<p>
					您可以<a href="/loan/LoanRequest.act?loan.applyType=136">点此提交融资意向</a><br/>
					您也可以去<a href="/loan/financeProduct.act?financeType=151&financeDate=12">融资服务频道</a>搜索适合您的融资产品
					</p>
					</s:elseif>
					<s:elseif test="groupType==2 || groupType==3">
					<p>
					抱歉！未查询到相符的结果
					</p>
					</s:elseif>
					
			</div>
       </div>     
       </s:else>
</div>      
<!--结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>

<!--弹出框内容推荐产品页面-->
<div id="pro_recommend" style="display:none;" title="请选择推荐融资产品："></div>
<!--弹出框内容推荐产品页面-->
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>

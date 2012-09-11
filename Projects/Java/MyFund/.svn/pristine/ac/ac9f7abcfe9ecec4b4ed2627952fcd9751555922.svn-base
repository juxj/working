<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资产品搜索结果页_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/load-loan.js" > </script>
<script language="javascript">
	function toPage(pageNum, pageSize){
		var url = "/loan/financeProduct.act?pager.currentPage=" + pageNum + "&pager.pageCount=" + pageSize;
		$('#searchForm').attr('action',url);
		$('#searchForm').submit();
	}
    //隔行变色
    $(function() {
        $("table.gold-table tr:nth-child(odd)").addClass("gold-table-altrow");
        $("#financePurpose").attr("valueSetId",$("#product_financeType").val());
        $('#searchForm').validate();
        if($("#psel").val()==null || $("#psel").val()==""){
        	$('#child').hide();
        }else{
        	changeIndustry($("#psel").find("option:selected").val(),$("#sel").val())
        }
    });

    function search(){
		$('#searchForm').submit();
	}
    
    function changeIndustry(pid,childId){
    	if(pid != "" && pid != null ){
    		$('#child').show();
    		$.post("/loan/financeProduct!Industry.act",{industryId:pid,childId:childId},function(data){
    			$('#childsel').html(data);
    		})
    		
    	}else{
    		$('#child').hide();
    	}
    }
</script>
<style>
.ctl {
	table-layout: fixed;
}

.ctl td {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	padding: 2px;
}
</style>
</head>

<body>
<!--头部-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
<!--融资服务搜索结果页-->
<div class="M_menu">
<a href="/loan/LoanService.act">融资服务</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;
<s:if test="financeType==151">企业融资产品列表</s:if>
<s:if test="financeType==152">个人融资产品列表</s:if>
</div>
<div class="hr_10"> &nbsp; </div> 
<!--main1-->
<div class="center box_6_gray" style="height:auto; width:908px; padding-left:20px; padding-bottom:10px;">
	<form id="searchForm" action="/loan/financeProduct.act"  method="post">
	<input type="hidden" value="<s:property value="childId"/>" id="sel"/>
	<!-- 收缩状态 -->
	<input id="shrink" type="hidden" name="shrink" value="<s:if test="shrink=='' || shrink == null">filter</s:if><s:else><s:property value="shrink"/></s:else>"/>
	
	<!-- 企业检索 -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td width="60" height="40" valign="middle">类别：</td>
	    <td width="23%" height="40" valign="middle">
				<select name="financeType" style="width:155px;">
				  <s:if test="financeType==151">
                  <option value="151">企业经营贷款</option>
                  </s:if>
                  <s:if test="financeType==152">
                  <option value="152">个人经营性贷款</option>
                  </s:if>
                </select>	    
	    </td>
	    <td width="60" height="40" valign="middle">用途：</td>
	    <td width="21%" height="40" valign="middle">
				<s:if test="financeType==151">
				<common:select headerKey="" headerValue="--不限--" value="purposeType" style="width:155px;" name="purposeType" valueSetId="14"/>
				</s:if>
				<s:if test="financeType==152">
				<common:select headerKey="" headerValue="--不限--" value="purposeType" style="width:155px;" name="purposeType" valueSetId="23"/>
				</s:if>
				&nbsp;&nbsp;&nbsp;&nbsp;	    
	    </td>
	    <td width="60" height="40" valign="middle">期限：</td>
	    <td width="22%" height="40" valign="middle"><s:textfield name="financeDate" id="date" cssClass="input-text required digits" style="width:120px;"/>&nbsp;个月&nbsp;&nbsp;&nbsp;&nbsp;<br/>
			<label for="date" class="error" generated="true" style="display:none;"></label></td>
	    <td width="15%" height="40" align="right" valign="middle"><input type="button" onclick="$('#searchForm').submit()" class="but_gray" value="搜索"/></td>
	  </tr>
	  <tr>
	    <td width="60" height="40" valign="middle">金额：</td>
	    <td height="40" valign="middle"><s:textfield name="financeAmount" id="amount" cssClass="input-text number" style="width:120px;"/>&nbsp;万元<br/>
			<label for="amount" class="error" generated="true" style="display:none;"></label></td>
	    <td width="60" height="40" valign="middle">行业：</td>
	    <td height="40" colspan="4" valign="middle">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td width="190px" ><common:select id="psel" value="industryId" name="industryId" headerKey="" headerValue="--不限--" valueSetMap="ZJ113" onchange="changeIndustry(this.options[this.options.selectedIndex].value,-1)"  style="width:155px;"/></td>
		        <td><span id="child"><select id="childsel" name="childId" style="width:155px;"><option value="-1">--不限--</option></select></span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		      </tr>
		    </table>
	    </td>
	  </tr>
	</table>
	<!-- 
	<table>
		<tr>
			<td align="right" style="padding-right:5px;">类别:</td>
			<td>
				<select name="financeType" style="width:155px;">
				  <s:if test="financeType==151">
                  <option value="151">企业经营贷款</option>
                  </s:if>
                  <s:if test="financeType==152">
                  <option value="152">个人经营性贷款</option>
                  </s:if>
                </select>
			</td>
			<td align="right" style="padding-right:5px;">用途:</td>
			<td>
				<s:if test="financeType==151">
				<common:select headerKey="" headerValue="--请选择类型--" value="purposeType" style="width:155px;" name="purposeType" valueSetId="14"/>
				</s:if>
				<s:if test="financeType==152">
				<common:select headerKey="" headerValue="--请选择类型--" value="purposeType" style="width:155px;" name="purposeType" valueSetId="23"/>
				</s:if>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td>行业:</td>
			<td style="vertical-align: middle;"><common:select id="psel" value="industryId" name="industryId" headerKey="" headerValue="--请选择类型--" valueSetMap="ZJ113" onchange="changeIndustry(this.options[this.options.selectedIndex].value,-1)"  style="float: left; width:155px; margin-right:5px;"/><span id="child"><select id="childsel" name="childId" style="width:155px;"><option value="-1">--请选择--</option></select></span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td align="right" style="padding-right:5px;">期限:</td>
			<td><s:textfield name="financeDate" id="date" cssClass="input-text required digits" />&nbsp;个月&nbsp;&nbsp;&nbsp;&nbsp;<br/>
			<label for="date" class="error" generated="true" style="display:none;"></label> </td>
			<td align="right" style="padding-right:5px;">金额:</td>
			<td><s:textfield name="financeAmount" id="amount" cssClass="input-text required number"/>&nbsp;万元<br/>
			<label for="amount" class="error" generated="true" style="display:none;"></label>
			</td>
			<td  colspan="2" align="center"><input type="button" onclick="$('#searchForm').submit()" class="but_gray" value="搜索" style=" margin-top: 10px;"/></td>
		</tr>
	</table>
	 -->
</div>
<div class="hr_10"> &nbsp; </div>
<!--main1-->
<!--main2-->
	<script type="text/javascript">
		$(function () {
			var box_2 = document.getElementById("box2");
			var box_3 = document.getElementById("filter");
			var box_4 = document.getElementById("box4").getElementsByTagName("span")[0];
			box_3.className = $("#shrink").val();
			if(box_3.className=="boxt"){
				box_4.innerHTML= "收起";
			}
			//console.info("box_3.className=" +box_3.className);
			box_4.onclick=function(){
				box_3.className=(box_3.className=="filter")?"boxt":"filter";
				//console.info("box_3.className=" +box_3.className);
				this.innerHTML=(this.innerHTML=="更多搜索条件")?"收起":"更多搜索条件";
				$("#shrink").attr("value", box_3.className);
			}		
			//选中filter下的所有a标签，为其添加hover方法，该方法有两个参数，分别是鼠标移上和移开所执行的函数。
			$("#filter a").hover(
				function () {
					$(this).addClass("seling");
				},
				function () {
					$(this).removeClass("seling");
				}
			);


			$("#filter dt+dd a").attr("class", "seled"); /*设置(attr)样式，而不是添加样式(addClass)，不然后面通过$("#filter a[class='seled']")访问不到class样式为seled的a标签。*/       

			//为filter下的所有a标签添加单击事件
			$("#filter a").click(function () {
				$(this).parents("dl").children("dd").each(function () {
					$(this).children("div").children("a").removeClass("seled");
				});
				$(this).attr("class", "seled");
				//给input隐藏域设值
				var sname = $(this).attr("name");
				$("#filter input[name="+sname+"]").attr("value",$(this).attr("id"));
				$("#searchForm").submit();
			});
			
			
			//提交表单后,根据input值 选中
			$("#filter a").each(function () {
				$(this).parents("dl").children("dd").each(function () {
					$(this).children("div").children("a").removeClass("seled");
					if($(this).children("div").children("a").attr("id")==$(this).parents("dl").children("dt").children("input").attr("value")){
						$(this).children("div").children("a").attr("class", "seled");
					}
					
				});
			});
		});
		/*
		function RetSelecteds() {
			var result = "";
			$("#filter a[class='seled']").each(function () {
				result += $(this).attr("id")+"\n";
			});
			
			return result;
		}*/
	</script>
	
<!--xianshidebufen-->
	<script type="text/javascript">
		$(function () {	
			//选中filter下的所有a标签，为其添加hover方法，该方法有两个参数，分别是鼠标移上和移开所执行的函数。
			$("#box2 a").hover(
				function () {
					$(this).addClass("seling");
				},
				function () {
					$(this).removeClass("seling");
				}
			);


			$("#box2 dt+dd a").attr("class", "seled"); /*设置(attr)样式，而不是添加样式(addClass)，不然后面通过$("#filter a[class='seled']")访问不到class样式为seled的a标签。*/       

			//为filter下的所有a标签添加单击事件
			$("#box2 a").click(function () {
				$(this).parents("dl").children("dd").each(function () {
					$(this).children("div").children("a").removeClass("seled");
				});
				$(this).attr("class", "seled");
				//给input隐藏域设值
				var sname = $(this).attr("name");
				$("#box2 input[name="+sname+"]").attr("value",$(this).attr("id"));
				$("#searchForm").submit();
			});
			
			
			//提交表单后,根据input值 选中
			$("#box2 a").each(function () {
				$(this).parents("dl").children("dd").each(function () {
					$(this).children("div").children("a").removeClass("seled");
					if($(this).children("div").children("a").attr("id")==$(this).parents("dl").children("dt").children("input").attr("value")){
						$(this).children("div").children("a").attr("class", "seled");
					}
					
				});
			});
			
		});
		/*
		function RetSelecteds() {
			var result = "";
			$("#box2 a[class='seled']").each(function () {
				result += $(this).attr("id")+"\n";
			});
			return result;
		}*/
		function selectDetail(id){
			//console.info("id="+id);
			location.href = "/loan/financeProduct!cusViewFinance.act?product.id="+id;
		}
	</script>
<!--xianshidebufen-->

	<table class="container_950 center box_4">
	      <tr class="top_color">
	        <td style="padding-left:22px; font-size:14px;">推荐产品筛选条件</td>
	      </tr>
	</table>
<!-- start------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->	
	<!-- 企业经营贷款 -->
	<s:if test="financeType==151">
	<div id="main">
	<div id="box2" style="width:933px; padding:5px 0 0 25px;">
    	<dl>
            <dt id="userType">融资渠道：<input name="userType" type="hidden" value="<s:if test="userType==null">-1</s:if><s:else><s:property value="userType"/></s:else>"/></dt>
            <dd><div><a name="userType" id="-1">不限</a></div></dd>
            <dd><div><a name="userType" id="6">银行</a></div></dd>
            <s:iterator value="dataMap['finaceType']" >
            <dd><div><a name="userType" id="<s:property value="id"/>"><s:property value="name"/></a></div></dd>
            </s:iterator>
        </dl>
        <dl>
            <dt id="mortgageType">担保方式：<input name="mortgageType" type="hidden" value="<s:if test="mortgageType==null">-1</s:if><s:else><s:property value="mortgageType"/></s:else>"/></dt>
            <dd><div><a name="mortgageType" id="-1">不限</a></div></dd>
            <s:iterator value="dataMap['mortgageType']" >
            <dd><div><a name="mortgageType" id="<s:property value="id"/>"><s:property value="name"/></a></div></dd>
            </s:iterator>
        </dl>
              
    </div>
	<div class="clear">&nbsp;</div>
    <div id="filter"  class="filter" style="width:933px; padding:0 0 30px 25px;">
   		 <dl>
            <dt id="repaymentType">还款方式：<input name="repaymentType" type="hidden" value="<s:if test="repaymentType==null">-1</s:if><s:else><s:property value="repaymentType"/></s:else>"/></dt>
            <dd><div><a name="repaymentType" id="-1">不限</a></div></dd>
            <s:iterator value="dataMap['repaymentType']" >
            <dd><div><a name="repaymentType" id="<s:property value="id"/>"><s:property value="name"/></a></div></dd>
            </s:iterator>
        </dl>
        <dl>
            <dt id="checkTime">审批时间：<input name="checkTime" type="hidden" value="<s:if test="checkTime==null">-1</s:if><s:else><s:property value="checkTime"/></s:else>"/></dt>
            <dd><div><a name="checkTime" id="-1">不限</a></div></dd>
            <dd><div><a name="checkTime" id="0,3">3天以内</a></div></dd>
            <dd><div><a name="checkTime" id="3,7">3-7天</a></div></dd>
            <dd><div><a name="checkTime" id="7,15">7-15天</a></div></dd>
            <dd><div><a name="checkTime" id="15,30">15-30天</a></div></dd>
        </dl> 
        <dl>
            <dt id="companyAllAsset">企业总资产：<input name="companyAllAsset" type="hidden" value="<s:if test="companyAllAsset==null">-1</s:if><s:else><s:property value="companyAllAsset"/></s:else>"/></dt>
            <dd><div><a name="companyAllAsset" id="-1">不限</a></div></dd>
            <dd><div><a name="companyAllAsset" id="0,100">不足100万</a></div></dd>
            <dd><div><a name="companyAllAsset" id="100,300">100-300万</a></div></dd>
            <dd><div><a name="companyAllAsset" id="300,500">300-500万</a></div></dd>
            <dd><div><a name="companyAllAsset" id="500,1000">500-1000万</a></div></dd>
            <dd><div><a name="companyAllAsset" id="1000,5000">1000-5000万</a></div></dd>
            <dd><div><a name="companyAllAsset" id="5000,-1">5000万及以上</a></div></dd>            
        </dl>
        <dl>
            <dt id="operatIncome">企业年营业收入：<input name="operatIncome" type="hidden" value="<s:if test="operatIncome==null">-1</s:if><s:else><s:property value="operatIncome"/></s:else>"/></dt>
            <dd><div><a name="operatIncome" id="-1">不限</a></div></dd>
            <dd><div><a name="operatIncome" id="0,300">300万以下</a></div></dd>
            <dd><div><a name="operatIncome" id="300,500">300~500万</a></div></dd>
            <dd><div><a name="operatIncome" id="500,1000">500~1000万</a></div></dd>
            <dd><div><a name="operatIncome" id="1000,5000">1000~5000万</a></div></dd>
            <dd><div><a name="operatIncome" id="5000,10000">5000~10000万</a></div></dd>
            <dd><div><a name="operatIncome" id="10000,-1">10000万以上</a></div></dd>            
        </dl> 
        <dl>
            <dt id="settingYear">企业成立年数：<input name="settingYear" type="hidden" value="<s:if test="settingYear==null">-1</s:if><s:else><s:property value="settingYear"/></s:else>"/></dt>
            <dd><div><a name="settingYear" id="-1">不限</a></div></dd>
            <dd><div><a name="settingYear" id="1">1年</a></div></dd>
            <dd><div><a name="settingYear" id="2">2年</a></div></dd>
            <dd><div><a name="settingYear" id="3">3年</a></div></dd>
            <dd><div><a name="settingYear" id="4">4年</a></div></dd>
            <dd><div><a name="settingYear" id="5">5年及以上</a></div></dd>            
        </dl>
    </div>
    <div id="box4"><span>更多搜索条件</span></div>
    </div>
    </s:if>
   
    <!-- 个人经营性贷款 -->
    <s:if test="financeType==152">
	<div id="main">
	<div id="box2" style="width:933px; padding:5px 0 0 25px;">
    	<dl>
            <dt id="userType">融资渠道：<input name="userType" type="hidden" value="<s:if test="userType==null">-1</s:if><s:else><s:property value="userType"/></s:else>"/></dt>
            <dd><div><a name="userType" id="-1">不限</a></div></dd>
            <dd><div><a name="userType" id="6">银行</a></div></dd>
            <s:iterator value="dataMap['finaceType']" >
            <dd><div><a name="userType" id="<s:property value="id"/>"><s:property value="name"/></a></div></dd>
            </s:iterator>
        </dl>
        <dl>
            <dt id="mortgageType">担保方式：<input name="mortgageType" type="hidden" value="<s:if test="mortgageType==null">-1</s:if><s:else><s:property value="mortgageType"/></s:else>"/></dt>
            <dd><div><a name="mortgageType" id="-1">不限</a></div></dd>
            <s:iterator value="dataMap['mortgageType']" >
            <dd><div><a name="mortgageType" id="<s:property value="id"/>"><s:property value="name"/></a></div></dd>
            </s:iterator>
        </dl>
    </div>
	<div class="clear">&nbsp;</div>
    <div id="filter"  class="filter" style="width:933px; padding:0 0 30px 25px;">
        <dl>
            <dt id="repaymentType">还款方式：<input name="repaymentType" type="hidden" value="<s:if test="repaymentType==null">-1</s:if><s:else><s:property value="repaymentType"/></s:else>"/></dt>
            <dd><div><a name="repaymentType" id="-1">不限</a></div></dd>
            <s:iterator value="dataMap['repaymentType']" >
            <dd><div><a name="repaymentType" id="<s:property value="id"/>"><s:property value="name"/></a></div></dd>
            </s:iterator>
        </dl>
        <dl>
            <dt id="checkTime">审批时间：<input name="checkTime" type="hidden" value="<s:if test="checkTime==null">-1</s:if><s:else><s:property value="checkTime"/></s:else>"/></dt>
            <dd><div><a name="checkTime" id="-1">不限</a></div></dd>
            <dd><div><a name="checkTime" id="0,3">3天以内</a></div></dd>
            <dd><div><a name="checkTime" id="3,7">3-7天</a></div></dd>
            <dd><div><a name="checkTime" id="7,15">7-15天</a></div></dd>
            <dd><div><a name="checkTime" id="15,30">15-30天</a></div></dd>
        </dl> 
        <dl>
            <dt id="needEnsure">保证金：<input name="needEnsure" type="hidden" value="<s:if test="needEnsure==null">-1</s:if><s:else><s:property value="needEnsure"/></s:else>"/></dt>
            <dd><div><a name="needEnsure" id="-1">不限</a></div></dd>
            <dd><div><a name="needEnsure" id="1">需要</a></div></dd>
            <dd><div><a name="needEnsure" id="0">不需要</a></div></dd>
        </dl>
        <dl>
            <dt id="operatIncome">年营业额：<input name="operatIncome" type="hidden" value="<s:if test="operatIncome==null">-1</s:if><s:else><s:property value="operatIncome"/></s:else>"/></dt>
            <dd><div><a name="operatIncome" id="-1">不限</a></div></dd>
            <dd><div><a name="operatIncome" id="0,300">100万以下</a></div></dd>
            <dd><div><a name="operatIncome" id="300,500">100~500万</a></div></dd>
            <dd><div><a name="operatIncome" id="500,1000">500~1000万</a></div></dd>
            <dd><div><a name="operatIncome" id="1000,-1">1000万以上</a></div></dd>            
        </dl> 
        <dl>
            <dt id="experience">申请人行业经验：<input name="experience" type="hidden" value="<s:if test="experience==null">-1</s:if><s:else><s:property value="experience"/></s:else>"/></dt>
            <dd><div><a name="experience" id="-1">不限</a></div></dd>
            <dd><div><a name="experience" id="1,3">1年~3年</a></div></dd>
            <dd><div><a name="experience" id="3,5">3~5年</a></div></dd>
            <dd><div><a name="experience" id="5,10">5~10年</a></div></dd>
            <dd><div><a name="experience" id="10,20">10~20年</a></div></dd>
            <dd><div><a name="experience" id="20,-1">20年及以上</a></div></dd>            
        </dl>
        <dl>
            <dt id="runningArea">经营场所：<input name="runningArea" type="hidden" value="<s:if test="runningArea==null">-1</s:if><s:else><s:property value="runningArea"/></s:else>"/></dt>
            <dd><div><a name="runningArea" id="-1">不限</a></div></dd>
            <dd><div><a name="runningArea" id="1">有</a></div></dd>
            <dd><div><a name="runningArea" id="0">无</a></div></dd>
        </dl>
        <dl>
            <dt id="creditAcount">信用记录：<input name="creditAcount" type="hidden" value="<s:if test="creditAcount==null">-1</s:if><s:else><s:property value="creditAcount"/></s:else>"/></dt>
            <dd><div><a name="creditAcount" id="-1">不限</a></div></dd>
            <dd><div><a name="creditAcount" id="1">有</a></div></dd>
            <dd><div><a name="creditAcount" id="0">无</a></div></dd>
        </dl>
        <dl>
            <dt id="bankSalaryList">银行流水：<input name="bankSalaryList" type="hidden" value="<s:if test="bankSalaryList==null">-1</s:if><s:else><s:property value="bankSalaryList"/></s:else>"/></dt>
            <dd><div><a name="bankSalaryList" id="-1">不限</a></div></dd>
            <dd><div><a name="bankSalaryList" id="1">有</a></div></dd>
            <dd><div><a name="bankSalaryList" id="0">无</a></div></dd>
        </dl>
    </div>
    <div id="box4"><span>更多搜索条件</span></div>
    </div>
    </s:if>
    
    
<!-- 货款类型end------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
<!--main2-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--main3-->
<table class="container_950 center box_4"> 
      <tr class="top_color">
        <td class="capital_table_a1" style="padding-left:20px;">融资渠道/项目</td>
        <td class="capital_table_a3">金额</td>
        <td class="capital_table_a2" >期限</td>
        <td class="capital_table_a3" >基准年利率</td>
        <td class="capital_table_a3">浮动范围</td>
        <td class="capital_table_a3" >还款方式</td>
        <td class="capital_table_a3" >产品特点</td>
        <td class="capital_table_a3" >审批时间</td>
        <td ></td>
      </tr>
      <s:if test="pager.data.size() > 0">
      <s:iterator value="pager.data">
      <tr class="capital_table" >
        <td class="capital_table_a1" style="padding-left:10px;word-wrap:break-word;word-break:break-all;">
        <s:if test="logo == null">
	        <img src="/images/banklogo/zj198.jpg"  class="td_img" style="white-space: nowrap; padding-top:2px;"/>
        </s:if>
        <s:else>
        	<img src="/images/banklogo/${logo }"  class="td_img" style="white-space: nowrap; padding-top:2px;"/>
        </s:else>
        <div style="padding-left:45px;">        
        	<common:print valueId="userId" type="user"/><br/>
        	${financeName }
        </div>
        </td>
        <td class="capital_table_a3" ><s:number name="financeLittleamount" />~<s:number name="financeBigamount" />万元
        </td>       
        <td class="capital_table_a2"><s:property value="financeDate"/>个月</td>
        <td class="capital_table_a3" title="<common:print valueId="interestType" />">
        	<common:print valueId="financeDate" type="rate"/>%
        	<s:if test="serviceCost != null && serviceCost > 0">
        		<br/>另收${serviceCost }%服务费
        	</s:if>
        </td>   
        <td class="capital_table_a3" title="<common:print valueId="interestType" />">
        	<s:if test="interestType == 155">
        		<s:iterator value="interests">
        			<s:if test="financeDate > financeStartdt && financeDate <= financeEnddt">
        				+${rateUp }%
        			</s:if>
        		</s:iterator>
        	</s:if>
        	<s:else>
        		视具体情况而定
        	</s:else>
        </td>
        <td class="capital_table_a3" title="<common:print valueId="repaymentType" />"><common:print valueId="repaymentType" /></td>
       	<td class="capital_table_a3" title="<common:print valueId="proSpecial" />"><common:print valueId="proSpecial" /></td>
        <td class="capital_table_a3">${checkTime}个工作日</td>
        <td class="view_detail capital_table_a3 " style="padding-right:20px;">
        	<a href="/loan/financeProduct!cusViewFinance.act?product.id=${id}" target="_blank">查看</a>
        </td>
      </tr>
      </s:iterator>
      <tr class="top_color">
	        <td style="padding-left:22px; font-size:14px;" colspan="9">
	        <div class="pagination right">
			<s:include value="/public/pagination.jsp"/>
			</div>
			</td>
	   </tr>
      </s:if>
	</table>
	<div class="hr_10">&nbsp;</div>
      <s:else>
	      <div class="container_950 box_4">
			<div class="l_out">
					<p>
					抱歉！未查询到相符的结果
					</p>
			</div>
       </div>     
      </s:else>
	

	</form>
<!--main3-->
<!--融资服务搜索结果页--> 
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>

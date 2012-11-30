<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人经营性贷款快速申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/load-loan.js" > </script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    })
})

$(function(){
	$("#loanForm").validate();/*
	document.getElementsByName('loan.repaymentType')[0].checked=true;
	document.getElementsByName('loan.teachLevel')[0].checked=true;
	document.getElementsByName('loan.workTime')[0].checked=true;*/
});
</script>
<script language="javascript">
/*
			var XMLHttpReq;//用于获取服务端返回的XML序列
		 	//创建XMLHttpRequest对象
		    function createXMLHttpRequest() {
				if(window.XMLHttpRequest) { //Mozilla 浏览器
					XMLHttpReq = new XMLHttpRequest();
				}
				else if (window.ActiveXObject) { // IE浏览器
					try {
						XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
					} catch (e) {
						try {
							XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
						} catch (e) {}
					}
				}
			}
			//发送请求函数
			function sendRequest(url) {
				createXMLHttpRequest();
				XMLHttpReq.open("GET", url, true);
				XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
				XMLHttpReq.send(null);  // 发送请求
			}
			// 处理返回信息函数
		    function processResponse() {
		    	if (XMLHttpReq.readyState == 4) { // 判断对象状态
		        	if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
						updateList();
				    } else { //页面不正常
				      	alert("您所请求的页面有异常。");
				    }
		        }
		    }
			//更新菜单函数
			function updateList() {
			    var industry=XMLHttpReq.responseXML.getElementsByTagName("inds");
			    var list = document.getElementById("childID");
		        for(var i=0;i<industry.length/2;i++){
		        	list.add(new Option(industry[2*i+1].firstChild.data,industry[2*i].firstChild.data));
		        }
			}
			
			// 创建级联菜单函数
			function showList(obj) {
				clearList();
				sendRequest("/loan/LoanRequest!Industry.act?industryId=" + obj);
			}
		
			function clearList()
			{
				var list = document.getElementById("childID");
				list.options.length=0;
		    	list.add(new Option("---请选择---",""));
			}
			
*/
			function changeindustry(industryParent,industry){
				if($("#"+industryParent).val()=='0'){
					$("#"+industry).html("<option value='0'>--请选择--</option>");
					$("#"+industry).hide();
				}else{
					$.post("/DataCommon!findIndustry.act",{industryId:$("#"+industryParent).val()},function(a){
						$("#"+industry).show();
						$("#"+industry).html('<option value="0">--请选择--</option>');
						$("#"+industry).append(a);
					});
				}
			}
		</script>
  </head>
  
  <body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="apply_title" >
	<p>个人经营性贷款需求意向单</p>
	<div class="apply_menu">
        <div class="apply_menu_text01" >1、填写申请信息</div>
        <div class="apply_menu_text02">2、完善需求</div>
        <div class="apply_menu_text03">3、申请成功</div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<form action="/loan/LoanRequest!loanSecond.act" id="loanForm" style="width:950px; margin:0px;" class="box_form">

<s:hidden name="loan.applyType" value="138"></s:hidden>
	<div class="apply_form_title">第一步&nbsp;&nbsp;填写申请信息</div>
	<div class="C_title">贷款需求信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span>
	</div>
	<div class="hr_20"> &nbsp; </div>
	<div class="C_form">
            <dl>
              <dd style="width:850px;">
                <h6><span class="txt-impt">*</span>贷款用途：</h6>
                <s:select name="loan.loanPurpose" list="dataMap['loanpurpose']" listKey="id" listValue="name" cssClass="S_width" style="width:200px;"></s:select>
                <h6><span class="txt-impt">*</span>贷款金额：</h6>
                <s:textfield name="loan.loanAmount" cssClass="input-text required digits" id="loan_loanAmount" size="10" maxlength="6"></s:textfield>&nbsp;&nbsp;万元
                <label for="loan_loanAmount" class="error" generated="true" style="display:none;"></label>
              </dd>
              <dd>
                <h6><span class="txt-impt">*</span>贷款期限：</h6>
                <s:textfield name="loan.loanMonth" cssClass="input-text required digits" id="loan_loanMonth" size="10" maxlength="2"></s:textfield>&nbsp;个月
                <label for="loan_loanMonth" class="error" generated="true" style="display:none;"></label>
              </dd>
              <dd>
                <h6><span class="txt-impt">*</span>是否有抵押物：</h6>
                <s:radio value="1" name="loan.haveMortgage" list="%{#{1:'能提供',0:'无法提供'}}" cssClass="required"></s:radio>
				  <label for="loan.haveMortgage" class="error" generated="true" style="display:none;"></label>
				</dd>
			 </dl>
	</div>
	<div class="clear"></div>
	<div class="C_title">个人及经营信息</div>
	<div class="hr_20"> &nbsp; </div>
	<div class="C_form">
		<dl>
			
			<dd>
				<h6><span class="txt-impt">*</span>行业：</h6>
				<s:select id="industryParent" name="loan.runningTrade" list="industryList" listKey="id" listValue="name" headerKey="" headerValue="--请选择--"  onchange="changeindustry('industryParent','industry');" cssClass="required"></s:select>
                <select id="industry" name="loan.runningTradeChild">
         	      <option value="0">--请选择--</option>
         	      <s:iterator value="industry">
			        <option value="${id}">${name}</option>
		          </s:iterator>
               </select>
               <label for="industryParent" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>行业经验：</h6> 
				<s:textfield name="loan.experience" cssClass="input-text required"  maxlength="3" id="loan.experience"></s:textfield>&nbsp;&nbsp;年
				<label for="loan.experience" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>年营业额：</h6>
				<s:select name="loan.allyearVolume" list="dataMap['allyearsales']" listKey="id" listValue="name" cssClass="S_width"></s:select>
				<label for="loan.allyearVolume" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>经营场所：</h6>
				<s:radio value="1" name="loan.runningArea" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
				<label for="loan.runningArea" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>银行借款经历：</h6>
				<s:radio value="1" name="loan.hostoryLoan" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
				<label for="loan.hostoryLoan" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>使用信用卡经历：</h6>
				<s:radio value="1" name="loan.userCreditCard" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
				<label for="loan.userCreditCard" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>银行流水：</h6>
				<s:radio value="1" name="loan.bankSalaryList" list="%{#{1:'能提供',0:'无法提供'}}" cssClass="required"></s:radio>
				<label for="loan.bankSalaryList" class="error" generated="true" style="display:none;"></label>
			</dd>
		</dl>
		<div class="hr_10"> &nbsp; </div>
		<div class="center" style="width:200px;">
		<s:submit value="下一步"  cssClass="btnsub bred" style="width:200px;"></s:submit>
		</div>
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
</form>
	</div>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<div class="clear"> &nbsp; </div>
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>

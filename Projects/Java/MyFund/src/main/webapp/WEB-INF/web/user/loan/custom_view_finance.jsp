<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><common:print valueId="product.userId" type="user"/>${product.financeName }</title>
<meta name="keywords" content='<s:if test="productAreaList.size()==0">全国</s:if><s:else><s:iterator value="productAreaList" id="item">${item.name },</s:iterator></s:else><common:print valueId="product.financeType" />'/>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.tabs.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript" src="/script/load-loan.js" > </script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
	$("#view_tabs").tabs();
	finance_type_chenge('${product.financeType}');
});
function finance_type_chenge(financeType){
	if(financeType == '151'){
		$('.finance_type_152').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').hide();
		$('.finance_type_151').show();
	}else if(financeType == '152'){
		$('.finance_type_151').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').hide();
		$('.finance_type_152').show();
	}else if(financeType == '153'){
		$('.finance_type_151').hide();
		$('.finance_type_152').hide();
		$('.finance_type_154').hide();
		$('.finance_type_153').show();
	}else if(financeType == '154'){
		$('.finance_type_151').hide();
		$('.finance_type_152').hide();
		$('.finance_type_153').hide();
		$('.finance_type_154').show();
	}
}
var settime=60;
var i;
var showthis;
function update(num) {
 if(num==settime) {
	  $("#sendmobile").attr('disabled',false);
	  $("#sendmobile").attr("value","点击发送验证码（1分钟内只能发送一次）");
	 }else {
	  showthis=settime-num;
	  $("#sendmobile").attr("value","重新发送("+showthis+")");
	 }
}
function verMobile(pid){
	var url = '/user/loan/financeApply.act?product.id=' + pid;
	$.post("/user/Profile!validMoblie.act",{verifycode:$('#verifycode').val()},function(a){
		if(a=='success'){
			$("#mobileMsg").html("手机验证成功");
			window.location.href= url;
		}else{
			$("#mobileMsg").html(a);
		}
	});
}
function sendMobileMsg(){
	  $("#sendmobile").attr('disabled',true);
	  for(i=1;i<=settime;i++)   {
	     setTimeout("update("+i+")",i*1000);
	  }
		$.post("/Account!sendMoblie.act",function(a){
			if(a!='success'){
				$("#mobileMsg").html(a);
			}else{
				alert("手机验证码已发送");
				//$("#mobileMsg").html(a);
			}
		});
	}
function vershow(){
	$("#pop_verCode").dialog({
		width:500,
		modal:true
	});
	$("#isPhoneCheck").dialog('close');
}
function applyRN(pid){
	var url = '/user/loan/financeApply.act?product.id=' + pid;
	if('${session._user}'=='' || '${session._user}'== null){
		window.location= url;
	}else{
		if('${session._user.activetype}' ==0 || '${session._user.activetype}' ==1){
			$("#isPhoneCheck").dialog({
				width:500,
				modal:true
			});
			/*
			if(confirm("尊敬的用户：\
			    \n    建议您在提交融资申请前验证您的注册手机号，以便资金网工作人员及时和您联系！验证成功后，您的融资申请将被优先处理！")){
				vershow();
				return false;
			}else{
				window.location= url;
				return true;
			}*/
		}else{
			window.location= url;
		}
	}
}

function cancelCheck(pid){
	var url = '/user/loan/financeApply.act?product.id=' + pid;
	window.location= url;
}
</script>

  </head>
  
  <body>
<!-- 是否进行手机验证 -->
<div id="isPhoneCheck" style="display:none;" title="手机验证">
  <div class="user_login01">
    <div class="clear"> &nbsp; </div>
    <div class="user_login01_content">
       <div class="on">
          <table>
   	  		<tr>
   	  			<td class="box_2">
					尊敬的用户：<br/>
			     建议您在提交融资申请前验证您的注册手机号，以便资金网工作人员及时和您联系！验证成功后，您的融资申请将被优先处理！
				</td>
			</tr>
            <tr><td align="center"><input type="button" onclick="javascript:vershow();" class="but_gray" style="width:90px;" value="立即验证  " />
            <input type="button" onclick="cancelCheck(${product.id})" class="but_gray" style="width:90px;" value="跳过验证" />
            </td></tr>
            </table>
        </div>
	  </div>
	</div>
</div>
<!--弹出框内容手机验证-->
<div id="pop_verCode" style="display:none;" title="手机验证">
  <div class="user_login01">
    <div class="clear"> &nbsp; </div>
    <div class="user_login01_content">
       <div class="on">
          <table>
            <tr><td><h6>验证码：</h6><input id="verifycode" type="text" name="verifycode" class="input-text" size="20" />
          	<input id="sendmobile" type="button" class="but_gray" onclick="sendMobileMsg();" value="点击发送验证码（1分钟内只能发送一次）"/>
            </td></tr>
   	  		<tr><td><span id="mobileMsg" style="color: red">提示：验证手机可以使您用中国资金网的各项功能</span></td></tr>
            <tr><td><h6>&nbsp;</h6><input type="button" onclick="javascript:verMobile(${product.id});" class="but_gray" style="width:90px;" value="确定" /></td></tr>
            </table>
        </div>
	  </div>
	</div>
</div>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="M_menu">
  	<a href="/loan/LoanService.act">融资服务</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;
	<s:if test="product.financeType==151"><a href="/loan/financeProduct.act?financeType=151&financeDate=12">企业融资产品列表</a></s:if>
	<s:if test="product.financeType==152"><a href="/loan/financeProduct.act?financeType=152&financeDate=12">个人融资产品列表</a></s:if>
	&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;产品详情
</div>
<div class="hr_10"> &nbsp; </div>
<form action="#" id="loanForm" cssClass="box_form" style="margin:0px;" >
<s:hidden name="product.id"></s:hidden>
<s:hidden name="product.proStatus" id="product_prostatus"></s:hidden>
<div class="M_out">
  	<div class="M_out_L">
        <!--表格部分开始-->
        <table border="0" cellspacing="0" cellpadding="0" class="Search_table">
          <tr>
          <td colspan="4" style="padding:20px 0 10px 20px;">
          <div class="fl">	
						<s:if test="product.logo == null">
					        <img src="/images/banklogo/b/zj198.jpg" style="white-space: nowrap;" />
				        </s:if>
				        <s:else>
				        	<img src="/images/banklogo/b/${product.logo }" />
				        </s:else></div>
		  <div class="Search_t_title red">&nbsp; ${product.financeName }</div>
		  </td>
          </tr>
          <tr>
            <td class="Search_t_connect">类型</td>
            <td class="Search_t_connect01"><common:print valueId="product.financeType" /></td>
            <td class="Search_t_connect">金额</td>
            <td class="Search_t_connect01"><s:number name="product.financeLittleamount" /> ~ <s:number name="product.financeBigamount" />万元</td>
          </tr>
          <tr>
            <td class="Search_t_connect">期限</td>
            <td class="Search_t_connect01">${product.financeLittledt } ~ ${product.financeMostdt }个月</td>
            <td class="Search_t_connect">服务费率</td>
            <td class="Search_t_connect01">${product.serviceCost }</td>
          </tr>
          <tr>
            <td class="Search_t_connect" >利率说明</td>
            <td colspan="3" style="padding:10px;">
            	<s:if test="product.interests.size > 0">
	             <div>
					<table class="Search_table1">
						<tr>
							<td width="33%" align="center" bgcolor="#CBDE9D">贷款期限</td>
							<td width="33%" align="center" bgcolor="#91CEF4">基准利率</td>
							<td width="33%" align="center" bgcolor="#F2DADB">浮动范围</td>
						</tr>
						<s:iterator value="product.interests" id="item">
						<tr>
							<td width="33%" align="center">
								${item.interestMemo }
							</td>
							<td width="33%" align="center">
								<common:print valueId="#item.financeEnddt" type="rate"/>%
							</td>
							<td width="33%" align="center">
		                    	<s:if test="product.interestType == 155">
													+${item.rateUp }%
		                    	</s:if>
		                    	<s:else>
		                    		视具体情况而定
		                    	</s:else>
							</td>
						</tr>
						</s:iterator>
					</table>
				</div>
				</s:if>
            </td>
          </tr>
          <tr>
            <td class="Search_t_connect">还款方式</td>
            <td class="Search_t_connect01"><common:print valueId="product.repaymentType" /></td>
            <td class="Search_t_connect">担保方式</td>
            <td class="Search_t_connect01"><common:print valueId="product.mortgageType" /></td>
          </tr>
          <tr>
            <td class="Search_t_connect">放款时间</td>
            <td class="Search_t_connect01">${product.checkTime }个工作日</td>
            <td class="Search_t_connect">面向区域</td>
            <td class="Search_t_connect01">
                    	<s:if test="productAreaList.size()==0">
	                	全国
	                	</s:if>
	                	<s:else>
		                		<s:iterator value="productAreaList" id="item">
		                			${item.name }
		                		</s:iterator>
	                	</s:else>            
            </td>
          </tr>
          <tr>
            <td colspan="4" class="Search_t_title" align="center" ><input type="button" value="立即申请" class="btnsub bred" onclick="applyRN(${product.id})" ></input></td>
          </tr>
        </table>
        <!--表格部分结束-->
	<div class="hr_10"> &nbsp; </div>
	<div id="view_tabs" style="min-height:380px;">
		<ul>
			<li><a href="#view_tabs-1">产品介绍</a></li>
			<li><a href="#view_tabs-2">申请条件</a></li>
			<li><a href="#view_tabs-3">申贷资料</a></li>
		</ul>
		<div id="view_tabs-1">
			<div style="font-size : 12px; ">
	            <div style="color:#97181d; font-weight:bolder; background:none;">产品简介</div>
	            <div style="color:#424240; padding-left:15px;font-weight:normal;">${product.proIntroduce }</div>
	            <div style="color:#97181d; font-weight:bolder; background:none;">产品特色</div>
	            <div style="background:none; color:#424240; padding-left:15px;font-weight:normal;"><common:print valueId="product.proSpecial" /></div>
			</div>
		</div>
		<div id="view_tabs-2">
			<div style="font-size:12px; ">
				  <p class="finance_type_151 finance_type_152">
	                <tr  style="font-weight:bolder; ">申请企业所属行业：</tr>
	                	<s:if test="productIndustryList.size()==0">
	                		不限
	                	</s:if>
	                	<s:else>
	                	<s:iterator value="productIndustryList" id="item" status="st">
	                	${item.name }
	                	<s:if test="#st.last != true">
						<tr>&nbsp;</tr>
						</s:if>
	                	</s:iterator>
	                	</s:else>
	              </p>
	              <p class="finance_type_151 finance_type_152">
	                <tr style="color:#97181d; font-weight:bolder; ">企业的总资产：</tr>
	                <common:print valueId="product.companyAllAsset" valueSetMap="ZJ112"/>
	              </p>
	              <p class="finance_type_151">
	                <tr  style="color:#97181d; font-weight:bolder; ">企业的年营业收入：</tr>
	                <common:print valueId="product.operatIncome" valueSetMap="ZJ104"/>
	              </p>
	              <p class="finance_type_151">
	                <tr  style="color:#97181d; font-weight:bolder; ">企业成立年数：</tr>
	                <common:print valueId="product.settingYear" valueSetMap="ZJ105"/>
	              </p>
	              <p style="display:none;" class="finance_type_152">
	                <tr  style="color:#97181d; font-weight:bolder; ">保证金：</tr>
	                <common:print valueId="product.needEnsure" valueSetMap="ZJ101"/>
	              </p>
	              <p style="display:none;" class="finance_type_152">
	                <tr  style="color:#97181d; font-weight:bolder; ">申请人行业经验：</tr>
	                <common:print valueId="product.experience" valueSetMap="ZJ106"/>
	              </p>
	              <p style="display:none;" class="finance_type_152">
	                <tr  style="color:#97181d; font-weight:bolder; ">经营场所：</tr>
	                <common:print valueId="product.runningArea" valueSetMap="ZJ103"/>
	              </p>
	              
	              <p style="display:none;" class="finance_type_153 finance_type_154">
	                <tr  style="color:#97181d; font-weight:bolder; ">申请人月工资收入：</tr>
	                <common:print valueId="product.salaryIncome" valueSetMap="ZJ107"/>
	              </p>
	              <p style="display:none;" class="finance_type_153 finance_type_154">
	                <tr  style="color:#97181d; font-weight:bolder; ">工资发放形式：</tr>
	                <common:print valueId="product.salaryPutWay" valueSetMap="ZJ108"/>
	              </p>
	              <p style="display:none;" class="finance_type_153 finance_type_154">
	                <tr  style="color:#97181d; font-weight:bolder; ">现单位工作时长：</tr>
	                <common:print valueId="product.workTime" valueSetMap="ZJ109"/>
	              </p>
	              <p style="display:none;" class="finance_type_153 finance_type_154">
	                <tr  style="color:#97181d; font-weight:bolder; ">所在地自有房产：</tr>
	                <common:print valueId="product.house" valueSetMap="ZJ103"/>
	              </p>
	              <p style="display:none;" class="finance_type_152 finance_type_153 finance_type_154">
	                <tr  style="color:#97181d; font-weight:bolder; ">信用记录：</tr>
	                <common:print valueId="product.creditAcount" valueSetMap="ZJ103"/>
	              </p>
	              <p style="display:none;" class="finance_type_152 finance_type_153 finance_type_154">
	                <tr  style="color:#97181d; font-weight:bolder; ">银行流水：</tr>
	                <common:print valueId="product.bankSalaryList" valueSetMap="ZJ103"/>
	              </p>
	              
	              <p >
	                <tr style="color:#97181d; font-weight:bolder; ">其他申请条件：</tr>
	                <s:if test="product.otherRequire ==null || product.otherRequire == ''">
	                	无
	                </s:if>
	                <s:else>
		                ${product.otherRequire }
	                </s:else>
	              </p>
			</div>
		</div>
		<div id="view_tabs-3">
			<div style="font-size : 12px;">
				<s:if test="product.dataFiles.size() > 0">
					<%int i =1; %>
					<s:iterator value="product.dataFiles" id="item">
						<div style="background:none;">${item.dataName }
						<s:if test="item.dataSupply != null">(${item.dataSupply })</s:if>
						</div>
						<s:if test="haveMemo == 1">
							<div style="background:none; padding-left:15px;">${item.otherMemo }</div>
						</s:if>
					</s:iterator>
	            </s:if>
			</div>
		</div>
    </div>
  </div>
  <!--融资服务搜索结果页产品详情页面结束--> 

  	<div class="M_out_right fr">
    	<div class="M_out_right_text fr " >
	    	<!--客服图片-->
			<div><a href="#"><img src="/images/loan_service_tel.jpg" /></a></div>
	    	<!--客服图片-->
	    	<div style="background: #f4f4f4; font-weight: bolder; color: #333; line-height:30px; padding-left:15px; border-top: 1px solid #d8d8d8; border-right:1px solid #d8d8d8;  border-left:1px solid #d8d8d8;">在线客服 &nbsp;  &nbsp;(工作时间：9:00~17:00)</div>
	        <div class="box_5" >
	        	<table>
	        		<tr>
	        			<td><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1433010529&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1433010529:42" alt="点击这里给我发消息" title="点击这里给我发消息"></a></td>
	        			<td style="line-height:25px; vertical-align: middle;">&nbsp;&nbsp;客户经理  王先生</td>
	        		</tr>
	        		<tr>
	        			<td ><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2458068476&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:2458068476:42" alt="点击这里给我发消息" title="点击这里给我发消息"></a></td>
	        			<td style="height:30px; vertical-align: middle;">&nbsp;&nbsp;客户经理  韩先生</td>
	        		</tr>
	        		<tr>
	        			<td>
	        			<a target="_blank" href="http://amos1.taobao.com/msg.aw?site=cntaobao&charset=utf-8&v=2&uid=zhongguozijinwang&s=1" ><img border="0" src="http://amos1.taobao.com/online.ww?v=2&uid=zhongguozijinwang&s=1" alt="Taobao.com ID:victorbsds" /></a> 
	        			<td style="height:30px; vertical-align: middle;">&nbsp;&nbsp;客户经理  董小姐</td>
	        		</tr>       			        		
	        	</table>
	        </div>
    	</div>
       <div class="hr_10"> &nbsp; </div>
       <div class="M_out_right_text fr" style="width:230px;">
       <span class="fr white" style="line-height:30px; margin-right:10px;"><a href="/loan/LoanService.act">更多»</a></span>
    	<h1>热门融资产品</h1>
      <div class="box_3 " style="padding-left:5px; padding-top:15px; padding-bottom:15px;line-height:30px;"  >
    	<div style="width : 230px; " >
		    <table >
			  <s:iterator value="recommendProducts">
			   <tr>
			     <td style="vertical-align: middle;">
			      <s:if test="logo == null">
					 <img src="/images/banklogo/zj198.jpg"  class="td_img" style="white-space: nowrap;"/>
					</s:if>
					<s:else>
						<img src="/images/banklogo/${logo }"  class="td_img" style="white-space: nowrap;"/>
					</s:else>
			     </td>
			     <td >
			     	<a href="/loan/financeProduct!cusViewFinance.act?product.id=${id}">
			     		<s:if test="recommendName != null && recommendName.length()>15">
							<s:property value="recommendName.substring(0,15)"></s:property>...
						</s:if><s:else>
							${recommendName}
						</s:else>
			     	</a>
			     </td>
			   </tr>
			  </s:iterator>
			</table>
	    </div>
    	
        </div>
    </div> 
	</form>
  </div>
</div>

<div id="QYKF_COPYRIGHT_70718ca91d55dcb82b8020add3fc54fa">
</div>
<script src="http://33084.fy.kf.qycn.com/vclient/state.php?webid=33084" language="javascript" type="text/javascript"></script>

<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>

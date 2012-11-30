<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>融资俱乐部_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/load-club.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
<script language="javascript">
	function doQueryRequestInfo(industry) {
		$("#mainIndustry2").attr("value",industry);
		$("#frmQueryRequestInfo").submit();
	}
	
	function doQuerySupplyInfo(investType){
		$("#sltInvestStyle").attr("value",investType);
		$("#frmQuerySupplyInfo").submit();
	}
	
	
	function create_new_info(info_type) {
		url1 = "/service/requestInfoAction4User!edit.act";
		url2= "/service/supplyInfoAction4User!editFirstStep.act";
		var user_type = '${session._user.userTypeGroup}';
		
		if (info_type ==1) {
			url = url1
		} else {
			url = url2
		}
		
		if (user_type=='') {
			window.location.href= url;
		} else {
			var is_valid_user = false;
			var user_status = "${session._user.auditstatus}";
			if (user_status != "2") {
				alert("您的注册资料尚未通过审核，暂不能发布此信息!");
				return;
			} 
			if (info_type==1) {
				if (user_type =='1' || user_type=='5') {
					window.location.href= url;
				} else {
					alert('只有用户身份为企业或个人才可以发布项目信息！');
				}
				is_valid_user = true;
			}
			
			if (info_type==2) {
				if (user_type =='2' || user_type=='3') {
					window.location.href=url;
				} else {
					alert('只有用户身份为银行或金融机构才可以发布资金信息！');
				}
				is_valid_user = true;
			}
			
			if (!is_valid_user) {
				alert("您当前身份不能发布任何相关信息...");
			}
			
		}
	}
</script>
</head>
<body>
<!--头部-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
</div>
<!--头部结束-->
<div class="clear">&nbsp;</div>
<div class="hr_10"> &nbsp; </div>	
<!--main-->
<div class="container_950">
	<div><img src="/images/jlb_banner.jpg"/></div>
	<div class="hr_10"> &nbsp; </div>
	<div>
		<div class="fund_m">
			<a href="/club/clubAction!getSupplyInfoByAllType.act" class="fl"><img src="/images/zjj.jpg"/></a>
			<div class="fund_m_connect">
				<div><a href="/Register.act">注册会员</a></div>
				<div><a href="javascript:create_new_info(1)">发布项目信息</a></div>
			</div>
		</div>
		<div class="fund_o">
			<a href="/club/clubAction!getRequestInfoByAllType.act" class="fl"><img src="/images/zxm.jpg"/></a>
			<div class="fund_m_connect">
				<div><a href="/Register.act">注册会员</a></div>
				<div><a href="javascript:create_new_info(2)">发布投资信息</a></div>
			</div>			
		</div>		
	</div>
	<div class="hr_10">&nbsp;</div>
	<div class="clear">&nbsp;</div>
      <!-- 投资俱乐部 -->         
	  <jsp:include page="_query_panel.jsp" />     
      <!-- 投资俱乐部 -->
	<div class="grid_310 fr">      
		<div style="overflow:hidden;">
		  <div class="menu_red white" >
		  	<h6>热门融资产品</h6>
		  </div>
		    <div class="box_3 " style="padding-left:5px;padding-top:15px;padding-bottom:15px;">
		        <s:action name="financeProduct!findRecom" namespace="/loan" executeResult="true"></s:action>
		    </div>
		</div>
	    <div class="hr_10"> &nbsp; </div>
	    	<div style="width:150px; height:155px; float:left; margin-right:10px;margin-bottom: 10px;"><a href="/loan/financeProduct!cusViewFinance.act?product.id=77" ><img src="/images/ad_b2_2.jpg" /></a></div>
	    	<div style="width:150px; height:73px; float:left; "><a href="/loan/financeProduct!cusViewFinance.act?product.id=14" ><img src="/images/ad_b2_2_1.jpg" class="b_div"/></a><a href="/loan/financeProduct!cusViewFinance.act?product.id=80" ><img src="/images/ad_b2_2_2.jpg" class="b_div"/></a></div>
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="zjfl_box">
		<div class="zjfl"><a href="/club/clubAction!getSupplyInfoByAllType.act">资金分类</a></div>
		<div class="zjfl_connect">
			<table border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <s:iterator id="item" value="investStyleList.{?#this.parentId>0}" status="st">
				  	<s:if test="#st.index>0 && #st.index % 9 == 0">
				  		</tr><tr>
				  	</s:if>
				  	<td><div class="ellipsis_text_80" title="${item.name }"><a href="javascript:doQuerySupplyInfo('${item.code }')">${item.name }</a></div></td>
				  </s:iterator>
			  </tr>
			</table>					
		</div>
	</div>
	<div class="hr_10"> &nbsp; </div>	
	<div class="zjfl_box">
		<div class="zjfl01"><a href="/club/clubAction!getRequestInfoByAllType.act">项目分类</a></div>
		<div class="zjfl_connect01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <s:iterator id="item" value="industryList" status="st">
				  	<s:if test="#st.index>0 && #st.index % 9 == 0">
				  		</tr><tr>
				  	</s:if>
				  	<td><div class="ellipsis_text_80" title="${item.name }"><a href="javascript:doQueryRequestInfo('${item.name }')">${item.name }</a></div></td>
				  </s:iterator>
				</tr>
			</table>			
		</div>
	</div>	 	      	
</div>         
<!--main--> 
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
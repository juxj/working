<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>融资俱乐部_首页</title>
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
				<div><a href="/Register.act">注册企业/个人会员</a></div>
				<div><a href="/service/requestInfoAction4User!edit.act">发布项目信息</a></div>
			</div>
		</div>
		<div class="fund_o">
			<a href="/club/clubAction!getRequestInfoByAllType.act" class="fl"><img src="/images/zxm.jpg"/></a>
			<div class="fund_m_connect">
				<div><a href="/Register.act">注册金融机构会员</a></div>
				<div><a href="/service/supplyInfoAction4User!editFirstStep.act">发布投资信息</a></div>
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
		<div>
			<div class="b_div"><a href="/loan/financeProduct!cusViewFinance.act?product.id=23" class="b_img"><img src="/images/b_img01.jpg" /></a><a href="/loan/financeProduct!cusViewFinance.act?product.id=31"><img src="/images/b_img02.jpg" /></a></div>
			<div class="b_div"><a href="/loan/financeProduct!cusViewFinance.act?product.id=33" class="b_img"><img src="/images/b_img03.jpg" /></a><a href="/loan/financeProduct!cusViewFinance.act?product.id=40"><img src="/images/b_img04.jpg" /></a></div>
		</div>
	</div> 
	<div class="clear"> &nbsp; </div>
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
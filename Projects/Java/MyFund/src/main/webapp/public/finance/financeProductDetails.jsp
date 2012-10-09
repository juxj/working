<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="${prdBankfinance.sellarea},${prdBankfinance.type}" />
<meta name="description" content=""/>
<title>${prdBankfinance.bank}${prdBankfinance.name}</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascrip" src="/script/public.js"> </script>
<script type="text/javascript" src="/script/load-finance.js" > </script>
</head>
<body>
<!--头部开始-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp" />
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--理财服务详情页面开始-->
  <div class="M_menu">
  	<a href="/finance/financeProduct.act">理财产品</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;
  		<a href="/finance/bankProduct!search.act">银行理财产品</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;产品详情
  </div>
  <div class="hr_10"> &nbsp; </div> 
  <div class="M_out">
  	<div class="M_out_L">
        <!--表格部分开始-->
        <table border="0" cellspacing="0" cellpadding="0" class="Search_table">
          <tr>
            <td colspan="4" class="Search_t_title">${prdBankfinance.name}</td>
          </tr>
          <tr>
            <td class="Search_t_connect">产品名称</td>
            <td colspan="3" style="padding-left:10px;">${prdBankfinance.name}</td>
          </tr>
          <tr>
            <td class="Search_t_connect">发行银行</td>
            <td class="Search_t_connect01">${prdBankfinance.bank}</td>
            <td class="Search_t_connect">币种</td>
            <td class="Search_t_connect01">${prdBankfinance.currency}</td>
          </tr>
          <tr>
            <td class="Search_t_connect">委托管理期</td>
            <td class="Search_t_connect01">${prdBankfinance.manageperiod}</td>
            <td class="Search_t_connect">收益起计日</td>
            <td class="Search_t_connect01"><s:date name="prdBankfinance.benefitstart"/></td>
          </tr>
          <tr>
            <td class="Search_t_connect">销售起始日期</td>
            <td class="Search_t_connect01"><s:date name="prdBankfinance.sellstart"/></td>
            <td class="Search_t_connect">销售终止日期</td>
            <td class="Search_t_connect01"><s:date name="prdBankfinance.sellend"/></td>
          </tr>
          <tr>
            <td class="Search_t_connect02">休息周期</td>
            <td class="Search_t_connect01">${prdBankfinance.benefitperiod}</td>
            <td class="Search_t_connect02">预期最高年化收益率(%)</td>
            <td class="Search_t_connect01">${prdBankfinance.benefitrate}</td>
          </tr>
          <tr>
            <td class="Search_t_connect">产品类型</td>
            <td class="Search_t_connect01">${prdBankfinance.type}</td>
            <td class="Search_t_connect">委托起始金额</td>
            <td class="Search_t_connect01">${prdBankfinance.minamount}</td>
          </tr>
          <tr>
            <td class="Search_t_connect">收益类型</td>
            <td class="Search_t_connect01">${prdBankfinance.benefittype}</td>
            <td class="Search_t_connect">发售地区</td>
            <td class="Search_t_connect01">${prdBankfinance.sellarea}</td>
          </tr>
          <tr>
            <td class="Search_t_connect02">递增单位（单位：元）</td>
            <td class="Search_t_connect01">${prdBankfinance.addunit}</td>
            <td class="Search_t_connect">产品管理费</td>
            <td class="Search_t_connect01">${prdBankfinance.managefee}</td>
          </tr>
          <tr>
            <td class="Search_t_connect">是否保本</td>
            <td class="Search_t_connect01">${prdBankfinance.guarantee}</td>
            <td class="Search_t_connect">在售状态</td>
            <td>${prdBankfinance.sellstatus}</td>
          </tr>
          <tr>
            <td class="Search_t_connect">提前终止条件</td>
            <td colspan="3" style="padding-left:10px;">${prdBankfinance.endcondition}</td>
          </tr>
          <tr>
            <td class="Search_t_connect02">产品说明</td>
            <td colspan="3" style="padding-left:10px; padding-bottom:5px;">${prdBankfinance.description}</td>
          </tr>
          <tr>
            <td class="Search_t_connect">收益率说明</td>
            <td colspan="3" style="padding-left:10px;">${prdBankfinance.benefitratedesc}</td>
          </tr>
        </table>
        <!--表格部分结束-->
      <div class="hr_10"> &nbsp; </div>
        <div><img src="/images/img_lcx_b.jpg" /></div>
    </div>
  	<div class="M_out_right fr">
    	<img src="/images/img_lcx_top.jpg" style="margin-bottom:10px;"/>
    </div>
    <div class="M_out_right_text fr">
    	<h1>热门理财产品</h1>
        <div class="box_3">
	        	<div class="qyrz-top" style="width : 230px;">
				    <table class="qyrz-top_table">
					  <s:iterator value="bankFinanceRecommendationList" id="item" >
					   <tr>
					     <td style="vertical-align: middle;">
							<s:if test="logo == null">
						        <img src="/images/banklogo/zj198.jpg" class="td_img" style="white-space: nowrap;"/>
					        </s:if>
					        <s:else>
					        	<img src="/images/banklogo/${item.logo}" class="td_img" style="white-space: nowrap;"/>
					        </s:else>
					     </td>
					     <td class="hot_connect">
					     	<a href="/finance/bankProduct!showDetails.act?id=${item.prodId}">
					     		<s:if test="#item.title != null && #item.title.length()>15">
									<s:property value="#item.title.substring(0,15)"></s:property>...
								</s:if><s:else>
									${item.title}
								</s:else>
					     	</a>
					     </td>
					   </tr>
					  </s:iterator>
					</table>
			    </div>
	        </div>
    </div>
  </div>
  <!--理财服务详情页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<jsp:include page="/public/bottom.jsp" />
</body>
</html>

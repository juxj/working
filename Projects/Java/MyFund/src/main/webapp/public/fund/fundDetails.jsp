<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>基金详情页_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascrip" src="/script/public.js"> </script>
<script type="text/javascript" src="/script/load-finance.js" > </script>
</head>
<body>
<!--头部开始-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--理财服务详情页面开始-->
  <div class="M_menu">
  	<a href="/finance/financeProduct.act">理财服务</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;基金产品详情
  </div>
  <div class="hr_10"> &nbsp; </div> 
  <div class="M_out">
  	<div class="M_out_L">
        <!--表格部分开始-->
        <table border="0" cellspacing="0" cellpadding="0"  width="100%"  class="Search_table">
          <tr>
            <td colspan="4" class="Search_t_title"><span class="red fl">圣迈鑫源投资基金低风险高收益计划</span><span class="fr"><input type="button" class="btnsub bred " value="在线预约" onclick="window.location='/finance/fund!inputIntention.act';"/></span></td>
        </tr>
          <tr>
            <td class="Search_t_connect">产品名称</td>
            <td colspan="3" style="padding:5px 10px 5px 10px;">圣迈鑫源股权投资基金</td>
          </tr>
          <tr>
            <td class="Search_t_connect" >发行银行</td>
            <td style="padding:5px 10px 5px 10px;">鑫鑫源投资基金管理有限公司</td>
            <td class="Search_t_connect">发行地</td>
            <td style="padding:5px 10px 5px 10px;">北京</td>
          </tr>
          <tr>
            <td class="Search_t_connect">发行规模</td>
            <td style="padding:5px 10px 5px 10px;">1亿元</td>
            <td class="Search_t_connect">资金门槛</td>
            <td style="padding:5px 10px 5px 10px;">100万</td>
          </tr>
          <tr>
            <td class="Search_t_connect">预期年化收益率</td>
            <td class="red" style="padding:5px 10px 5px 10px;">
					14%~26%(投资额<300万)<br/>
					15%~26%(投资额>=300万)
			</td>
            <td class="Search_t_connect">收益类型</td>
            <td style="padding:5px 10px 5px 10px;">固定型</td>
          </tr>
          <tr>
            <td class="Search_t_connect">投资期限</td>
            <td style="padding:5px 10px 5px 10px;">18个月</td>
            <td class="Search_t_connect">期限类型</td>
            <td style="padding:5px 10px 5px 10px;">单一期限</td>
          </tr>
          <tr>
            <td class="Search_t_connect">投资方式</td>
            <td style="padding:5px 10px 5px 10px;">股权投资</td>
            <td class="Search_t_connect">资金流向</td>
            <td style="padding:5px 10px 5px 10px;">小额贷公司</td>
          </tr>
          <tr>
            <td class="Search_t_connect">分红情况</td>
            <td style="padding:5px 10px 5px 10px;">每6个月</td>
            <td class="Search_t_connect">退出情况</td>
            <td style="padding:5px 10px 5px 10px;">中途不可退出</td>
          </tr>
          <tr>
            <td class="Search_t_connect">认购费</td>
            <td style="padding:10px;">1%（一次性收取）</td>
            <td class="Search_t_connect">管理费</td>
            <td style="padding:5px 10px 5px 10px;">每年1%</td>
          </tr>
          <tr>
            <td class="Search_t_connect">基金托管费</td>
            <td style="padding:5px 10px 5px 10px;">0.10%</td>
            <td class="Search_t_connect"></td>
            <td></td>
          </tr>
          <tr>
            <td class="Search_t_connect">成立日期</td>
            <td style="padding:5px 10px 5px 10px;">2012年12月7日</td>
            <td class="Search_t_connect">到期日期</td>
            <td style="padding:5px 10px 5px 10px;">2014年6月7日</td>
          </tr>
          <tr>
            <td class="Search_t_connect">资金运用情况</td>
            <td colspan="3" style="padding:5px 10px 5px 10px;">
			本基金是由鑫鑫源投资基金管理有限公司接受投资者的委托，将募集共计人民币1亿元的资金，以股权投资方式投资于相关的小额贷款公司，在严格控制投资风险情况下，分享小额贷款公司的稳定，较高的投资回报。
			</td>
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

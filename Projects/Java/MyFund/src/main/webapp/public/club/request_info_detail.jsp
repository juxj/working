<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<s:include value="_request_header.jsp"></s:include>
<body>
<!--头部-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
</div>
<!--头部结束-->
<div class="clear">&nbsp;</div>
<!--头部-->
  <!--项目信息详细页面开始-->
  <style>
  .out_table{border:solid #CCC; border-width: 1px 1px 0 1px; width:710px;}
  .out_table tr td{padding-left:20px; height:35px; line-height:35px;}
  .info_table{width:710px; border-top:1px solid #CCC; border-right:1px solid #CCC;}
  .info_table td{border-bottom:1px solid #CCC; border-left:1px solid #CCC; height:40px; line-height:40px; padding-left:20px; padding-right:20px;}
  .info_table td p{padding-bottom:10px;}
  .info_table td .title_tb{font-weight:bolder;}
  </style>
  <div class="hr_10"> &nbsp; </div> 
  <jsp:include page="_navigator_request.jsp" />
   <!--表格部分开始-->
  <div class="M_out">
  	<div class="M_out_L" style="margin-top:10px;">
        <table class="Search_table">
          <tr>
            <td colspan="4"><p class="Search_t_title" style="text-align:center;">${clbRequestInfo.title }</p>
            <p style="text-align:right; line-height:30px; padding-right: 20px;">
            发布时间：<s:date name="clbRequestInfo.lastPostDate" /> </p>
            </td>
          </tr>
          <tr>
            <td class="Search_t_connect">项目所属行业</td>
            <td class="Search_t_connect01">${clbRequestInfo.industry }</td>
            <td class="Search_t_connect">项目实施地区</td>
            <td class="Search_t_connect01">${clbRequestInfo.area}</td>
          </tr>
          <tr>
            <td class="Search_t_connect">项目分类</td>
            <td class="Search_t_connect01">
            	<s:iterator id="item" value="projectTypeList">
            		<s:if test="#item.code == clbRequestInfo.projectType">
            			${item.name}
            		</s:if>
            	</s:iterator>
            </td>
            <td class="Search_t_connect">项目投资总额(万元)</td>
            <td class="Search_t_connect01">
            	<s:text name="format.float"><s:param value="clbRequestInfo.totalMoney"></s:param></s:text>
            </td>
          </tr>
          <tr>
            <td class="Search_t_connect">尚缺资金(万元)</td>
            <td class="Search_t_connect01">
            	<s:text name="format.float"><s:param value="clbRequestInfo.lackMoney"></s:param></s:text>
            </td>
            <td class="Search_t_connect">所需资金(万元)</td>
            <td class="Search_t_connect01">
            	<s:text name="format.float"><s:param value="clbRequestInfo.needMoney"></s:param></s:text>
            </td>
          </tr>
          <tr>
            <td class="Search_t_connect">融资方式</td>
            <td colspan="3" style="padding-left:10px;">${clbRequestInfo.financeType } 
            <s:if test="clbRequestInfo.financeType==null or clbRequestInfo.financeType==''">
			    		不限
			    	</s:if> </td>
          </tr>
          <tr>
            <td class="Search_t_connect">项目联系人</td>
            <td class="Search_t_connect01">${clbRequestInfo.contact }</td>
            <td class="Search_t_connect">手机</td>
            <td class="Search_t_connect01">${clbRequestInfo.mobile }</td>
          </tr>
          <tr>
            <td class="Search_t_connect">电话</td>
            <td class="Search_t_connect01">${clbRequestInfo.telephone }</td>
            <td class="Search_t_connect">传真</td>
            <td class="Search_t_connect01">${clbRequestInfo.fax }</td>
          </tr>
          <tr>
            <td class="Search_t_connect">Email</td>
            <td class="Search_t_connect01">${clbRequestInfo.email }</td>
            <td class="Search_t_connect">公司名称</td>
            <td class="Search_t_connect01">${clbRequestInfo.companyName }</td>
          </tr>
          <tr>
            <td class="Search_t_connect">公司地址</td>
            <td colspan="3" style="padding-left:10px;">${clbRequestInfo.address }</td>
          </tr>            
          <tr>
            <td colspan="4" class="box_5">
            <p style="color:#97181d; font-weight: bold;">公司介绍</p><p>${clbRequestInfo.introductionDisp }</p><p class="hr_20"></p>
            <p style="color:#97181d; font-weight: bold;">资金描述</p><p>${clbRequestInfo.forecastDisp }</p>
            </td>
          </tr>            
        </table>
        <!--表格部分结束-->

      	<div class="hr_10"> &nbsp; </div>
        <div><img src="/images/img_lc.jpg" /></div>
    </div>
      	<div class="M_out_right fr">
      	<div class="hr_10"> &nbsp; </div>
    	<img src="/images/nsbank.png" style="margin-bottom:10px;"/>
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
    <div class="M_out_right_text fr">
     <div class="hr_10"> &nbsp; </div>
    	<h1>热门融资产品</h1>
        <div class="box_3">
          <div class="qyrz-top">
	            <s:action name="financeProduct!findRecom" namespace="/loan" executeResult="true"></s:action>
	        </div>
        </div>
    </div>
  </div>
  <!--项目信息详细页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
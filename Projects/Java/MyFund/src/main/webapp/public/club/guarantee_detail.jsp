<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<s:include value="_supply_header.jsp"></s:include>
<body>
<!--头部-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
</div>
<!--头部结束-->
<div class="clear">&nbsp;</div>
<!--头部-->
  <!--资金信息详细页面开始-->
  <div class="hr_10"> &nbsp; </div> 
  <jsp:include page="_navigator.jsp" />
   <!--表格部分开始-->
  <div class="M_out">
  	<div class="M_out_L" style="margin-top:10px;">
        <table class="Search_table">
          <tr>
            <td colspan="4">
            	<p class="Search_t_title" style="text-align:center;">${clbSupplyInfo.title }</p>
            	<p style="text-align:right; line-height:30px; padding-right: 20px;"> 
            	发布时间：<s:date name="clbSupplyInfo.lastPostDate" /> </p>
            </td>
          </tr>
          <tr>
            <td class="Search_t_connect">投资方式</td>
            <td class="Search_t_connect01">
		    			<s:iterator id="parameter" value="investStyleList">
		    				<s:if test="#parameter.code.trim()==clbSupplyInfo.investType">
		    					${parameter.name }
		    				</s:if>
		    			</s:iterator>    
            </td>
            <td class="Search_t_connect">投资额度（人民币）</td>
            <td class="Search_t_connect01">
		    			<s:set name="hasValue" value="0" />
		    			<s:iterator id="parameter" value="amountRangeList">
		    				<s:if test="#parameter.code.trim() == clbSupplyInfo.workTranche">
		    					${parameter.name }
		    					<s:set name="hasValue" value="1" />
		    				</s:if>
		    			</s:iterator>  
		    			
		    			<s:if test="#hasValue==0">
		    				${clbSupplyInfo.workTranche }
		    			</s:if>        
            </td>
            
          
          </tr>
          
          <tr>
          	  <td class="Search_t_connect">担保范围</td>
            <td class="Search_t_connect01" colspan="3">
		    			${clbSupplyInfo.workRange }
            </td>
          </tr>
          <jsp:include page="_common_info.jsp" />
        </table>
        <!--表格部分结束-->
      	<div class="hr_10"> &nbsp; </div>
        <div><img src="/images/img_lc.jpg" /></div>
    </div>
     <jsp:include page="_right_info.jsp" />
  </div>
  <!--资金信息详细页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
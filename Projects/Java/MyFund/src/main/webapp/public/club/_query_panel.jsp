<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script language="javascript">
$(document).ready(function() {
//通用选项卡2
    $('.xxkbox2:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first2').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var ss = $('.tab_menu2 ul li');
    ss.click(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = ss.index(this);
        $('.xxkbox2').eq(nb).show().siblings().hide();
    });
    
    $('.xxkbox3:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first3').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu3 ul li');
    sb.click(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox3').eq(nb).show().siblings().hide();
    });    
    //} 
    

//$('.defaultvalue').css('color','#000000'); 
    $('.defaultvalue').each(function(){   
        $(this).data( "txt", $.trim($(this).val()) );   
    }).focus(function(){   
        // 获得焦点时判断域内的值是否和默认值相同，如果相同则清空   
        //$(this).css('color','#333');   
        if ( $.trim($(this).val()) === $(this).data("txt") ) {   
            $(this).val("");   
        }   
    }).blur(function(){      
        if ( $.trim($(this).val()) === "") {   
            //$(this).css('color','#000000');   
            $(this).val( $(this).data("txt") );   
        }   
    }   
    );   
}); 
//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
});
</script>


 <div class="grid_630 box_4 fl" style="overflow:hidden;">       
        <div class="blue_bg">
          <div class="gray news_menu tab_menu2">
            <ul class="mews_ul">
              <li class="hover">找资金</li>
              <li>找项目</li>
            </ul>
          </div>			         
          <div>
          	<div class="xxkbox2 first2">
          	<!-- 表单开始 -->
	            <form class="box_form" action="/service/supplyInfoAction!home.act" method="post" id="frmQuerySupplyInfo">
				<table border="0" cellspacing="0" cellpadding="0" class="find_table">
				  <tr>
				    <td class="find_table_r">地区：</td>
				    <td class="v-align" colspan="2">
		                <s:select headerKey="" headerValue="不限" list="provinceList" name="query" listKey="name" listValue="name"  style="width:155px;"></s:select>		    	
				    </td>
				    <td class="find_table_r">行业：</td>
				    <td class="v-align" colspan="2">
		                <select id="mainIndustry1" name="query"  style="width:155px;">
				    	<option value="">不限</option>
				    	<s:iterator id="item" value="industryList">
							<s:if test="#item.parentid==0">
								<option value="${item.name }" >${item.name}</option>
							</s:if>
				    	</s:iterator>
				    	<option value="其他行业" <s:if test="query[1] == '其他行业'">selected</s:if>>其他行业</option>
				   		</select>			    
				    </td>
				  </tr>
				  <tr>
				    <td class="find_table_r">融资方式：</td>
				    <td class="v-align" colspan="2">
		                <select id="sltInvestStyle" name="query"  style="width:155px;">
							<option value="">不限</option>
							<s:iterator id="item" value="investStyleList">
								<s:if test="#item.parentId==0" >
									<option value="${item.name }"> ${item.name }</option>
								</s:if>
							</s:iterator>
							
							<s:iterator id="item" value="investStyleList">
								<s:if test="#item.parentId>0" >
									<option value="${item.code }"> ${item.name }</option>
								</s:if>
							</s:iterator>
						</select>		    
				    </td>
				    <td class="find_table_r">输入关键词：</td>
				    <td class="v-align"><input type="text" class="input-text" name="query"/></td>
				    <td class="v-align"><a href="javascript:$('#frmQuerySupplyInfo').submit();" class="btn blue1">搜索</a></td>
				  </tr>
				</table>
	          	<div class="find_table_t">最新资金信息<span><img src="/images/line1.jpg" /></span></div>			 
			  </form>	    
			  <!-- 表单结束 -->          	
				  <s:if test="supplyInfoList.size>0">
				  	<ul style="float:left;margin-right:50px;width:260px;"  class="new_li">
						<s:iterator id="item" value="supplyInfoList" status="st">
						<li title="${item.title}"><a href="/service/supplyInfoAction!detail.act?clbSupplyInfoId=${item.id }">
							<s:if test="#item.title.length()>50">
								<s:property value="#item.title.substring(0,50)"></s:property>...
							</s:if><s:else>
								${item.title}
							</s:else>
						</a></li>
						<s:if test="#st.index == 4">
							</ul><ul class="new_li" >
						</s:if>
						</s:iterator>
					</ul>
					
					</s:if>
					<s:else>
						<li>无记录</li>
					</s:else>
                <span class="fr" style="padding-right: 13px;padding-bottom: 10px;"><a href="/service/supplyInfoAction!home.act?pageNo=1">更多»</a></span>
            </div> 
            <div class="xxkbox2">
            <!-- 表单开始 -->
	          <form class="box_form" action="/service/requestInfoAction!home.act" method="post" id="frmQueryRequestInfo">
				<table border="0" cellspacing="0" cellpadding="0" class="find_table">
				  <tr>
				    <td class="find_table_r">地区：</td>
				    <td class="v-align" colspan="2">
		                <s:select headerKey="" headerValue="不限" list="provinceList" name="query" listKey="name" listValue="name"  style="width:155px;"></s:select>		    	
				    </td>
				    <td class="find_table_r">行业：</td>
				    <td class="v-align" colspan="2">
		                <select id="mainIndustry2" name="query"  style="width:155px;">
				    	<option value="">不限</option>
				    	<s:iterator id="item" value="industryList">
							<s:if test="#item.parentid==0">
								<option value="${item.name }" >${item.name}</option>
							</s:if>
				    	</s:iterator>
				    	<option value="其他行业" <s:if test="query[1] == '其他行业'">selected</s:if>>其他行业</option>
				   		</select>			    
				    </td>
				  </tr>
				  <tr>
				    <td class="find_table_r">投资方式：</td>
				    <td class="v-align" colspan="2">
		                <s:select headerKey="" headerValue="不限" 
		                	list="financingTypeList" listKey="name" listValue="name" name="query" style="width:155px;"></s:select>		    
				    </td>
				    <td class="find_table_r">输入关键词：</td>
				    <td class="v-align"><input type="text" class="input-text" name="query"/></td>
				   	<td class="v-align"><a href="javascript:$('#frmQueryRequestInfo').submit();" class="btn blue1">搜索</a></td>
				  </tr>
				</table>
	          	<div class="find_table_t">最新项目信息<span><img src="/images/line1.jpg" /></span></div>			 
			  </form>
			  <!-- 表单结束 -->            
            	<s:if test="requestInfoList.size>0">
            		<ul style="float:left;margin-right:50px;width:260px;"  class="new_li">
						<s:iterator id="item" value="requestInfoList" status="st">
							<li title="${item.title}">
							<a href="/service/requestInfoAction!detail.act?clbRequestInfoId=${item.id }">
								<s:if test="#item.title != null && #item.title.length()>20">
									<s:property value="#item.title.substring(0,20)"></s:property>...
								</s:if><s:else>
									${item.title}
								</s:else>
							</a></li>
							<s:if test="#st.index == 4">
								</ul><ul class="new_li" >
							</s:if>
						</s:iterator>
					</ul>				  
					</s:if>				
					<s:else>
						<li>无记录</li>
					</s:else>
				  <span class="fr" style="padding-right: 13px;padding-bottom: 10px;"><a href="/service/requestInfoAction!home.act?pageNo=1">更多»</a></span>
            	            	
          </div>      
         </div>        
        </div>
       </div> 
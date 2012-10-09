<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
function Scroll(ul, delay, speed, lineHeight) {
    var slideBox = (typeof ul == 'string') ? document.getElementById(ul) : ul;
    if(slideBox.getElementsByTagName('li').length==0){
    	return;
    }
    var delay = delay || 1000;
    var speed = speed || 20;
    var lineHeight = lineHeight || 24;
    var tid = null,
    pause = false;
    var start = function() {
        tid = setInterval(slide, speed);
    };
    var slide = function() {
        if (pause) return;
        slideBox.scrollTop += 2;
        if (slideBox.scrollTop % lineHeight == 0) {
            clearInterval(tid);
            slideBox.appendChild(slideBox.getElementsByTagName('li')[0]);
            slideBox.scrollTop = 0;
            setTimeout(start, delay);
        }
    };
    slideBox.onmouseover = function() {
        pause = true;
    };
    slideBox.onmouseout = function() {
        pause = false;
    };
    setTimeout(start, 2000);
}
$(function(){
	Scroll('IssueList', 2000, 32, 24);
});
</script>
<%@ taglib uri="/struts-tags" prefix="s" %>
  <div class="container_960 top">
    <div class="fl logo">
      <h1><a href="/Index.act">中国资金网</a></h1>
    </div>
    <div class="fr logo_r">
      <div class="hr_10"> &nbsp; </div>
      <div class="user_menu">
      <s:if test="#session._user!=null">${session._user.realname} 您好，欢迎来到中国资金网！ | <a href="/Account!logout.act"> 退出</a>
      </s:if>
      <s:else>
        <a href="/Account.act"> 登录</a><a href="/Register.act">注册</a>
      </s:else> | <font color="#555"><a href="/user/UserAction.act">用户中心</a><s:if test="#session._admin != null"> | <a href="/admin/user/User.act">管理员 » 账户管理</a></s:if></font>
      </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="pic_logo_r fr"><img src="/images/logo_right_pic.jpg" alt="" /></div>
    </div>
    <div class="clear"> &nbsp; </div>
  </div>
<div class="container_960">
    <div class="tab_menu index_nav">
      <ul>
        <li id="page_index_sel"><a href="/Index.act">首 页</a></li>
        <li id="page_loan_sel"><a href="/loan/LoanService.act">融资服务</a></li>
        <li id="page_finance_sel"><a href="/finance/financeProduct.act">理财产品</a></li>
        <li id="page_club_sel"><a href="/club/clubAction.act">融资俱乐部</a></li>
        <li id="page_news_sel"><a href="/news/InfoCenter.act">信息中心</a></li>
      </ul>
    </div>
    <div class="clear"> &nbsp; </div>
    <div class="index_subnav" style="position:relative;">
      <div class="xxkbox"> <font class="fl" style="line-height:36px; font-weight:bold;">网站公告：</font>
        <ul class="fl" id="IssueList" style="height:24px;line-height:24px;overflow:hidden; margin-top:6px;width:800px;">
        <s:iterator value="@com.zj198.util.Constants@NEWS_MAP[1]" id="item">
        	<li>
        		<s:if test="#item.url.length()>8">
					<s:if test="#item.title.length()>25">
						<a href="${item.url}"  target="_blank">
							<s:property value="#item.title.substring(0,25)"></s:property>...</a>
						</s:if><s:else>
							<a href="${item.url}"  target="_blank">${item.title}</a>
						</s:else>
					</s:if> 
				<s:else>
					<s:if test="#item.title.length()>25">
					<a href="/news/Info.act?id=${item.id}" target="_blank">
						<s:property value="#item.title.substring(0,25)"></s:property>...</a>
					</s:if><s:else>
						<a href="/news/Info.act?id=${item.id}" target="_blank">${item.title}</a>
					</s:else>
				</s:else>
        	</li>
        </s:iterator>
        
        </ul>
      </div>
    </div>
  </div>
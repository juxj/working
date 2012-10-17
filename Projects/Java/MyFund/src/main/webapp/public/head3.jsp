<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
  <div class="container_960 top">
    <div class="fl logo">
      <h1><a href="/Index.act">中国资金网</a></h1>
    </div>
    <div class="fr logo_r">
      <div class="hr_10"> &nbsp; </div>
      <div class="user_menu">
      <s:if test="#session._user!=null">${session._user.realname}您好，欢迎来到中国资金网！ | <a href="/Account!logout.act"> 退出</a>
      </s:if>
      <s:else>
        <a href="/Account.act"> 登录</a><a href="/Register.act">注册</a>
      </s:else> | <a href="/Index.act">网站首页</a>
      </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="pic_logo_r fr"><img src="/images/logo_right_pic.jpg" alt="" /></div>
    </div>
    <div class="clear"> &nbsp; </div>
  </div>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<tr>
  <td class="Search_t_connect">信息时效期</td>
  <td style="padding-left:10px;"><s:date name="clbSupplyInfo.lastDisplayDate" /> </td>
  <td class="Search_t_connect">发布日期</td>
  <td style="padding-left:10px;"><s:date name="clbSupplyInfo.lastPostDate"/></td>
</tr>
<tr>
  <td class="Search_t_connect">资金联系人</td>
  <td class="Search_t_connect01">${clbSupplyInfo.infoUserName }</td>
  <td class="Search_t_connect">手机</td>
  <td class="Search_t_connect01">${clbSupplyInfo.infoMobile}</td>
</tr>
<tr>
  <td class="Search_t_connect">电话</td>
  <td class="Search_t_connect01">${clbSupplyInfo.infoIllimite }</td>
  <td class="Search_t_connect">传真</td>
  <td class="Search_t_connect01">${clbSupplyInfo.infoFax }</td>
</tr>
<tr>
  <td class="Search_t_connect">Email</td>
  <td class="Search_t_connect01">${clbSupplyInfo.infoEmail }</td>
  <td class="Search_t_connect">公司名称</td>
  <td class="Search_t_connect01">${clbSupplyInfo.infoCompanyname }</td>
</tr>
<tr>
  <td class="Search_t_connect">公司地址</td>
  <td colspan="3" style="padding-left:10px;">${clbSupplyInfo.infoAddress }</td>
</tr>            
<tr>
  <td colspan="4" class="box_5">
  <p style="color:#97181d; font-weight: bold;">公司介绍</p><p>${clbSupplyInfo.infoCompanyinfo}</p><p class="hr_20"></p>
  <p style="color:#97181d; font-weight: bold;">资金描述</p><p>${clbSupplyInfo.remark}</p>
  </td>
</tr>
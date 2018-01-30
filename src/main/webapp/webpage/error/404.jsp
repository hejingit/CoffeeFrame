<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<%@page import="com.coffee.common.web.Servlets"%>
<%
response.setStatus(404);

// 如果是异步请求或是手机端，则直接返回信息
if (Servlets.isAjaxRequest(request)) {
	out.print("页面不存在.");
}

//输出异常信息页面
else {
%>
<!DOCTYPE html>
<html>

<head>
  <title>404 页面</title>
  <link href="${ctxStatic}/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />
  <link href="${ctxStatic}/common/css/coffee.css" type="text/css" rel="stylesheet" />
</head>

<body class="gray-bg">
    <div class="error-warp">
        <h1><img src="${ctxStatic}/common/img/404.png" /></h1>
        <h3>页面出错或找不到页面</h3>
    </div>
</body>

</html>

<%}%>
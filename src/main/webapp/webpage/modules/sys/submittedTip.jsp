<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>咖啡易融商户通</title>

    <link href="${ctxStatic}/bootstrap/3.3.4/css_default/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/awesome/4.4/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctxStatic}/common/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="${ctxStatic}/common/css/animate.css" rel="stylesheet">
    <link href="${ctxStatic}/common/css/style.css" rel="stylesheet">
    <link href="${ctxStatic}/common/css/coffee.css" rel="stylesheet">
</head>

<body class="skin-coffee gray-bg">
    <div class="other-main">
        <h1 class="other-logo"><img src="${ctxStatic}/common/img/other-logo.png" alt="咖啡易融商户通" title="咖啡易融商户通" /></h1>
        <div class="text-center">
            <div class="coffee-success">
                <span class="coffee-icon"></span>
                <p>您提交的账号信息已经提交审核<br />我们会尽快处理，请耐心等待</p>
            </div>     
        </div>
        <br/>
        <br/>
        <button onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/a/login'" class="return-button" >返回登录页面</button>
    </div>
    
    
</body>
</html>

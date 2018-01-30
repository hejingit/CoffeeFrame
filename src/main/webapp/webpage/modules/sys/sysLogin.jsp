<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>咖啡易融</title>

    <link href="${ctxStatic}/bootstrap/3.3.4/css_default/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/awesome/4.4/css/font-awesome.min.css" rel="stylesheet">
    <!--<link href="${ctxStatic}/common/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">-->
    <link href="${ctxStatic}/common/css/animate.css" rel="stylesheet">
    <link href="${ctxStatic}/common/css/style.css" rel="stylesheet">
    <link href="${ctxStatic}/common/css/coffee.css" rel="stylesheet">
    
    	<script>
			if (window.top !== window.self) {
				window.top.location = window.location;
			}
		</script>
</head>

<body class="white-bg">
    <div class="login-bg"></div>
    <div class="login-screen">
        <h1 class="login-logo text-center"><img src="${ctxStatic}/common/img/login-logo.png" alt="咖啡易融" title="咖啡易融" /></h1>
        <form role="form" id="loginForm" action="${ctx}/login" method="post" autocomplete="off">
            <div class="form-group coffee-before">
                <input type="text" class="login-input required" id="username" name="username" placeholder="用户名" autocomplete="off" />
            </div>
            <div class="form-group coffee-after">
                <input type="password" class="login-input required" id="password" name="password" value="" placeholder="密码" autocomplete="off" />
            </div>
            <c:if test="${isValidateCodeLogin}">
				<div class="form-group">
					<sys:validateCode name="validateCode" />
				</div>
			</c:if>
            <div class="remember-me">
                <%-- <div class="coffee-checkbox">
                    <input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''} >
                    <label class="white" for="rememberMe">记住我</label>
                </div> --%>
                <a href="${fctx}/register/findPwd">忘记密码？</a>
            </div>
            <div class="login-error">
                <sys:message content="${message}"/>
            </div>
            <button type="submit" class="login-button">登 录</button>
        </form>
       <%--  <a class="login-sign-up" href="${fctx}/register/index">机构注册</a> --%>
           
        
    </div>

    <!-- Mainly scripts -->
    <script src="${ctxStatic}/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery/jquery-migrate-1.1.1.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.14.0/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.14.0/localization/messages_zh.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <!-- 引入layer插件 -->
	<script src="${ctxStatic}/layer-v2.3/layer/layer.js"></script>
	<script type="text/javascript">
		

				$(document).ready(function() {
					$("#loginForm").validate({
						rules: {
							validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
						},
						messages: {
							username: {required: ""},password: {required: ""},
							validateCode: {remote: "", required: ""}
						},
						errorLabelContainer: "#messageBox",
						errorPlacement: function(error, element) {
							error.appendTo($("#loginError").parent());
						} 
					});
				});
				// 如果在框架或在对话框中，则弹出提示并跳转到首页
				if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
					alert('未登录或登录超时。请重新登录，谢谢！');
					top.location = "${ctx}";
				}
		</script>



</body>
</html>


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
        <h2 class="coffee-title">重置密码</h2>
				<sys:message content="${message}"/>
				<form:form id="pwdFindForm" modelAttribute="user"  action="${fctx}/register/resetPassword" method="post" class="form-group form-horizontal">
					<div class="other-form">
							<div class="coffee-form-group">
									<span class="label-title">注册邮箱</span>
									<input id="email" name="email" type="text" value="" maxlength="50"  class="input-text text-muted required isEmail" />
							</div>
							<div class="coffee-form-group">
									<span class="label-title">邮箱验证码</span>
									<div class="input-group random-code-warp">
											<input id="code" name="randomCode" type="text" value="" maxlength="6" minlength="6" class="input-text text-muted required" />
											<span class="input-group-btn">
													<button id="sendCodeBtn" type="button" class="btn btn-primary">获取验证码</button>
											</span>
									</div>
									<label id="code-error" class="error" for="code"></label>
							</div>
							<%--
							<div class="coffee-form-group">
									<span class="label-title">用户名</span>
									<input id="loginName" name="loginName" type="text" value="${user.loginName }" maxlength="20" minlength="3" class="input-text required" />
							</div>
							--%>
							<div class="coffee-form-group">
									<span class="label-title">设置新密码</span>
									<input id="newPassword" name="password" type="password" value="" maxlength="20" minlength="8"  class="input-text required" />
							</div>
							<div class="coffee-form-group">
									<span class="label-title">重复输入新密码</span>
									<input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" maxlength="20" minlength="8" class="input-text required" equalTo="#newPassword" />
							</div>
					</div>
					<button type="submit" class="btn-primary other-form-button">重置密码</button>
				</form:form>
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


	$(document).ready(function(){
		//邮箱验证
		 	jQuery.validator.addMethod("isEmail", function(value, element) {
			    var length = value.length;
			    var email = /^[a-zA-Z0-9_-]+([-_.][A-Za-zd]+)*@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
			    return email.test(value);
			}, "请正确填写您的邮箱"); 
		$("#pwdFindForm").validate({
			rules: {
			email: { remote: "${fctx}/register/validateEmailExist"},
			randomCode: {
				  remote:{
					  url:"${fctx}/register/validateEmailCode", 
					  data:{
				      email:function(){
				          return $("#email").val();
				          }
		          		} 
					}
				}
		},
			messages: {
				confirmNewPassword: {equalTo: "两次密码输入不一致"},
				email:{remote: "无效的邮箱地址!", required: "邮箱不能为空."},
				randomCode:{remote: "验证码不正确!", required: "验证码不能为空."}
			},
			submitHandler: function(form){
				loading('正在提交，请稍等...');
				form.submit();
			},
			errorContainer: "#messageBox",
			errorPlacement: function(error, element) {
				$("#messageBox").text("输入有误，请先更正。");
				if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
					error.appendTo(element.parent().parent());
				} else {
					error.insertAfter(element);
				}
			}
		});
	});

		$(document).ready(function() {
			//发送验证码
			$('#sendCodeBtn').click(function () { 
				if($("#email").val()=="" || $("#email-error").text()!=""){
					top.layer.alert("请输入有效的注册邮箱！", {icon: 0});
					return;
				}
				$("#sendCodeBtn").attr("disabled", true); 
				$.get("${fctx}/register/getFindPwdCode?email="+$("#email").val(),function(data){
						if(data.success == false){
							top.layer.alert(data.msg, {icon: 2});
							$("#sendCodeBtn").html("重新发送").removeAttr("disabled"); 
							clearInterval(countdown); 
						}
						if(data.success == true) {
							top.layer.alert("请登陆"+$("#email").val()+"邮箱获取验证码！", {icon: 1});
						}
						
					});
				var count = 60; 
				var countdown = setInterval(CountDown, 1000); 
				function CountDown() { 
					$("#sendCodeBtn").attr("disabled", true); 
					$("#sendCodeBtn").html("" + count + "秒后重试!"); 
					if (count == 0) { 
						$("#sendCodeBtn").html("重新发送").removeAttr("disabled"); 
						clearInterval(countdown); 
					} 
					count--; 
				}
			}) ;
		});	
	</script>
</body>
</html>

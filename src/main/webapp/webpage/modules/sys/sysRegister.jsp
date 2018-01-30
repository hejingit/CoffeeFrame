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
    <!--<link href="${ctxStatic}/common/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">-->
    <link href="${ctxStatic}/common/css/animate.css" rel="stylesheet">
    <link href="${ctxStatic}/common/css/style.css" rel="stylesheet">
    <link href="${ctxStatic}/common/css/coffee.css" rel="stylesheet">
</head>
<body class="skin-coffee"> 
    <div class="register-warp">
				<div class="register-left">
						<h1><img src="${ctxStatic}/common/img/login-logo.png" alt="咖啡易融" title="咖啡易融" /></h1>
				</div>
				<div class="register-main">
					<div class="register-screen">
							<h2>机构注册</h2>
							<sys:message content="${message}"/>
							<form:form id="registerForm" modelAttribute="user"  action="${fctx}/register/registerUser" method="post" class="form-horizontal">
							<input  type="hidden" value="depart" name="roleName">
							<fieldset>
								<div class="coffee-form-group">
										<input id="email" name="email" type="text" value="" maxlength="50"  class="input-text text-muted required isEmail"  placeholder="邮箱"/>
								</div>
								<div class="coffee-form-group">
										<input id="code" name="randomCode" type="text" value="" maxlength="6" minlength="6" class="input-text input-yzm text-muted required"  placeholder="验证码"/>
										<button class="buttom-yzm" type="button" id="sendCodeBtn"  >获取验证码</button>
										<label id="code-error" class="error" for="code"></label>
								</div>
								<div class="coffee-form-group">
										<input id="loginName" name="loginName" type="text" value="${user.loginName }" maxlength="20" minlength="3" class="input-text required" placeholder="用户名" />
								</div>
								<div class="coffee-form-group">
										<input id="newPassword" name="password" type="password" value="" maxlength="20" minlength="8"  class="input-text required" placeholder="密码" />
								</div>
								<div class="coffee-form-group">
										<input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" maxlength="20" minlength="8" class="input-text required" equalTo="#newPassword" placeholder="重复密码" />
								</div>
								<div class="coffee-form-group register-pact">
									<div class="coffee-checkbox">
										<input id="ck1" name="ck1" type="checkbox" class="required ace" />
											<label class="black" for="ck1">我已阅读并同意<a href="${ctxStatic}/protocol.html" target="_blank">《注册协议》</a></label>
									</div>
								</div>
								<button type="submit" class="login-button">注 册</button>
							</fieldset>
						</form:form>
					</div>
			</div>
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
		$("#registerForm").validate({
			rules: {
			loginName: {remote: "${ctx}/sys/user/validateLoginName"},
//			email: {remote: "${ctx}/sys/user/validateEmail"},
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
				ck1: {required: "必须接受用户协议."},
				loginName: {remote: "此用户名已经被注册!", required: "用户名不能为空."},
				email:{ required: "邮箱不能为空."},
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
				$.get("${fctx}/register/getRegisterCode?email="+$("#email").val(),function(data){
						if(data.success == false){
							top.layer.alert(data.msg, {icon: 2});
							$("#sendCodeBtn").html("重新发送").removeAttr("disabled"); 
							clearInterval(countdown); 
						}else{
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

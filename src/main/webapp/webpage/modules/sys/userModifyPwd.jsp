<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>修改密码</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#oldPassword").focus();
		});
	</script>
</head>
<body>
<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/modifyPwd"  method="post">
	<form:hidden path="id"/>
	<sys:message hideType="1" content="${message}"/>
	<div class="dialog-refunds-form dialog-input-warp">
		<div class="form-group">
			<span class="label-text">旧密码</span>
			<input id="oldPassword" name="oldPassword" type="password" value="" maxlength="20" minlength="8"  class="input-text required"/>
		</div>
		<div class="form-group">
			<span class="label-text">新密码</span>
			<input id="newPassword" name="newPassword" type="password" value="" maxlength="20" minlength="8" class="input-text required"/>
		</div>
		<div class="form-group">
			<span class="label-text">确认新密码</span>
			<input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" maxlength="20" minlength="8" class="input-text required" equalTo="#newPassword">
		</div>
	</div>
</form:form>
</body>
</html>
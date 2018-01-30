<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>个人信息</title>
	<meta name="decorator" content="default"/>
</head>
<body>

	<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/infoEdit"  method="post">
		<div class="dialog-refunds-form dialog-input-warp">
			<div class="form-group">
				<span class="label-text">姓名</span>
				<form:input path="name" htmlEscape="false" maxlength="50"  class="input-text required" />
			</div>
			<div class="form-group">
				<span class="label-text">邮箱</span>
				<form:input path="email" htmlEscape="false" maxlength="50" class="input-text email"/>
			</div>
			<div class="form-group">
				<span class="label-text">电话</span>
				<form:input path="phone" htmlEscape="false" class="input-text" maxlength="50"/>
			</div>
			<div class="form-group">
				<span class="label-text">手机</span>
				<form:input path="mobile" htmlEscape="false" class="input-text required" maxlength="50"/>
			</div>
			<div class="form-group">
				<span class="label-text">备注</span>
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-text input-textarea"/>
			</div>
		</div>
	</form:form>
</body>
</html>
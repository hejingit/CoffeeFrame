<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>

<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  return true;
		  }
	
		  return false;
		}
		$(function(){
		        $(':checkbox[type="checkbox"]').each(function(){
		            $(this).click(function(){
		                if($(this).attr('checked')){
		                    $(':checkbox[type="checkbox"]').removeAttr('checked');
		                    $(this).attr('checked','checked');
		                }
		            });
		        });
		 });
		$(document).ready(function() {
			$("#no").focus();
			validateForm = $("#inputForm").validate({
				rules: {
					loginName: {remote: "${ctx}/sys/user/checkLoginName?oldLoginName=" + encodeURIComponent('${user.loginName}')}//设置了远程验证，在初始化时必须预先调用一次。
				},
				messages: {
					loginName: {remote: "用户登录名已存在"},
					confirmNewPassword: {equalTo: "两次密码输入不一致"}
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

			$("#inputForm").validate().element($("#loginName"));
		});

	
	</script>
</head>
<body class="hideScroll">
	<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/save" method="post">
		<form:hidden path="id"/>
		<form:hidden path="photo"/>
		<form:hidden path="no" value="001"/>
		<form:hidden path="phone" />
		<form:hidden path="userType" value="3"/>
		
		<sys:message content="${message}"/>
		<div class="dialog-coffee-table">
		<table class="table table-bordered">
		   <tbody>
		      <tr>
		         <%-- <td class="width-15 active">	<label class="table-label"><font color="red">*</font>头像</label></td>
		         <td class="width-35">
							 <form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
						<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/></td> 
						--%>
						
		         <td  class="width-15 active">	<label class="table-label"><font color="red">*</font>归属机构</label></td>
		         <td class="width-35"><sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}"
						title="机构" url="/sys/office/treeData?type=1" cssClass="input-text required"/></td>
				<td class="width-15 active"><label class="table-label"><font color="red">*</font>归属分校</label></td>
		         <td class="width-35"><sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}"
					title="分校" url="/sys/office/treeData?type=2" cssClass="input-text required" notAllowSelectParent="true"/></td>		
		      </tr>
		      
		 <%--      <tr>
		         
		         <td class="active"><label class="table-label"><font color="red">*</font>工号</label></td>
		         <td><form:input path="no" htmlEscape="false" maxlength="50" class="input-text required"/></td>
		      </tr> --%>
		      
		      <tr>
		         <td class="active"><label class="table-label"><font color="red">*</font>姓名</label></td>
		         <td><form:input path="name" htmlEscape="false" maxlength="50" class="input-text required"/></td>
		         <td class="active"><label class="table-label"><font color="red">*</font>登录名</label></td>
		         <td><input id="oldLoginName" name="oldLoginName" type="hidden" value="${user.loginName}">
					 <form:input path="loginName" htmlEscape="false" maxlength="50" class="input-text required userName"/></td>
		      </tr>
		      
		      
		      <tr>
		         <td class="active"><label class="table-label"><c:if test="${empty user.id}"><font color="red">*</font></c:if>密码</label></td>
		         <td><input id="newPassword" name="newPassword" type="password" value="" maxlength="20" minlength="8" class="input-text ${empty user.id?'required':''}"/>
					<c:if test="${not empty user.id}"><span class="help-inline">若不修改密码，请留空。</span></c:if></td>
		         <td class="active"><label class="table-label"><c:if test="${empty user.id}"><font color="red">*</font></c:if>确认密码</label></td>
		         <td><input id="confirmNewPassword" name="confirmNewPassword" type="password"  class="input-text ${empty user.id?'required':''}" value="" maxlength="20" minlength="8" equalTo="#newPassword"/></td>
		      </tr>
		      
		       <tr>
		         <td class="active"><label class="table-label"><font color="red">*</font>邮箱</label></td>
		         <td><form:input path="email" htmlEscape="false" maxlength="100" class="input-text required email"/></td>
		         <td class="active"><label class="table-label"><font color="red">*</font>手机号码</label></td>
		         <td><form:input path="mobile" htmlEscape="false" maxlength="100" class="input-text required tel"/></td>
		      </tr>
		    <%--   <tr>
		         
		         
				<td class="active"><label class="table-label">用户类型</label></td>
		         <td><form:select path="userType"  class="input-text">
					<form:option value="" label="请选择"/>
						<form:options items="${fns:getDictList('sys_user_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select></td>
		      </tr> --%>
		      
		       <tr>
		         <td class="active"><label class="table-label">备注</label></td>
		         <td><form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-text input-textarea"/></td>
		         <td class="active"><label class="table-label">是否允许登录</label></td>
		         <td><form:select path="loginFlag"  class="input-text">
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select></td>
				
		         
		      </tr>
		      <tr>
		      	<td class="active"><label class="table-label"><font color="red">*</font>用户角色:</label></td>
		         <td colspan="3">
							<div class="coffee-checkbox-group">
		         	<form:checkboxes path="roleIdList" items="${allRoles}" itemLabel="name" itemValue="id" htmlEscape="false" cssClass="required"/>
							 </div>
		         	<label id="roleIdList-error" class="error" for="roleIdList"></label>
		         </td>
		      </tr>
		 </tbody>
	</table>
	<c:if test="${not empty user.id}">
		<div class="table-bottom-text">
			<p>创建时间：&#x3000;<fmt:formatDate value="${user.createDate}" type="both" dateStyle="full"/></p>
			<span></span>
			<p>最后登陆：&#x3000;IP（${user.loginIp}）&#x3000;时间（<fmt:formatDate value="${user.loginDate}" type="both" dateStyle="full"/>）</p>
		</div>
	</c:if>
	</div>
	</form:form>
</body>
</html>
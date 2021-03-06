<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>机构管理</title>
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
		$(document).ready(function() {
			$("#name").focus();
			validateForm = $("#inputForm").validate({
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
	</script>
</head>
<body class="hideScroll">
	<form:form id="inputForm" modelAttribute="office" action="${ctx}/sys/office/save" method="post">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="dialog-coffee-table">
		<table class="table table-bordered">
		   <tbody>
		      <tr>
		         <td class="width-15 active"><label class="table-label">上级机构:</label></td>
		         <td class="width-35">
							 <sys:treeselect id="office" name="parent.id" value="${office.parent.id}" labelName="parent.name" labelValue="${office.parent.name}"
					title="机构" url="/sys/office/treeData" extId="${office.id}"  cssClass="input-text" allowClear="${office.currentUser.admin}"/></td>
		         <td  class="width-15"  class="active"><label class="table-label"><font color="red">*</font>归属区域:</label></td>
		         <td class="width-35"><sys:treeselect id="area" name="area.id" value="${office.area.id}" labelName="area.name" labelValue="${office.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="input-text required"/></td>
		      </tr>
		       <tr>
		         <td class="width-15 active"><label class="table-label"><font color="red">*</font>机构名称:</label></td>
		         <td class="width-35"><form:input path="name" htmlEscape="false" maxlength="50" class="input-text required"/></td>
		         <td  class="width-15"  class="active"><label class="table-label">机构编码:</label></td>
		         <td class="width-35"><form:input path="code" htmlEscape="false" maxlength="50" class="input-text"/></td>
		      </tr>
		       <tr>
		         <td class="width-15 active"><label class="table-label">机构类型:</label></td>
		         <td class="width-35"><form:select path="type" class="input-text">
					<form:options items="${fns:getDictList('sys_office_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select></td>
		         <td  class="width-15"  class="active"><label class="table-label">机构级别:</label></td>
		         <td class="width-35"><form:select path="grade" class="input-text">
					<form:options items="${fns:getDictList('sys_office_grade')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select></td>
		      </tr>
		      <tr>
		         <td class="width-15 active"><label class="table-label">是否可用:</label></td>
		         <td class="width-35"><form:select path="useable" class="form-control">
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
					<span class="help-inline">“是”代表此账号允许登陆，“否”则表示此账号不允许登陆</span></td>
		         <td class="width-15"  class="active"><label class="table-label">主负责人:</label></td>
		         <td class="width-35"><sys:treeselect id="primaryPerson" name="primaryPerson.id" value="${office.primaryPerson.id}" labelName="office.primaryPerson.name" labelValue="${office.primaryPerson.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-text" allowClear="true" notAllowSelectParent="true"/></td>
		      </tr>
		      <tr>
		         <td class="width-15 active"><label class="table-label">副负责人:</label></td>
		         <td class="width-35"><sys:treeselect id="deputyPerson" name="deputyPerson.id" value="${office.deputyPerson.id}" labelName="office.deputyPerson.name" labelValue="${office.deputyPerson.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-text" allowClear="true" notAllowSelectParent="true"/></td>
		         <td class="width-15"  class="active"><label class="table-label">联系地址:</label></td>
		         <td class="width-35"><form:input path="address" htmlEscape="false" maxlength="50" cssClass="input-text" /></td>
		      </tr>
		      <tr>
		         <td class="width-15 active"><label class="table-label">邮政编码:</label></td>
		         <td class="width-35"><form:input path="zipCode" htmlEscape="false" maxlength="50" cssClass="input-text" /></td>
		         <td  class="width-15" class="active"><label class="table-label">负责人:</label></td>
		         <td class="width-35"><form:input path="master" htmlEscape="false" maxlength="50" cssClass="input-text" /></td>
		      </tr>
		      <tr>
		         <td class="width-15 active"><label class="table-label">电话:</label></td>
		         <td class="width-35"><form:input path="phone" htmlEscape="false" maxlength="50" cssClass="input-text" /></td>
		         <td  class="width-15"  class="active"><label class="table-label">传真:</label></td>
		         <td class="width-35"><form:input path="fax" htmlEscape="false" maxlength="50" cssClass="input-text" /></td>
		      </tr>
		      <tr>
		         <td class="width-15 active"><label class="table-label">邮箱:</label></td>
		         <td class="width-35"><form:input path="email" htmlEscape="false" maxlength="50" cssClass="input-text" /></td>
		         <td  class="width-15" class="active"><label class="table-label">备注:</label></td>
		         <td class="width-35"><form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-text input-textarea"/></td>
		      </tr>
	      </tbody>
	      </table>
			</div>
	</form:form>
</body>
</html>
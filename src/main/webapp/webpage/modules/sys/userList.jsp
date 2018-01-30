<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
</head>
<body class="skin-coffee gray-bg">
	<div style="overflow:hidden;">
    <sys:message content="${message}"/>
		<!-- 查询条件 -->
	<div class="row">
	<div class="col-sm-12">
		<form:form id="searchForm" modelAttribute="user" action="${ctx}/sys/user/list" method="post" class="coffee-form-inline">
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
			<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/><!-- 支持排序 -->
				<%-- 
				<div class="coffee-form">
					<span class="label-title">归属机构：</span>
					<sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}" title="机构" url="/sys/office/treeData?type=1" cssClass="input-text" allowClear="true"/>
				</div>
				--%>
				<div class="coffee-form">
					<span class="label-title">登录名：</span>
					<form:input path="loginName" htmlEscape="false" maxlength="50" class="input-text"/>
				</div>
				<%--
				<div class="coffee-form">
					<span class="label-title">归属分校：</span>
					<sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}" title="分校" url="/sys/office/treeData?type=2" cssClass=" form-control input-sm" allowClear="true" notAllowSelectParent="true"/>
				</div>
				--%>
				<div class="coffee-form">
					<span class="label-title">邮箱：</span>
					<form:input path="email" htmlEscape="false" maxlength="50" class="input-text"/>
				</div>
		</form:form>
		<div class="coffee-form-button">
			<button class="btn-primary" onclick="search()" ><i class="fa fa-search"></i> 查询</button>
			<button onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
		</div>
	</div>
	</div>
	
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left coffee-table-buttom">
			<shiro:hasPermission name="sys:user:add">
				<table:addRow url="${ctx}/sys/user/form" title="用户" width="830px" height="600px" target="officeContent"></table:addRow><!-- 增加按钮 -->
			</shiro:hasPermission>
	<%-- 		<shiro:hasPermission name="sys:user:edit">
			    <table:editRow url="${ctx}/sys/user/form" id="contentTable"  title="用户" width="800px" height="680px" target="officeContent"></table:editRow><!-- 编辑按钮 -->
			</shiro:hasPermission> --%>
			<shiro:hasPermission name="sys:user:del">
				<table:delRow url="${ctx}/sys/user/deleteAll" id="contentTable"></table:delRow><!-- 删除按钮 -->
			</shiro:hasPermission>
	<%-- 		<shiro:hasPermission name="sys:user:import">
				<table:importExcel url="${ctx}/sys/user/import"></table:importExcel><!-- 导入按钮 -->
			</shiro:hasPermission>
			<shiro:hasPermission name="sys:user:export">
	       		<table:exportExcel url="${ctx}/sys/user/export"></table:exportExcel><!-- 导出按钮 -->
	       </shiro:hasPermission> --%>
			</div>
		<div class="pull-right coffee-table-buttom">
	    <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
		</div>
	</div>
	</div>
	
	<div class="table-responsive coffee-table">
	<table id="contentTable" class="table table-hover">
		<thead>
			<tr>
				<th class="th-checkbox text-center"><input type="checkbox" class="i-checks"></th>
				<th class="sort-column login_name">登录名</th>
				<th class="sort-column name">姓名</th>
				<th class="sort-column phone">邮箱</th>
				<th class="sort-column mobile">手机</th>
				<th class="sort-column c.name">归属机构</th>
				<th class="sort-column o.name">归属分校</th>
				<th class="text-center">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="user">
			<tr>
				<td class="text-center"><input type="checkbox" id="${user.id}" class="i-checks"></td>
				<td><a href="#" onclick="openDialogView('查看用户', '${ctx}/sys/user/form?id=${user.id}','830px', '650px')">${user.loginName}</a></td>
				<td>${user.name}</td>
				<td>${user.email}</td>
				<td>${user.mobile}</td>
				<td>${user.company.name}</td>
				<td>${user.office.name}</td>
				<td class="text-center">
					<shiro:hasPermission name="sys:user:view">
						<a href="#" onclick="openDialogView('查看用户', '${ctx}/sys/user/form?id=${user.id}','830px', '650px')" class="table-link" ><i class="fa fa-search-plus"></i> 查看</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="sys:user:edit">
						<a href="#" onclick="openDialog('修改用户', '${ctx}/sys/user/form?id=${user.id}','830px', '650px', 'officeContent')" class="table-link" ><i class="fa fa-edit"></i> 修改</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="sys:user:del">
						<a href="${ctx}/sys/user/delete?id=${user.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)" class="table-link"><i class="fa fa-trash"></i> 删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<table:page page="${page}"></table:page>
	</div>
</body>
</html>
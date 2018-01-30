<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<%@ page import="com.coffee.modules.sys.utils.UserUtils" %>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/webpage/include/treeview.jsp" %>
	<style type="text/css">
		.ztree {overflow:auto;margin:0;padding:37px 0 0;}
	</style>
	<script type="text/javascript">
		function refresh(){//刷新
			
			window.location="${ctx}/sys/user/index";
		}
	</script>
</head>
<body class="skin-coffee gray-bg">
	
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-content coffee-content">
			<h2 class="coffee-title">用户管理 ${fns:getUser().role.enname}</h2>
			<sys:message content="${message}"/>
	<div id="content" class="row">
		<c:set var="flag" value="true" ></c:set>
		<c:forEach items="${fns:getUser().roleList}" var="role">
			<c:if test="${'system' eq role.enname && flag}">
				<div id="left" class="col-sm-3" >
					<div class="leftBox coffee-leftBox">
						<a onclick="refresh()" class="coffee-leftBox-refresh"><i class="fa fa-refresh"></i></a>
						<div id="ztree" class="ztree leftBox-content"></div>
					</div>
				</div>
				<c:set var="flag" value="false" ></c:set>
			</c:if>
		</c:forEach>
		 <div id="right"  class="col-sm-9 animated fadeInRight">
			<iframe id="officeContent" name="officeContent" src="${ctx}/sys/user/list" width="100%" height="91%" frameborder="0"></iframe>
		</div> 
	</div>
	</div>
	</div>
	<script type="text/javascript">
		var setting = {data:{simpleData:{enable:true,idKey:"id",pIdKey:"pId",rootPId:'0'}},
			callback:{onClick:function(event, treeId, treeNode){
					var id = treeNode.id == '0' ? '' :treeNode.id;
					$('#officeContent').attr("src","${ctx}/sys/user/list?office.id="+id+"&office.name="+treeNode.name);
				}
			}
		};
		
		function refreshTree(){
			$.getJSON("${ctx}/sys/office/treeData",function(data){
				$.fn.zTree.init($("#ztree"), setting, data).expandAll(true);
			});
		}
		refreshTree();
		 
		var leftWidth = 200; // 左侧窗口大小
		var htmlObj = $("html"), mainObj = $("#main");
		var frameObj = $("#left, #openClose, #right, #right iframe");
		function wSize(){
			var strs = getWindowSize().toString().split(",");
			htmlObj.css({"overflow-x":"hidden", "overflow-y":"hidden"});
			mainObj.css("width","auto");
			frameObj.height(strs[0] - 73);
			var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
			$("#right").width($("#content").width()- leftWidth - $("#openClose").width() -60);
			$(".ztree").width(leftWidth).height(frameObj.height() - 37);
		}
	</script>
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<title>咖啡易融通用后台管理系统</title>

<%@ include file="/webpage/include/head.jsp"%>
<script src="${ctxStatic}/common/inspinia.js?v=3.2.0"></script>
<script src="${ctxStatic}/common/contabs.js"></script>
<style type="text/css">
.sepc{
	width: 75%;
    margin: 0 auto;
    margin-top: 20px;
    border-top: 2px solid #6a6666;
}
.fixed-sidebar .nav > .goto > a{
 padding-top: 10px;
}
</style>
<meta name="keywords" content="">
<meta name="description" content="">
<script type="text/javascript">
	$(document).ready(function() {
			$("body").removeClass("skin-1");
			$("body").removeClass("skin-2");
			$("body").removeClass("skin-3");
			$("body").addClass("skin-coffee");
	/* 	 if('${fns:getDictLabel(cookie.theme.value,'theme','默认主题')}' == '天蓝主题'){
			    // 蓝色主题
			        $("body").removeClass("skin-2");
			        $("body").removeClass("skin-3");
			        $("body").addClass("skin-1");
		 }else  if('${fns:getDictLabel(cookie.theme.value,'theme','默认主题')}' == '橙色主题'){
			    // 黄色主题
			        $("body").removeClass("skin-1");
			        $("body").removeClass("skin-2");
			        $("body").addClass("skin-3");
		 }else {
			 // 默认主题
			        $("body").removeClass("skin-2");
			        $("body").removeClass("skin-3");
			        $("body").removeClass("skin-1");
		 }; */
	 });
			
	</script>

</head>

<body class="fixed-sidebar full-height-layout">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu"> 
					<li class="nav-header" ><img class="logo-big"
						src="${ctxStatic}/common/img/logo.png" alt="咖啡易融" />
						<div class="logo-element">
							<img src="${ctxStatic}/common/img/logo-small.png" alt="咖啡易融" />
						</div></li>
					<t:menu menu="${fns:getTopMenu()}"></t:menu>
					<!-- <li class="sepc">&nbsp;</li>
					<li class="goto" id="goto">
						<a  href="https://www.coffee-ease.com/" title="点我处理五位申请码" target="_blank" >
						<i class="fa coffee-01"></i> 
						<span class="nav-label">旧版商家后台</span>
						</a>
					</li> -->
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="dashbard-1">
			<div class="row">
				<div class="main-top-bar" role="navigation">
					<div class="navbar-header">
						<a class="navbar-minimalize" href="#"><i class="fa fa-bars"></i></a>
					</div>
					<div class="profile-warp">
						<div class="dropdown navbar-right">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<strong class="font-bold">${fns:getUser().name}</strong>
								<%--<span class="text-muted">(${fns:getUser().roleNames})</span> --%>
								<b class="text-muted caret"></b>
							</a>
							<ul class="dropdown-menu animated fadeInUp">
								<li><a class="J_menuItem" href="${ctx }/sys/user/info"><i class="fa fa-user"></i>个人资料</a></li>
								<%-- <li><a class="J_menuItem" href="${ctx }/edu/educationOrg/info"><i class="fa fa-tasks"></i>机构资料</a></li> --%>
								<li class="divider"></li>
								<li><a href="${ctx}/logout"><i class="fa fa-power-off"></i>安全退出</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:;" class="active J_menuTab"
							data-id="${ctx}/home">首页</a>
					</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<!-- <li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li> -->
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<%-- <a href="${ctx}/logout" class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a> --%>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
					src="${ctx}/home" frameborder="0" data-id="${ctx}/home" seamless></iframe>
			</div>
			<div class="footer">2017 &copy;COFFEE-EASE.COM</div>
		</div>
		<!--右侧部分结束-->


	</div>
</body>

<!-- 语言切换插件，为国际化功能预留插件 -->
<script type="text/javascript">

$(document).ready(function(){

	$("a.lang-select").click(function(){
		$(".lang-selected").find(".lang-flag").attr("src",$(this).find(".lang-flag").attr("src"));
		$(".lang-selected").find(".lang-flag").attr("alt",$(this).find(".lang-flag").attr("alt"));
		$(".lang-selected").find(".lang-id").text($(this).find(".lang-id").text());
		$(".lang-selected").find(".lang-name").text($(this).find(".lang-name").text());

	});

});

function changeStyle(){
   $.get('${pageContext.request.contextPath}/theme/ace?url='+window.top.location.href,function(result){   window.location.reload();});
}

</script>



<%-- <!-- 即时聊天插件  开始-->
<link href="${ctxStatic}/layer-v2.3/layim/layui/css/layui.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript">
var currentId = '${fns:getUser().loginName}';
var currentName = '${fns:getUser().name}';
var currentFace ='${fns:getUser().photo}';
var url="${ctx}";
var static_url="${ctxStatic}";
var wsServer = 'ws://'+window.document.domain+':8668'; 

</script>
<!--webscoket接口  -->
<script src="${ctxStatic}/layer-v2.3/layim/layui/layui.js"></script>

<script src="${ctxStatic}/layer-v2.3/layim/layim.js"></script>
<!-- 即时聊天插件 结束 -->
<style>
/*签名样式*/
.layim-sign-box{
	width:95%
}
.layim-sign-hide{
  border:none;background-color:#F5F5F5;
}
</style> --%>

</html>
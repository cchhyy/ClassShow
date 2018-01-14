<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js" ></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
<title>这是网址后台管理系统的首页(新写的)</title>
<script type="text/javascript">
	//当点击后台管理系统首页的左侧菜单栏中的超链接时,会执行该方法,打开一个tabs选项卡
	function open(src,tabsName){
		//1:先判断我们的选项卡中是否已经包含了该选项,如果包含了,直接选中即可,如果没有包含,打开一个新的选项卡
		var f=$("#tt").tabs('exists',tabsName);
		//alert(f);
		if(f){
			//说明已经存在了,直接选中即可
			$("#tt").tabs('select',tabsName);
		}else{
			var s='<iframe width="99%" height="99%" style="border:0px" src="${pageContext.request.contextPath}/'+src+'" />';
			//alert(s);
			//说明不存在,需要添加
			$('#tt').tabs('add',{    
			    title:tabsName,    
			    content:s,    
			    closable:true  
			}); 
		}
	}

</script>

<frame frameborder="value">
</head>
<body class="easyui-layout" data-options="border:false">   
    <div data-options="region:'north',split:false,border:false" style="height:100px;">
    	<center><font style="font-size: 40px;color: #ff0099;">欢迎光临传智在线商城后台管理系统</font></center>
    </div>   
    <div data-options="region:'south',split:false" style="height:25px;background-color: #33cccc">
    	<center>传智播客版权所有</center>
    </div>   
    <div data-options="region:'west',title:'菜单管理',split:false" style="width:200px;">
    	<div class="easyui-accordion"  data-options="fit:true,border:false">   
		    <div title="分类管理" data-options="iconCls:'icon-search'" style="overflow:auto;padding:10px;">   
		        <h3 style="color:#0099FF;"><a href="javascript:open('admin/category/clist.jsp','分类列表')">分类列表</a> </h3>   
		    </div> 
		    <div title="商品管理" data-options="iconCls:'icon-search'" style="overflow:auto;padding:10px;">   
		        <h3 style="color:#0099FF;"><a href="javascript:open('admin/product/plist.jsp','商品列表')">商品列表</a> </h3>   
		    </div> 
		    <div title="订单管理" data-options="iconCls:'icon-search'" style="overflow:auto;padding:10px;">   
		        <h3 style="color:#0099FF;"><a href="javascript:open('admin/order/ToOlist.jsp','订单列表')">订单列表</a></h3>   
		    </div> 
		    <div title="用户管理" data-options="iconCls:'icon-search'" style="overflow:auto;padding:10px;">   
		        <h3 style="color:#0099FF;"><a href="javascript:open('admin/user/ulist.jsp','用户列表')">用户列表</a></h3>   
		    </div>   
		</div>  
    </div>   
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
    	
    	<div id="tt" class="easyui-tabs"  data-options="fit:true">   
		    <div title="欢迎页面" data-options="iconCls:'icon-reload',closable:true" style="padding:20px;display:none;">   
		        欢迎欢迎,热烈欢迎...........   
		    </div>   
		</div>  
    
    </div>   
</body>  
</html>
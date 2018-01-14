<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>网上后台管理系统(老的)</title>
	<style type="text/css">
		#aa a{
			text-decoration: none;
			font-size: 17px
		}
	</style>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#aa a").click(function(){
				//获取标签体
				var $title = $(this).text();
				var $href = $(this).attr("href");
				
				if($("#tt").tabs("exists",$title)){
					$("#tt").tabs("select",$title);
				}else{
					$("#tt").tabs("add",{
						title:$title,
						content:"<iframe src='"+$href+"' style='width:100%;height:100%;border:0px'></iframe>"
					});
				}
				
				return false;
			});
		})
	</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north'" style="height:100px">
			<h1><i>CRM客户关系管理系统</i></h1>
		</div>
		<div data-options="region:'south'" style="height:25px;background-color:#B4CDE6;overflow: hidden;text-align: center;font-size=12px" >
			<b>商城管理平台</b>
			<!-- <iframe src="bottom.jsp" width="100%"></iframe> -->
		</div>
		<div data-options="region:'west',split:false,iconCls:'icon-search'" title="菜单" style="width:200px;">
			<div id="aa" class="easyui-accordion" data-options="fit:true,border:false">   
			    <div title="分类管理" data-options="iconCls:'icon-search'" style="padding:10px;">
			    	<a href="${pageContext.request.contextPath }/admin/category/list.jsp">分类列表</a>   
			    </div>   
			    <div title="商品管理" data-options="iconCls:'icon-search'" style="padding:10px;">
			   	 	<a href="${pageContext.request.contextPath }/admin/product/list.jsp">商品列表</a>   
			    </div>   
			    <div title="订单管理" data-options="iconCls:'icon-search'" style="padding:10px;">   
			    	<a href="">订单列表</a>
			    </div>   
			</div>
		</div>
		<div data-options="region:'center',iconCls:'icon-ok'">
			<div id="tt" class="easyui-tabs" data-options="fit:true,border:false">   
			    <div title="首页" style="padding:20px;display:none;">   
			       	<center><h1>欢迎使用crm系统</h1> </center> 
			    </div>   
			</div>
		</div>
	</div>
</body>

</html>
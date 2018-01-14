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
<title>Insert title here</title>
</head>
<body>
	<div id="cc" class="easyui-layout" data-options="fit:true">   
	    <div data-options="region:'north',split:false" style="height:100px;">欢迎光临</div>   
	    <div data-options="region:'south',split:false,border:true" style="height:30px;">关于我们</div>   
	    <div data-options="region:'west',title:'菜单管理',split:false" style="width:200px;">
	    	<div class="easyui-accordion" data-options="fit:true,border:false">   
			    <div title="分类管理" data-options="iconCls:'icon-save'" style="overflow:auto;padding:15px;">   
			        <h3 style="color:#0099FF;">内标题</h3>   
			    </div>   
			    <div title="分类管理" data-options="iconCls:'icon-save'" style="overflow:auto;padding:15px;">   
			        <h3 style="color:#0099FF;">内标题</h3>   
			    </div>  
			    <div title="分类管理" data-options="iconCls:'icon-save'" style="overflow:auto;padding:15px;">   
			        <h3 style="color:#0099FF;">内标题</h3>   
			    </div>  
			</div> 
	    </div>   
	    <div data-options="region:'center'" style="padding:5px;background:#eee;">
	    	
	    
	    		<div  class="easyui-tabs" data-options="fit:true">   
				    <div title="添加分类" style="padding:20px;display:none;">   
				       	天行健,君子当自强不息   
				    </div>   
				    <div title="编辑分类" data-options="closable:true" style="overflow:auto;padding:20px;display:none;">   
				      	 地势坤,君子以厚德载物   
				    </div>   
				    <div title="查询分类" data-options="iconCls:'icon-reload',closable:true" style="padding:20px;display:none;">   
				      	人生就像一杯茶,苦,会苦一阵子,不会苦一辈子   
				    </div>   
				</div>  
	    </div>   
	</div>  
</body>
</html>
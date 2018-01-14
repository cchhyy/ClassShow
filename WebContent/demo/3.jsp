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
	<div class="easyui-accordion" style="width:300px;height:800px;">   
	    <div title="分类管理" data-options="iconCls:'icon-save'" style="overflow:auto;padding:15px;">   
	        <h3 style="color:#0099FF;">内标题</h3>   
	        <p>Accordion is a part of easyui framework for jQuery.     
	        It lets you define your accordion component on web page more easily.</p>   
	    </div>   
	    <div title="商品管理" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">   
	        默认选中  
	    </div>   
	   <div title="订单管理" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">   
	      	  默认选中  
	    </div>    
	</div>  
</body>
</html>
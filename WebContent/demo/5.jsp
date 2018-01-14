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
	<table class="easyui-datagrid" data-options="fitColumns:true">   
	    <thead>   
	        <tr>   
	            <th data-options="field:'code'">编码</th>   
	            <th data-options="field:'name'">名称</th>   
	            <th data-options="field:'price'">价格</th>   
	        </tr>   
	    </thead>   
	    <tbody>   
	        <tr>   
	            <td>001</td><td>name111111111111111111111111111111111</td><td>2323</td>   
	        </tr>   
	        <tr>   
	            <td>002</td><td>name2</td><td>4612</td>   
	        </tr>   
	    </tbody>   
	</table> 
</body>
</html>
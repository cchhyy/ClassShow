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
	<table id="tt">   
	</table> 
	<script type="text/javascript">
		//动态的加载数据并追加到tt这个表格中
		$("#tt").datagrid({
			 url:'abc.json',    
			    columns:[[  
			        {field:'image',title:'商品图片',width:500,formatter:function(value,row,index){
			        	//alert(value+"===>"+row+"===>"+index);
			        	var v='<img  width="30px" height="30px" src="${pageContext.request.contextPath}'+value+'">';
			        	alert(v);
			        	return v;
			        }},
			        {field:'pname',title:'商品名称',width:500},    
			        {field:'price',title:'商品价格',width:500},    
			        {field:'color',title:'手机颜色',width:500,align:'right'},
			        {field:'size',title:'屏幕尺寸',width:500,align:'right'}
			    ]],
			  fit:true,
			  fitColumns:true,
			  singleSelect:true,
			  rownumbers:true,
			  pagination:true,
			  pageNumber:1,
			  pageSize:10,
			  pageList:[10,15,30]
		});
	</script>
	<img alt=""   src="">
</body>
</html>
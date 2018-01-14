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
<title>编辑商品的form表单</title>
</head>
<body>
	<form id="fff" method="post" enctype="multipart/form-data">  
		<div style="padding-left: 50px;padding-top: 10px">
		    <div>   
		    	<input type="hidden" name="pid" id="pid">
		        <label for="name">商品名称:</label>   
		        <input  type="text" name="pname" id="pname111" value="2222"/>   
		    </div>   
		    <div>   
		        <label for="email">商城价:</label>   
		        <input class="easyui-validatebox" type="text" name="shop_price" id="shop_price" data-options="required:true" />   
		    </div> 
		    <div>   
		        <label for="name">市场价:</label>   
		        <input class="easyui-validatebox" type="text" name="market_price" id="market_price" data-options="required:true" />   
		    </div> 
		    <div>   
		        <label for="name">图片:</label>   
		        <input  type="File" name="pimage" />   
		    </div> 
		    <div>   
		        <label for="name">是否热门:</label>   
		        <input type="radio" name="is_hot" value="1" checked="checked"/> 热的不要不要的
		        <input type="radio" name="is_hot" value="0" /> 冷  
		    </div> 
		    <div>   
		        <label for="name">所属分类:</label>   
		        <input id="cc" name="cid" value="请选择商品分类">
		        <script type="text/javascript">
			        $('#cc').combobox({    
			            url:'${pageContext.request.contextPath}/ProductServlet?m=findAllCategory',    
			            valueField:'cid',    
			            textField:'cname'   
			        }); 
		        </script>
		    </div>
		     <div>   
		        <label for="name">商品描述:</label>   
		        <textarea rows="5" cols="30" name="pdesc" id="pdesc"></textarea>
		    </div> 
	    </div>   
	</form> 
</body>
</html>
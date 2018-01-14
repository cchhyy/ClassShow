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
	<form id="ff" method="post">   
	    <div>   
	        <label for="name">姓名:</label>   
	        <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />   
	    </div>   
	    <div>   
	        <label for="email">Email:</label>   
	        <input class="easyui-validatebox" type="text" name="email" data-options="validType:'email'" />   
	    </div>
	    <div>
	    <select id="cc" class="easyui-combobox" name="dept" style="width:200px;">   
		    <option value="aa">aitem1</option>   
		    <option>bitem2</option>   
		    <option>bitem3</option>   
		    <option>ditem4</option>   
		    <option>eitem5</option>   
		</select>  
		</div>
		
		<hr>
		<select id="ccc" class="easyui-combobox" name="dept" style="width:200px;"> </select>
		<script type="text/javascript">
			$('#ccc').combobox({    
			    url:'combobox_data.json',    
			    valueField:'id',    
			    textField:'text'   
			}); 
			//alert(1);
		</script>
		
	</form>  
</body>
</html>
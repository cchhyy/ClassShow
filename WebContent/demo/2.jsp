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
	<div  class="easyui-tabs" style="width:500px;height:250px;">   
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
<hr>
	<div id="tt">
	</div>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="javascript:getTabs()">点我呀</a>
	<script type="text/javascript">
		$("#tt").tabs({
			border:false,    
		    onSelect:function(title){    
		       // alert(title+' is selected');
		    }    
		});
		$('#tt').tabs('add',{    
		    title:'第一个',    
		    content:'少壮不努力老大徒伤悲',    
		    closable:true,    
		    tools:[{    
		        iconCls:'icon-mini-refresh',    
		        handler:function(){    
		            alert('刷新了...');    
		        }    
		    }]    
		});
		function getTabs(){
			var t =$("#tt").tabs('getSelected');
			//alert(t);
			var index = $('#tt').tabs('exists',t);
			alert(index);
		}
	</script>

	
</body>
</html>
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
<title>easyUI的简单练习</title>
<script type="text/javascript">
	function abc() {
		alert("嘿嘿嘿...");
	}
</script>
</head>
<body>
	<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="javascript:abc()">点我呀</a> 
	<br>
	<a id="a2">点我干啥</a>
	 <script type="text/javascript">
	 	$("#a2").linkbutton({
	 		iconCls: 'icon-search'
	 	});
	 	$("#a2").bind('click',function(){
	 		alert("点我我就嗷嗷叫...");
	 		$("#dd").window('open');
	 	});
	 </script>
	 
	 <hr>
	 <a id="a3" class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="javascript:bbc()">点我蹦出窗口</a>
	 <script type="text/javascript">
	 	function bbc(){
	 		//弹出一个easyUI的对话框
	 		//$.messager.alert('我要警告您','蹦蹦蹦...');    
			//alert('蹦蹦蹦...');
	 		$.messager.confirm('可以选喲','您确认想要删除记录吗？',function(r){    
	 		    if (r){    
	 		        alert('确认删除');    
	 		    }    
	 		});  
	 	}
	 </script>
	 <hr>
	 <div id="dd" class="easyui-dialog" title="我的对话框" style="width:600px;height:350px;"   
	        data-options="iconCls:'icon-save',resizable:false,modal:false,toolbar:[{
				text:'编辑哈哈',
				iconCls:'icon-edit',
				handler:function(){alert('可以编辑了')}
			},{
				text:'帮助嘿嘿',
				iconCls:'icon-help',
				handler:function(){alert('我能为您做点啥')}
			}],buttons:[{
				text:'保存嘻嘻',
				handler:function(){$.messager.alert('我要警告您','蹦蹦蹦...');}
			},{
				text:'关闭哼哼',
				handler:function(){$('#dd').window('close');}
			}],closed:true">   
	   床前明月光<br>
	   疑是地上霜
	</div>  
</body>
</html>
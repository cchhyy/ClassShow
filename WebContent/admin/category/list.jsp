<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#dg").datagrid({
				url:"${pageContext.request.contextPath }/adminCategory?method=findAll",
				columns:[[
					 {field:'cid',title:'id',width:100},    
      				 {field:'cname',title:'名称',width:100},
      				 {field:'xx',width:100,title:'操作',
      					formatter: function(value,row,index){
      						return '<a href="javascript:void(0)" onclick="edit(\''+row.cid+'\')">修改</a> | <a href="javascript:void(0)" onclick="del(\''+row.cid+'\')">删除</a>';
      					}
      				 }
				]],
				striped:true,
			    fitColumns:true,
			    fit:true,
			    rownumbers:true,
			    singleSelect:true,
			    border:false,
			    toolbar: [{
					iconCls: 'icon-add',
					text:'添加分类',
					handler: function(){
						//点击按钮 弹出保存窗口
						//$("#winAdd").window("open");
						$("#save_dialog").dialog("open");
					}
				}]
			});
		})
	</script>
<title>Insert title here</title>
</head>
<body>
	<table id="dg"></table>
	
	<div id="save_dialog" class="easyui-dialog" title="新建分类" style="width:400px;height:200px;padding:50px 20px"   
        data-options="iconCls:'icon-save',modal:true,closable:true,closed:true">   
	   	<form method="post" id="save_form">
	   		<table width="100%">
	   			<tr align="center">
	   				<td>
	   					分类名称:
	   				</td>
	   				<td>
	   					<input type="text" class="easyui-textbox" name="cname"><br>
	   				</td>
	   			</tr>
	   			<tr  align="center">
	   				<td colspan="2">
	   					<input type="button" class="easyui-linkbutton" value="保存" onclick="saveCategory()" style="width:80px"/>
	   				</td>
	   			</tr>
	   		</table>
	   	</form>   
	</div>
	
	<div id="update_dialog" class="easyui-dialog" title="编辑分类" style="width:400px;height:200px;padding:50px 20px"   
        data-options="iconCls:'icon-edit',modal:true,closable:true,closed:true">   
	   	<form method="post" id="update_form">
	   		<input type="hidden" name="cid">
   			<table width="100%">
	  			<tr align="center">
	  				<td>
	  					分类名称:
	  				</td>
	  				<td>
	  					<input type="text" class="easyui-textbox" name="cname"><br>
	  				</td>
	  			</tr>
	  			<tr  align="center">
	  				<td colspan="2">
	  					<input type="button" class="easyui-linkbutton" value="修改" onclick="updateCategory()" style="width:80px"/>
	  				</td>
	  			</tr>
	   		</table>
	   	</form>   
	</div>
</body>
<script type="text/javascript">
	function saveCategory(){
		//获取表单
		$("#save_form").form({
			//设置表单提交路径
			url:"${pageContext.request.contextPath}/adminCategory?method=save",
		 	success:function(data){    
		        var $data = eval("("+data+")");
		 		
		        $.messager.show({
		        	title:'保存消息',
		        	msg:$data.msg,
		        	timeout:3000,
		        	showType:'fade'
		        });

		        
		     	//清除表单
				$("#save_form").form("clear");
				
				//关闭对话框
				$("#save_dialog").dialog("close");  
				
				//刷新表格
				$("#dg").datagrid("reload");
		    }
		});
		
		//提交表单
		$("#save_form").submit();
	}
	
	function edit(cid){
		$("#update_form").form("load","${pageContext.request.contextPath}/adminCategory?method=getById&id="+cid);
		$("#update_dialog").dialog("open");
	}
	
	function updateCategory(){
		//获取表单
		$("#update_form").form({
			//设置表单提交路径
			url:"${pageContext.request.contextPath}/adminCategory?method=update",
		 	success:function(data){    
		        var $data = eval("("+data+")");
		 		
		        $.messager.show({
		        	title:'修改消息',
		        	msg:$data.msg,
		        	timeout:3000,
		        	showType:'fade'
		        });

		        
		     	//清除表单
				$("#update_form").form("clear");
				
				//关闭对话框
				$("#update_dialog").dialog("close");  
				
				//刷新表格
				$("#dg").datagrid("reload");
		    }
		});
		
		//提交表单
		$("#update_form").submit();
	}
	
	function del(cid){
		$.messager.confirm('确认','您确认想要删除记录吗?',function(r){    
		    if(r){  
		    	$.post("${pageContext.request.contextPath}/adminCategory?method=delete&id="+cid,function(data){
		    		$.messager.alert('警告',data.msg);
		    		//刷新表格
					$("#dg").datagrid("reload");
		    	},"json");
		    }    
		}); 
	}
</script>
</html>
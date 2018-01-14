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
<script type="text/javascript">
	//当页面加载的时候,对table添加数据
	$(function(){
		$('#dg').datagrid({    
		    url:'${pageContext.request.contextPath}/ProductServlet?m=findAllCategory',    
		    columns:[[    
		        {field:'cid',title:'分类编号',width:300},    
		        {field:'cname',title:'分类名称',width:400},    
		        {field:'xxxxsd',title:'操作分类',width:500,align:'right',formatter:function(value,row,index){
		        	//根据row对象,获取cid的值,用cid的值拼接出两个超链接,分别是编辑分类和删除分类
		        	var v = "<a href='javascript:toEdit("+'"' +row.cid+'","'+row.cname+'"'+")'>编辑分类</a>|<a href='javascript:toDel("+'"' +row.cid+'"'+")'>删除分类</a>";
		        	return v;
		        }}
		    ]],
		    fitColumns:true,
		    singleSelect:true,
		    toolbar: [{
				iconCls: 'icon-add',
				text:'添加分类',
				handler: function(){
					//让事先隐藏好的dialog对话框显示出来;
					$("#dd").window("open");
				}
			}]
		});  
	})
	//删除分类的方法
	function toDel(cid){
		$.messager.confirm('确认框','您确认想要删除该分类吗？',function(r){    
		    if (r){    
		        //发送ajax请求,删除分类
		        var url="${pageContext.request.contextPath}/admin/AdminServlet";
		        var data = {m:"delCategoryByCid",cid:cid};
		        $.post(url,data,function(d){
		        	alert(d);
		        	//重新加载数据即可;(刷新数据)
		        	$('#dg').datagrid('reload');
		        },"text");
		    }    
		});  
	}
	//编辑分类的方法
	function toEdit(cid,cname){
		//alert(cid+"===>"+cname);
		//将cid和cname分别保存到form表单中,并展示dialog对话框
		$("#cid").val(cid);
		$("#cname").val(cname);
		$("#edit").window('open');
	}
</script>
</head>
<body>
	<table id="dg"></table>
	
	<!-- 添加分类的对话框 -->
	<div id="dd" class="easyui-dialog" title="添加分类" style="width:300px;height:150px;text-align: center;padding-top: 25px"   
        data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true,buttons:[{
				text:'保存',
				handler:function(){
					//让表单提交即可
					//alert('提交哈');
					$('#ff').form({    
					    url:'${pageContext.request.contextPath}/admin/AdminServlet',    
					    success:function(data){    
					        alert(data);
					        //刷新数据
					         $('#dg').datagrid('reload');   
					         $('#dd').window('close');
					    }    
					});    
					$('#ff').submit();  
				}
			},{
				text:'关闭',
				handler:function(){
					$('#dd').window('close');
				}
			}]">   
    	  <form id="ff" method="get">   
		    <div>   
		        <label for="name">分类名称</label>   
		        <input class="easyui-validatebox" type="text" name="cname" data-options="required:true" />   
		        <input type="hidden" value="saveCategory" name="m">
		    </div>   
		</form>  
	</div> 
	
	
	<!-- 编辑分类的对话框 -->
	<div id="edit" class="easyui-dialog" title="编辑分类" style="width:300px;height:150px;text-align: center;padding-top: 25px"   
        data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true,buttons:[{
				text:'保存',
				handler:function(){
					//让表单提交即可
					$('#editff').form({    
					    url:'${pageContext.request.contextPath}/admin/AdminServlet',    
					    success:function(data){    
					        alert(data);
					        //刷新数据
					         $('#dg').datagrid('reload');   
					         $('#edit').window('close');
					    }    
					});    
					$('#editff').submit();  
				}
			},{
				text:'关闭',
				handler:function(){
					$('#edit').window('close');
				}
			}]">   
    	  <form id="editff" method="get">   
		    <div>   
		        <label for="name">分类名称</label>   
		        <input id="cname" class="easyui-validatebox" type="text" name="cname" data-options="required:true" />   
		        <input type="hidden" value="editCategoryByCid" name="m">
		         <input type="hidden"  name="cid" id="cid">
		    </div>   
		</form>  
	</div> 
</body>
</html>
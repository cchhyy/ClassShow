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
<title>商品列表展示的数据表格</title>
<script type="text/javascript">
	//当页面加载的时候,动态的给数据表格追加内容
	$(function(){
		$('#dg').datagrid({    
		    url:'${pageContext.request.contextPath}/admin/AdminServlet?m=findProductByPage',    
		    columns:[[    
		        {field:'pid',title:'商品编号',width:100},    
		        {field:'pname',title:'商品名称',width:200},  
		        {field:'market_price',title:'市场价',width:200},    
		        {field:'shop_price',title:'商城价',width:200},
		        {field:'pimage',title:'商品图片',width:200,formatter:
		        	function(value,row,index){
		        	//根据value的值拼接出图片标签
		        	var v ='<img width="30px" height="30px" src="${pageContext.request.contextPath}/'+value+'">';
		        	return v;
		       		}
		        },    
		        {field:'pdate2',title:'上架日期',width:200},
		        {field:'is_hot',title:'是否热门',width:200,formatter:
		        	function(value,row,index){
		        	//根据value的值拼接出图片标签
			        	if(value){
			        		return "很热喲";
			        	}else{
			        		return "不咋热";
			        	}
		       		}
		        },    
		        {field:'pflag',title:'是否下架',width:200,formatter:
		        	function(value,row,index){
		        	//根据value的值拼接出图片标签
			        	if(value){
			        		return "下架了";
			        	}else{
			        		return "正在热卖";
			        	}
		       		}
		        },
		        {field:'pdesc',title:'商品描述',width:300}, 
		        {field:'categoryName',title:'所属分类',width:200},
		        {field:'xxxxsd',title:'操作商品',width:300,align:'right',formatter:function(value,row,index){
		        	//根据row对象,获取cid的值,用cid的值拼接出两个超链接,分别是编辑分类和删除分类
		        	var v = "<a href='javascript:toEdit()'>编辑商品</a>|<a href='javascript:toDel("+'"' +row.pid+'"'+")'>删除商品</a>";
		        	return v;
		        }}
		    ]],
		    fitColumns:true,
		    singleSelect:true,
		    toolbar: [{
				iconCls: 'icon-add',
				text:'添加商品',
				handler: function(){
					//让事先隐藏好的dialog对话框显示出来;
					$("#dd").window("open");
				}
			}],
			pagination:true,
			pageNumber:1,
			pageSize:12,
			pageList:[12,20]
		});  
	})
	//当点击删除商品的时候,会执行该方法
	function toDel(pid){
		//让用户确认是否真的要删除
		$.messager.confirm('确认','您确认想要删除 '+pid+' 号商品吗？',function(r){    
		    if (r){    
		         //发送ajax请求,删除商品,重新加载数据表格
		         var url = "${pageContext.request.contextPath}/admin/AdminServlet?m=delProductByPid&pid="+pid;
		         $.post(url,function(d){
		        	 alert(d);
		        	 //重新加载数据表格
		        	 $('#dg').datagrid('reload');
		         },"html");
		    }    
		});  
	}
	//当点击编辑按钮的时候,会执行该方法
	function toEdit(){
		//1:获取用户选中的行对象
		var row=$('#dg').datagrid('getSelected');
		//2:打开edit dialog对话框
		$('#edit').window('open');
		//3:将row对象的信息填充到编辑界面的表单中
		$("#pid").val(row.pid);
		$("#pname111").val(row.pname);
		$("#shop_price").val(row.shop_price);
		$("#market_price").val(row.market_price);
		$("#pdesc").val(row.pdesc);
	}
	//当页面加载的时候,对dd对话框,填充表单数据内容
	$(function(){
		$('#dd').dialog({    
		    title: '添加商品',    
		    width: 350,    
		    height: 400,    
		    closed: true,    
		    cache: false,    
		    href: 'addProduct.jsp',    
		    modal: true,
		    buttons:[{
				text:'确定添加',
				handler:function(){
					//让form表单提交
					$('#ff').form({    
					    url:'${pageContext.request.contextPath}/admin/AddProductServlet',//因为涉及图片上传,getParameter方法不能使用了    
					    success:function(data){    
					        alert(data);
					        //关闭对话框
					        $('#dd').window('close');
					        //刷新数据表格
					        $('#dg').datagrid('reload');
					    }    
					});     
					$('#ff').submit();  
				}
			},{
				text:'关闭了',
				handler:function(){
					$('#dd').window('close');
				}
			}]

		});  
	})
	
</script>
</head>
<body>
	<table id="dg"></table>
	<!-- 添加商品信息的对话框 -->
	<div id="dd"></div> 
	<!-- 编辑商品信息的对话框,需要回显信息,需要将form表单直接写在该页面中 -->
	<div id="edit" class="easyui-dialog" title="编辑商品" style="width:350px;height:400px;"   
        data-options="iconCls:'icon-save',resizable:false,modal:true, closed: true,
        buttons:[{
				text:'确定修改',
				handler:function(){
					//让form表单提交
					$('#fff').form({    
					    url:'${pageContext.request.contextPath}/admin/EditProductServlet',//因为涉及图片上传,getParameter方法不能使用了    
					    success:function(data){    
					        alert(data);
					        //关闭对话框
					        $('#edit').window('close');
					        //刷新数据表格
					        $('#dg').datagrid('reload');
					    }    
					});     
					$('#fff').submit();  
				}
			},{
				text:'关闭了',
				handler:function(){
					$('#edit').window('close');
				}
			}]
        ">   
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
			        <label for="name">是否下架:</label>   
			        <input type="radio" name="pflag" value="0" checked="checked"/> 上架
			        <input type="radio" name="pflag" value="1" /> 下架
			    </div> 
			    <div>   
			        <label for="name">所属分类:</label>   
			        <input id="ccc" name="cid" value="请选择商品分类">
			        <script type="text/javascript">
				        $('#ccc').combobox({    
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
	</div>  
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#dg').datagrid({    
			    url:'${pageContext.request.contextPath }/adminProduct?method=findByPage',    
			    columns:[[    
			        {field:'pname',title:'商品名称',width:100},    
			        {field:'market_price',title:'市场价格',width:50},    
			        {field:'shop_price',title:'商城价格',width:50},   
			        {field:'pdesc',title:'商品描述',width:300,
	                    formatter: function(value,row,index){
	                      return '<span  title='+value+'>'+value+'</span>'  
	                    }	
			        },   
			        {field:'is_hot',title:'是否热门',width:30,
			        	formatter: function(value,row,index){
							if (value == 1){
								return "是";
							} else {
								return "否";
							}
						}
					},   
			        {field:'pimage',title:'图片',width:100,
						formatter: function(value,row,index){
							return "<img src='${pageContext.request.contextPath}/"+value+"' width='50px'/>";
						}
			        }   
			    ]],
			    striped:true,
			    pagination:true,
			    singleSelect:true,
			    pageNumber:1,
			    pageSize:7,
			    pageList:[7,15,20],
			    fit:true,
			    fitColumns:true,
			    //rownumbers:true,
			    nowrap:false,
			    toolbar: [{
					iconCls: 'icon-add',
					text:'添加商品',
					handler: function(){
						$("#save_dialog").dialog("open");
					}
				}]

			});
			
			
			//所属分类
			$("#caid").combobox({
				url:'${pageContext.request.contextPath}/adminCategory?method=findAll',    
			    valueField:'cid',
			    textField:'cname',
			    panelHeight:'auto',
			    value:'-请选择-'
			})
		})
	</script>
</head>
<body>
	<table id="dg"></table>
	<div id="save_dialog" class="easyui-dialog" style="width:520;height:300;padding:10px"
		data-options="title:'添加商品',iconCls:'icon-save',modal:true,closable:true,closed:true">
		<form id="save_form" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>商品名称:</td>
					<td><input class="easyui-textbox" name="pname" style="width:100%"></td>
					<td>所属分类:</td>
					<td><input id="caid" name="cid" style="width:100%"></td>
				</tr>
				<tr>
					<td>市场价格:</td>
					<td><input class="easyui-textbox" name="market_price" style="width:100%"></td>
					<td>商城价格:</td>
					<td><input class="easyui-textbox" name="shop_price" style="width:100%"></td>
				</tr>
				<tr>
					<td>是否热门:</td>
					<td>
						<select class="easyui-combobox" name="is_hot" style="width:100%" data-options="panelHeight:'auto'">   
						    <option value="1">是</option>   
						    <option value="0">否</option>   
						</select>
					</td>
					<td>图片:</td>
					<td>
						<input name="pimage" class="easyui-filebox" data-options="buttonText:'选择文件'" style="width:100%">
					</td>
				</tr>
				<tr>
					<td>商品描述:</td>
					<td colspan="3">
						<input class="easyui-textbox" name="pdesc" style="width:100%" data-options="multiline:true">
					</td>
				</tr>
				<tr style="text-align:center;padding:5px 0">
					<td colspan="4">
						<input type="button" value="保存" class="easyui-linkbutton" onclick="save_product()" style="width:80px">
						<input type="reset" value="重置" class="easyui-linkbutton"  style="width:80px">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	function save_product(){
		$("#save_form").form('submit', {    
		    url:"${pageContext.request.contextPath}/addProduct",    
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
	}
</script>
</html>
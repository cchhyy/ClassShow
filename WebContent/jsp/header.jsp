<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>信息头状态栏显示</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.validate.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/messages_zh.js" type="text/javascript"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
		
		<script type="text/javascript">
			//当页面加载完成之后,向服务器发送ajax请求,获取数据库中的商品分类信息,动态的追加到ul列表中;
			$(function(){
				//发送ajax
				var url="${pageContext.request.contextPath}/ProductServlet";
				var data = {m:"findAllCategory"};
				$.post(url,data,function(d){
					//此时的d就是服务器查询出来的所有分类的数据;
					//遍历d就可以获取每一个分类对象
					for(var i=0;i<d.length;i++){
						//根据索引获取每一个分类对象,根据分类对象,获取分类的名称和编号
						var cid =d[i].cid;
						var cname =d[i].cname;
						//将分类名称拼接成一个li标签
						var li = '<li><a href="${pageContext.request.contextPath}/ProductServlet?m=findProductListByPage&cid='+cid+'">'+cname+'</a></li>';
						//将li标签添加到ul列表中
						$("#cateList").html($("#cateList").html()+li);
					}
				},"json");
			});
		</script>
</head>
<body>
	<!--
            	时间：2015-12-30
            	描述：菜单栏
            -->
			<div class="container-fluid">
				<div class="col-md-4">
					<img src="${pageContext.request.contextPath}/img/logo2.png" />
				</div>
				<div class="col-md-4">
					<img src="${pageContext.request.contextPath}/img/header.png" />
				</div>
				<div class="col-md-4" style="padding-top:20px">
					<ol class="list-inline">
						<c:if test="${user==null}">
							<li><a href="${pageContext.request.contextPath}/jsp/login.jsp">登录</a></li>
							<li><a href="${pageContext.request.contextPath}/jsp/register.jsp">注册</a></li>
						</c:if>
						<c:if test="${user!=null}">
							<li>亲,欢迎登陆:${user.username}</li>
							<li><a href="${pageContext.request.contextPath}/UserServlet?m=logOut">退出登录</a></li>
							<li><a href="${pageContext.request.contextPath}/jsp/cart.jsp">购物车</a></li>
							<li><a href="${pageContext.request.contextPath}/OrderServlet?m=findOrdersByUid">我的订单</a></li>
						</c:if>
					</ol>
				</div>
			</div>
			<!--
            	时间：2015-12-30
            	描述：导航条
            -->
			<div class="container-fluid">
				<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="${pageContext.request.contextPath}/ProductServlet?m=toIndex">首页</a>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav" id = "cateList">
								
							</ul>
							<form class="navbar-form navbar-right" role="search">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Search">
								</div>
								<button type="submit" class="btn btn-default">Submit</button>
							</form>
						</div>
					</div>
				</nav>
			</div>
</body>
</html>
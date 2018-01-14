<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 这是引导用户跳转到真正的商品首页的页面,可以显示9个最新商品和热门商品  在jsp中可以使用下列方式编写java代码  -->
<%
	//重定向到ProductServlet的toIndex方法
	response.sendRedirect(request.getContextPath()+"/ProductServlet?m=toIndex");
%>
</body>
</html>
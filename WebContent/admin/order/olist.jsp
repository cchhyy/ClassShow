<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
	<head>
		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
			}
			
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
		</style>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.validate.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/messages_zh.js" type="text/javascript"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
	</head>
	<body>
		<c:if test="${pb!=null&&pb.totalPage!=0}">
			<div class="container">
				<div class="row">
					<div style="margin:0 auto; margin-top:10px;width:950px;">
						<strong>所有客户的订单</strong>
						<table class="table table-bordered">
							<c:forEach items="${pb.data}" var="orders">
								<tbody>
									<tr class="success">
										<th colspan="2">订单编号:${orders.oid }</th>
										<th colspan="3" align="right">
											<c:if test="${orders.state==0}">
												客户未付款
											</c:if>
											<c:if test="${orders.state==1}">
												<a href="${pageContext.request.contextPath}/admin/AdminServlet?m=faHuo&oid=${orders.oid }">神速发货</a>
											</c:if>
											<c:if test="${orders.state==2}">
												等待买家收货
											</c:if>
											<c:if test="${orders.state==3}">
												已完成
											</c:if>
										</th>
									</tr>
									<tr class="warning">
										<th>图片</th>
										<th>名称</th>
										<th>价格</th>
										<th>数量</th>
										<th>小计</th>
									</tr>
									<c:forEach items="${orders.items }" var="oi">
										<tr class="active">
											<td width="60" width="40%">
												<img src="${pageContext.request.contextPath}/${oi.p.pimage}" width="70" height="60">
											</td>
											<td width="30%">
												${oi.p.pname}
											</td>
											<td width="20%">
												￥${oi.p.shop_price}
											</td>
											<td width="10%">
												${oi.count}
											</td>
											<td width="15%">
												<span class="subtotal">￥${oi.subtotal}</span>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
				<div style="text-align: center;">
					<ul class="pagination">
						<c:if test="${pb.pageNumber!=1 }">
							<li>
								<a href="${pageContext.request.contextPath}/OrderServlet?m=findOrdersByUid&pageNumber=${pb.pageNumber-1}" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						<c:forEach begin="1" end="${pb.totalPage}" var="i">
							<li  <c:if test="${pb.pageNumber==i }">class="active"</c:if>  ><a href="${pageContext.request.contextPath}/OrderServlet?m=findOrdersByUid&pageNumber=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${ pb.pageNumber!=pb.totalPage}">
							<li>
								<a href="${pageContext.request.contextPath}/OrderServlet?m=findOrdersByUid&pageNumber=${pb.pageNumber+1}" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</c:if>
		<c:if test="${pb==null||pb.totalPage==0}">
			<center><font style="color: green;font-size: 35px">商城没开张......一单都没卖...</font> </center>
		</c:if>
	</body>

</html>
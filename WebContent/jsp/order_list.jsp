<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>
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
		<script type="text/javascript">
			//用户点击确认收货的提示按钮
			function queren(oid){
				var f = confirm("亲,请务必确认已经收到货物了,才点击该按钮,否则将钱财两空!!!");
				if(f){
					location.href="${pageContext.request.contextPath}/OrderServlet?m=shouhuoByOid&oid="+oid;
				}
			}
			//用户点击删除订单按钮的时候需要执行的函数
			function del(oid){
				var f = confirm("亲,难道真的忍心离我而去吗?");
				if(f){
					location.href="${pageContext.request.contextPath}/OrderServlet?m=delOrdersByOid&oid="+oid;
				}
			}
		</script>
		
		
	</head>

	<body>
		<c:if test="${pb.totalPage!=0}">
			<div class="container">
				<div class="row">
					<div style="margin:0 auto; margin-top:10px;width:950px;">
						<strong>我的订单</strong>
						<table class="table table-bordered">
							<c:forEach items="${pb.data}" var="orders">
								<tbody>
									<tr class="success">
										<th colspan="4">订单编号:${orders.oid }</th>
										<th align="right">
											<c:if test="${orders.state==0}">
												<a href="${pageContext.request.contextPath}/OrderServlet?m=findOrdersByOid&oid=${orders.oid }">去付款</a>
												&nbsp;|&nbsp;
												<a href="javascript:del('${orders.oid }')">不想要了</a>
											</c:if>
											<c:if test="${orders.state==1}">
												等待卖家发货
											</c:if>
											<c:if test="${orders.state==2}">
												<a href="javascript:queren('${orders.oid }')">确认收货</a>
											</c:if>
											<c:if test="${orders.state==3}">
												已完成
												&nbsp;|&nbsp;
												<a href="javascript:del('${orders.oid }')">不想要了</a>
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
		<c:if test="${pb.totalPage==0}">
			<center><font style="color: green;font-size: 35px">亲,您还没有下订单喲...</font> </center>
		</c:if>
		<div style="margin-top:50px;">
			<img src="${pageContext.request.contextPath}/image/footer.jpg" width="100%" height="78" alt="我们的优势" title="我们的优势" />
		</div>

		<div style="text-align: center;margin-top: 5px;">
			<ul class="list-inline">
				<li><a>关于我们</a></li>
				<li><a>联系我们</a></li>
				<li><a>招贤纳士</a></li>
				<li><a>法律声明</a></li>
				<li><a>友情链接</a></li>
				<li><a target="_blank">支付方式</a></li>
				<li><a target="_blank">配送方式</a></li>
				<li><a>服务声明</a></li>
				<li><a>广告声明</a></li>
			</ul>
		</div>
		<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
			Copyright &copy; 2005-2016 传智商城 版权所有
		</div>
	</body>

</html>
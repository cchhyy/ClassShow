<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ include file="header.jsp" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>会员登录</title>
		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
			}
			
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
			
			.container .row div {
				/* position:relative;
	 float:left; */
			}
			
			font {
				color: #3164af;
				font-size: 18px;
				font-weight: normal;
				padding: 0 10px;
			}
		</style>
		<script type="text/javascript">
			//定义一个用于从购物车中移除商品的方法
			function del(pid){
				//询问用户确定要删除吗?
				var f = confirm("亲,难道真的不要我了吗?");
				//根据用户选择的结果,操作session中的cart对象
				if(f){
					//说明用户确定删除
					location.href="${pageContext.request.contextPath}/CartServlet?m=delProductFromCatByPid&pid="+pid;
				}
			}
			//定义一个清空购物车的方法
			function clear(){
				//询问用户确定要删除吗?
				var f = confirm("亲,难道真的不剁手了吗?");
				//根据用户选择的结果,操作session中的cart对象
				if(f){
					//说明用户确定删除
					location.href="${pageContext.request.contextPath}/CartServlet?m=clearCart";
				}
			}
		</script>
		
		
		
	</head>

	<body>
		<div class="container">
			<div class="row">
				<c:if test="${cart!=null}">
					<div style="margin:0 auto; margin-top:10px;width:950px;">
						<strong style="font-size:16px;margin:5px 0;">购物车详情</strong>
						<table class="table table-bordered">
							<tbody>
								<tr class="warning">
									<th>图片</th>
									<th>商品</th>
									<th>价格</th>
									<th>数量</th>
									<th>小计</th>
									<th>操作</th>
								</tr>
								<c:forEach items="${cart.values }" var="ci">
									<tr class="active">
										<td width="60" width="40%">
											<img src="${pageContext.request.contextPath}/${ci.product.pimage}" width="70" height="60">
										</td>
										<td width="30%">
											<a target="_blank">${ci.product.pname}</a>
										</td>
										<td width="20%">
											￥${ci.product.shop_price}
										</td>
										<td width="10%">
											${ci.count }
										</td>
										<td width="15%">
											<span class="subtotal">￥${ci.subTotal }</span>
										</td>
										<td>
											<a href="javascript:del('${ci.product.pid}');" class="delete">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
			</div>

			<div style="margin-right:130px;">
				<div style="text-align:right;">
					<em style="color:#ff6600;">
				登录后确认是否享有优惠&nbsp;&nbsp;
			</em> 赠送积分: <em style="color:#ff6600;">${cart.totalMoney*2}</em>&nbsp; 商品金额: <strong style="color:#ff6600;">￥${cart.totalMoney}元</strong>
				</div>
				<div style="text-align:right;margin-top:10px;margin-bottom:10px;">
					<a href="javascript:clear()" id="clear" class="clear">清空购物车</a>
					<a href="${pageContext.request.contextPath}/OrderServlet?m=addOrder">
						<input type="submit" width="100" value="提交订单" name="submit" border="0" style="background: url('${pageContext.request.contextPath}/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
						height:35px;width:100px;color:white;">
					</a>
				</div>
			</div>
		</div>
		</c:if>
		<c:if test="${cart==null }">
		<center>
			<font style="font-size: 35px;color: green;text-align: center">亲,您的购物车空空如也~~!  先去<a href="${pageContext.request.contextPath}/default.jsp">购物</a>吧!!!</font>
		</center>	
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
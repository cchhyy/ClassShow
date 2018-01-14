<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 引入header.jsp页面 -->
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
		
			var url="${pageContext.request.contextPath}/TestServlet";
			var data={m:"test",id:12};
			$.post(url,data,function(d){
				alert(d);
			},"html");
			//添加商品到购物车中的方法
			function addP(){
				alert(1);
				//1:准备发送ajax请求时需要的参数
				var url="${pageContext.request.contextPath}/CartServlet";
				//2:准备参数
				var pi=$("#myPid").val();
				var num = $("#quantity").val();
				var data={m:"addProductToCart",pid:pi,count:num};
				//3:发送ajax请求
				$.post(url,data,function(d){
					//4:提示反馈的结果
					alert(d);
				},"html");
			}
		</script>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div style="margin:0 auto;width:950px;">
					<div class="col-md-6">
						<img style="opacity: 1;width:400px;height:350px;" title="" class="medium" src="${pageContext.request.contextPath}/${p.pimage}">
					</div>

					<div class="col-md-6">
						<div><strong>${p.pname }</strong></div>
						<div style="border-bottom: 1px dotted #dddddd;width:350px;margin:10px 0 10px 0;">
							<div>编号：${p.pid }</div>
						</div>

						<div style="margin:10px 0 10px 0;">商城价: <strong style="color:#ef0101;">￥：${p.shop_price }元/份</strong> 参 考 价： <del>￥${p.market_price }元/份</del>
						</div>

						<div style="margin:10px 0 10px 0;">促销: <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)" style="background-color: #f07373;">限时抢购</a> </div>

						<div style="padding:10px;border:1px solid #e7dbb1;width:330px;margin:15px 0 10px 0;;background-color: #fffee6;">
							<div style="margin:5px 0 10px 0;">白色</div>
							<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">购买数量:
								<input id="quantity" name="quantity" value="1" maxlength="4" size="10" type="text"> </div>
								<input type="hidden" name="pid" value="${p.pid }" id="myPid">
							<div style="margin:20px 0 10px 0;;text-align: center;">
								<a href="javascript:addP()">
									<input style="background: url('${pageContext.request.contextPath}/images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;" value="加入购物车" type="button">
								</a> &nbsp;收藏商品</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<div style="width:950px;margin:0 auto;">
					<div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
						<strong>商品介绍</strong>
					</div>

					<div>
						<img src="${pageContext.request.contextPath}/${p.pimage}">
					</div>

					<div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
						<strong>商品参数</strong>
					</div>
					<div style="margin-top:10px;width:900px;">
						<table class="table table-bordered">
							<tbody>
								<tr class="active">
									<th colspan="2">基本参数</th>
								</tr>
								<tr>
									<th width="10%">级别</th>
									<td width="30%">标准</td>
								</tr>
								<tr>
									<th width="10%">标重</th>
									<td>500</td>
								</tr>
								<tr>
									<th width="10%">浮动</th>
									<td>200</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div style="background-color:#d3d3d3;width:900px;">
						<table class="table table-bordered">
							<tbody>
								<tr class="active">
									<th><strong>商品描述</strong></th>
								</tr>
								<tr>
									<td>
										${p.pdesc }
									</td>
								</tr>
								<tr class="warning">
									<th>暂无商品评论信息 <a>[发表商品评论]</a></th>
								</tr>
							</tbody>
						</table>
					</div>

					<div style="background-color:#d3d3d3;width:900px;">
						<table class="table table-bordered">
							<tbody>
								<tr class="active">
									<th><strong>商品咨询</strong></th>
								</tr>
								<tr class="warning">
									<th>暂无商品咨询信息 <a>[发表商品咨询]</a></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>

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
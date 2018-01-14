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
	</head>

	<body>
		<div class="container">
			<div class="row">

				<div style="margin:0 auto;margin-top:10px;width:950px;">
					<strong>订单详情</strong>
					<table class="table table-bordered">
						<tbody>
							<tr class="warning">
								<th colspan="5">订单编号:${o.oid}</th>
							</tr>
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
							</tr>
							<c:forEach items="${o.items}" var="oi">
								<tr class="active">
									<td width="60" width="40%">
										<img src="${pageContext.request.contextPath}/${oi.p.pimage}" width="70" height="60">
									</td>
									<td width="30%">
										<a target="_blank">${oi.p.pname}</a>
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
					</table>
				</div>

				<div style="text-align:right;margin-right:120px;">
					商品金额: <strong style="color:#ff6600;">￥${o.total }元</strong>
				</div>

			</div>

			<div>
				<hr/>
				<form class="form-horizontal" style="margin-top:5px;margin-left:150px;" id="orderForm" action="${pageContext.request.contextPath}/OrderServlet">
					<div class="form-group">
						<label for="username" class="col-sm-1 control-label">地址</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="username"  value="${o.address}" name="address">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-1 control-label">收货人</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="inputPassword3"  value="${o.name }" name="name">
						</div>
					</div>
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-1 control-label">电话</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="confirmpwd"  value="${o.telephone }" name="telephone">
						</div>
					</div>
					<!-- 添加两个隐藏字段,用于提交订单的编号和要执行的方法 -->
					<input type="hidden" name="m" value="confirmOrder">
					<input type="hidden" name="oid" value="${o.oid}">
				<hr/>

					<div style="margin-top:5px;margin-left:150px;">
						<strong>选择银行：</strong>
						<p>
							<br/>
							<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />工商银行
							<img src="${pageContext.request.contextPath}/bank_img/icbc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行
							<img src="${pageContext.request.contextPath}/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行
							<img src="${pageContext.request.contextPath}/bank_img/abc.bmp" align="middle" />
							<br/>
							<br/>
							<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行
							<img src="${pageContext.request.contextPath}/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
							<img src="${pageContext.request.contextPath}/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行
							<img src="${pageContext.request.contextPath}/bank_img/ccb.bmp" align="middle" />
							<br/>
							<br/>
							<input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行
							<img src="${pageContext.request.contextPath}/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
							<img src="${pageContext.request.contextPath}/bank_img/cmb.bmp" align="middle" />
	
						</p>
						<hr/>
						<p style="text-align:right;margin-right:100px;">
							<a href="javascript:document.getElementById('orderForm').submit();">
								<img src="${pageContext.request.contextPath}/images/finalbutton.gif" width="204" height="51" border="0" />
							</a>
						</p>
						<hr/>
					</div>
				</form>
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
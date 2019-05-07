<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>会员登录</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<script language="javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />

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
		 <style type="text/css">
        body { font-size: 12px; line-height: 120%; text-align: center; color:#333; padding: 20px;}
        a { color: #333; text-decoration: none;}
        a:hover { text-decoration: underline;}
        * { margin: 0; padding: 0; border: none;}
        .clearfix:after { content:"."; display:block; height:0; clear:both; visibility:hidden}
        .clearfix { *height:1%;}
        #list { margin: 0 auto; text-align: left; width: 540px;}
        .box { border-top: 1px solid #eee; position: relative;  width: 540px; padding: 20px 0}
        .box:hover .close { display: block;}
        .close { display: none; top:0px; right: 0px; width: 28px; height: 28px; border: 1px solid #eee; position: absolute; background: #f2f4f7; line-height: 27px; text-align: center;}
        .close:hover { background: #c8d2e2; text-decoration: none;}
        .head { float: left; width: 60px; height: 60px; margin-right: 10px;}
        .content { float: left; width: 440px;}
        .main { margin-bottom: 10px;}
        .txt { margin-bottom: 10px;}
        .user { color: #369; }
        .pic { margin-right: 5px; width: 200px; border: 1px solid #eee;}
        .info { height: 20px; line-height: 19px; font-size: 12px; margin: 0 0 10px 0;}
        .info .time { color: #ccc; float: left; height: 20px; padding-left: 20px; background: url("images/bg1.jpg") no-repeat left top;}
        .info .praise { color: #369; float: right; height: 20px; padding-left: 18px; background: url("images/bg2.jpg") no-repeat left top;}
        .info .praise:hover { text-decoration: underline; background: url("images/bg3.jpg") no-repeat left top;}
        .praises-total { margin: 0 0 10px 0; height: 20px; background: url("images/praise.png") no-repeat 5px 5px rgb(247, 247, 247); padding: 5px 0 5px 25px; line-height: 19px;}
        .comment-box { padding: 10px 0; border-top: 1px solid #eee;}
        .comment-box:hover { background: rgb(247, 247, 247);}
        .comment-box .myhead { float: left; width: 30px; height: 30px; margin-right: 10px;}
        .comment-box .comment-content { float: left; width: 400px; }
        .comment-box .comment-content .comment-time { color: #ccc; margin-top: 3px; line-height: 16px; position: relative;}
        .comment-box .comment-content .comment-praise { display: none; color: #369; padding-left: 17px; height: 20px; background: url("images/praise.png") no-repeat;  position: absolute; bottom: 0px; right: 44px;}
        .comment-box .comment-content .comment-operate { display: none; color: #369; height: 20px;  position: absolute; bottom: 0px; right: 10px;}
        .comment-box .comment-content:hover .comment-praise { display: inline-block;}
        .comment-box .comment-content:hover .comment-operate { display: inline-block;}
        .text-box .comment { border: 1px solid #eee; display: block; height: 15px; width: 428px; padding: 5px; resize: none; color: #ccc}
        .text-box .btn { font-size: 12px; font-weight: bold; display: none; float: right; width: 65px; height: 25px; border: 1px solid #0C528D; color: #fff; background: #4679AC;}
        .text-box .btn-off { border: 1px solid #ccc; color: #ccc; background: #F7F7F7;}
        .text-box .word{ display: none; float: right; margin: 7px 10px 0 0; color: #666;}
        .text-box-on .comment{ height: 50px; color: #333;}
        .text-box-on .btn{ display: inline;}
        .text-box-on .word{ display: inline;}
    </style>
    <script type="text/javascript" src="js/demo.js"></script>
	</head>

	<body>

		<%@include file="/jsp/head.jsp" %>
		<div class="container">
			<div class="row">
				
				<div style="margin:0 auto;width:950px;">
					<div class="col-md-6">
						<img style="opacity: 1;width:400px;height:350px;" title="" class="medium" src="${pageContext.request.contextPath}/${bean.pimage}">
					</div>

					<div class="col-md-6">
						<div><strong>${bean.pname }</strong></div>
						<div style="border-bottom: 1px dotted #dddddd;width:350px;margin:10px 0 10px 0;">
							<div>编号：${bean.pid }</div>
						</div>

						<div style="margin:10px 0 10px 0;">网站价: <strong style="color:#ef0101;">￥：${bean.shop_price }元</strong> 影院价： <del>￥${bean.market_price }元</del>
						</div>

						<div style="margin:10px 0 10px 0;">促销: <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)" style="background-color: #f07373;">限时抢购</a> </div>

						<div style="padding:10px;border:1px solid #e7dbb1;width:330px;margin:15px 0 10px 0;;background-color: #fffee6;">
							<div style="margin:5px 0 10px 0;"></div>
							<form action="${pageContext.request.contextPath }/cart" id="form1" method="get">
								<!-- 提交的方法  -->
								<input type="hidden" name="method" value="add2cart">
								
								<!-- 商品的pid -->
								<input type="hidden" name="pid" value="${bean.pid }">
								
								<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">购买数量:
									<input id="quantity" name="count" value="1" maxlength="4" size="10" type="text"> </div>
	
								<div style="margin:20px 0 10px 0;;text-align: center;">
							</form>
								<a href="javascript:void(0)" onclick="subForm()">
									<input style="background: url('${pageContext.request.contextPath}/images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;" value="加入购物车" type="button">
								</a> &nbsp;
								<input name="pclog" type="button" value="选座" data-toggle="modal" data-target="#myModal">
								</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<div style="width:950px;margin:0 auto;">
					<div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
						<strong>电影介绍</strong>
					</div>

					<div>
						<img src="${pageContext.request.contextPath}/${bean.pimage}">
					</div>

					<div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
						<strong>${bean.pdesc }</strong>
					</div>
					
					<div style="background-color:#d3d3d3;width:900px;">
						<table class="table table-bordered">
							<tbody>
								<tr class="active">
									<th><strong>电影评论</strong></th>
								</tr>
								
							</tbody>
						</table>
					</div>
			</div>
		</div>
		<div id="list">
		        <div class="box clearfix">
		            <a class="close" href="javascript:;">×</a>
		            <img class="head" src="${pageContext.request.contextPath}/${bean.pimage}" alt=""/>
		            <div class="content">
		                <div class="main">
		                    <p class="txt">
		                        <span class="user">${bean.pname }：</span>${bean.pdesc }
		                    </p>
		                    <img class="pic" src="${pageContext.request.contextPath}/${bean.pimage}" alt=""/>
		                </div>
		                <div class="info clearfix">
		                    <span class="time"></span>
		                    <a class="praise" href="javascript:;"></a>
		                </div>
		               
		                <div class="comment-list">
		                    <div class="comment-box clearfix" user="self">
		                        <img class="myhead" src="images/my.jpg" alt=""/>
		                        <div class="comment-content">
		                            
		                            
		                        </div>
		                    </div>
		                </div>
		                <div class="text-box">
		                    <textarea class="comment" autocomplete="off">评论…</textarea>
		                    <button class="btn ">回 复</button>
		                    <span class="word"><span class="length">0</span>/140</span>
		                </div>
		            </div>
		        </div>
    </div>
		

		<div style="margin-top:50px;">
			<img src="${pageContext.request.contextPath}/image/1.png" width="100%" height="78" alt="我们的优势" title="我们的优势" />
		</div>

		<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">选座</h4>
      </div>
      <div class="modal-body">
        <%@include file="/jsp/seat.jsp" %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="setAmount()" data-dismiss="modal">确认</button>
      </div>
    </div>
  </div>
</div>

		<div style="text-align: center;margin-top: 5px;">
			<ul class="list-inline">
				<li><a>关于我们</a></li>
				<li><a>联系我们</a></li>
				<li><a>招贤纳士</a></li>
				<li><a>法律声明</a></li>
				<li><a>友情链接</a></li>
				<li><a target="_blank">支付方式</a></li>
				<li><a target="_blank">取票方式</a></li>
				<li><a>服务声明</a></li>
				<li><a>广告声明</a></li>
			</ul>
		</div>
		<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
			Copyright &copy; 2018-2019 孙某人 版权所有
		</div>
	
	</body>
	<script type="text/javascript">
		function subForm(){
			//让指定的表单提交
			document.getElementById("form1").submit();
		}
		function setAmount(){
			$("#quantity").val(getAmount());
		}
	</script>
</html>
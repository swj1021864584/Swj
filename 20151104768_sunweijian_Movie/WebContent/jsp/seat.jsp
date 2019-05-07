<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>选座功能</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/jquery.seat-charts.css">
</head>
<body style="font-family: 'Lato', sans-serif;">
<div style="width:100%;text-align:center;">
  <div style="margin:0 auto;width:500px;text-align:left;">
    <div id="seat-map">
      <div style="width:145px;margin: 5px 32px 15px 32px;background-color: #f6f6f6;color: #adadad;text-align: center;padding: 3px;border-radius: 5px;">屏幕</div>
    </div>
    <div style="float:left;text-align: left;margin-left: 35px;font-size: 12px;position: relative;height: 401px;">
      <h3 style="margin:5px 5px 0 0;font-size: 14px;">已选中的座位 (<span id="counter">0</span>):</h3>
      <ul id="selected-seats">
      </ul>
      <p>总价: <b>$<span id="total">0</span></b></p>    
      <div id="legend"></div>
    </div>
  </div>
</div>
<script src="js/jquery-1.11.0.min.js"></script> 
<script src="js/jquery.seat-charts.min.js"></script> 
<script>
			var firstSeatLabel = 1;
		
			$(document).ready(function() {
				var $cart = $('#selected-seats'),
					$counter = $('#counter'),
					$total = $('#total'),
					sc = $('#seat-map').seatCharts({
					map: [
						'ff_fff',
						'ff_fff',
						'eee_eee',
						'eee_eee',
						'eee___e',
						'eee_eee',
						'eee_eee',
						'eee_eee',
						'eee_eee',
						'eeeeee',
					],
					seats: {
						f: {
							price   : 100,
							classes : 'first-class', //your custom CSS class
							category: 'vip座位'
						},
						e: {
							price   : 40,
							classes : 'economy-class', //your custom CSS class
							category: '普通座位'
						}					
					
					},
					naming : {
						top : false,
						getLabel : function (character, row, column) {
							return firstSeatLabel++;
						},
					},
					legend : {
						node : $('#legend'),
					    items : [
							
							[ 'e', 'available',   '普通座位'],
							[ 'f', 'unavailable', '已预定']
					    ]					
					},
					click: function () {
						if (this.status() == 'available') {
							$('<li>'+this.data().category+this.settings.label+'号座位'+'：<br/>价格：<b>$'+ "${bean.shop_price }" +'</b> <a href="#" class="cancel-cart-item">[删除]</a></li>')
								.attr('id','cart-item-'+this.settings.id)
								.data('seatId', this.settings.id)
								.appendTo($cart);
							$counter.text(sc.find('selected').length+1);
							$total.text(recalculateTotal(sc)+this.data().price);
							
							return 'selected';
						} else if (this.status() == 'selected') {
							//update the counter
							$counter.text(sc.find('selected').length-1);
							//and total
							$total.text(recalculateTotal(sc)-this.data().price);
						
							//remove the item from our cart
							$('#cart-item-'+this.settings.id).remove();
						
							//seat has been vacated
							return 'available';
						} else if (this.status() == 'unavailable') {
							//seat has been already booked
							return 'unavailable';
						} else {
							return this.style();
						}
					}
				});

				//this will handle "[cancel]" link clicks
				$('#selected-seats').on('click', '.cancel-cart-item', function () {
					//let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
					sc.get($(this).parents('li:first').data('seatId')).click();
				});

				//let's pretend some seats have already been booked
				sc.get(['1_2', '4_1', '7_1', '7_2']).status('unavailable');
		
		});

		function recalculateTotal(sc) {
			var total = 0;
		
			//basically find every selected seat and sum its price
			sc.find('selected').each(function () {
				total += this.data().price;
			});
			
			return total;
		}
		
		function getAmount(sc) {
			return $("#counter").text();
		}
		
		</script>
<div align="center" style="clear:both;font-size:12px;color:#666;font:normal 14px/24px 'MicroSoft YaHei';">


</div>
</body>
</html>

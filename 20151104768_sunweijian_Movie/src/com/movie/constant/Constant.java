package com.movie.constant;

public interface Constant {
	/**
	 * 
	 * 用户未激活
	 */
	int USER_IS_NOT_ACTIVE = 0;
	
	/**
	 * 
	 * 用户已激活
	 */
	int USE_IS_ACTIVE = 1;
	/**
	 * 记住用户名
	 */
	String SAVE_NAME = "ok";
	/**
	 * 商品热门
	 */
	int PRODUCT_IS_HOT = 1;
	/**
	 * 商品未下架
	 */
	int PRODUCT_IS_UP = 0;
	/**
	 * 商品下架
	 */
	int PRODUCT_IS_DOWN = 1;
	
	/**
	 * 订单状态未付款
	 */
	int ORDER_WEIFUKUAN=0;

	/**
	 * 订单状态已付款
	 */
	int ORDER_YIFUKUAN=1;

	/**
	 * 订单状态已发货
	 */
	int ORDER_YIFAHUO=2;

	/**
	 * 订单状态已完成
	 */
	int ORDER_YIWANCHENG=3;
}

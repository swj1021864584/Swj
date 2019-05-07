package com.movie.domain;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Map<String, CartItem> itemMap = new HashMap<String, CartItem>();
	private Double total = 0.0;
	
	/**
	 * 获取所有的购物项
	 * @return
	 */
	public  Collection<CartItem> getCartItems(){
		return itemMap.values();
	}
	public Map<String, CartItem> getItemMap() {
		return itemMap;
	}
	public void setItemMap(Map<String, CartItem> itemMap) {
		this.itemMap = itemMap;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	/**
	 * 加入购物车
	 * @param item
	 */
	public void add2cart(CartItem item) {
		//获取商品id
		String pid = item.getProduct().getPid();
		
		//判断购物车 中是否有
		if (itemMap.containsKey(pid)) {
			//有  修改数量  原来+ 新加
			//原有购物项
		CartItem oItem	= itemMap.get(pid);
		oItem.setCount(oItem.getCount()+item.getCount());
		} else {
			//无
			
			itemMap.put(pid, item);
		}
		//修改总金额
		
		total += item.getSubtotal();
	}
	/**
	 * 从购物车移除
	 * @param item
	 */
	public void removeFromCart(String pid) {
		//从map中移除购物项
		CartItem item = itemMap.remove(pid);
		
		//修改总金额
		total -= item.getSubtotal();
	}
	/**
	 * 清空购物车
	 * @param item
	 */
	public void ClearCart() {
		//清空map
		itemMap.clear();
		//修改总金额为0 
		total = 0.0; 
	}
}

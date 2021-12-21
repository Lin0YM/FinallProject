package com.infotran.springboot.model.goodsbean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

public class ShoppingCartGoodsBean {
	
	private Date orderDate;
	
	private Map<Long, OrderItemGoodsBean> shopCar = new LinkedHashMap<Long, OrderItemGoodsBean>();

	public ShoppingCartGoodsBean() {
		orderDate=new Date();
	}

	public String getOrderDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(orderDate);
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Map<Long, OrderItemGoodsBean> getShopCar() {
		return shopCar;
	}
	
	public void addOrderCar(Long goodsID,OrderItemGoodsBean orderitembean) {
		if (orderitembean.getAllCount() <= 0 ) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( shopCar.get(goodsID) == null ) {
			shopCar.put(goodsID, orderitembean);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			OrderItemGoodsBean oiBean = shopCar.get(goodsID);
			// 加購的數量：bean.getQuantity()
			// 原有的數量：oBean.getQuantity()			
			oiBean.setAllCount(orderitembean.getAllCount() + oiBean.getAllCount());
		}
	}
	
	//修改購物車商品數量********
	public boolean modifyQty(Long goodsID, int newQty) {
		if ( shopCar.get(goodsID) != null ) {
		   OrderItemGoodsBean  bean = shopCar.get(goodsID);
		   bean.setAllCount(newQty);
	       return true;
		} else {
		   return false;
		}
	}
	
	
	// 刪除購物車某項商品
		public int deleteBook(Long bookId) {
			if ( shopCar.get(bookId) != null ) {
				shopCar.remove(bookId);  // Map介面的remove()方法
		       return 1;
			} else {
			   return 0;
			}
		}
	
		//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)********
		public double getSubtotal(){
			double subTotal = 0 ;
			Set<Long> set = shopCar.keySet();
			for(long n : set){
				OrderItemGoodsBean oib = shopCar.get(n);
				double price    = oib.getBean().getGoodsPrice();
				int qty      = oib.getAllCount();
				subTotal +=  price * qty;
			}
			return subTotal;
		}
		
	
}
	
	


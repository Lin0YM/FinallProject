package com.infotran.springboot.service;

import java.util.List;

import com.infotran.springboot.model.singlebuy.SingleBuyOrderItem;

public interface SingleBuyOrderItemService {
	
	public SingleBuyOrderItem save(SingleBuyOrderItem singleBuyOrderItem);
	
	public List<SingleBuyOrderItem> findByOrderId(Integer orderId);

	public List<Object[]> findItemTotalPrice();
}

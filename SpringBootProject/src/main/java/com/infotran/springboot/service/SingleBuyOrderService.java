package com.infotran.springboot.service;

import java.util.List;

import com.infotran.springboot.model.singlebuy.SingleBuyOrder;

public interface SingleBuyOrderService {
	
	public SingleBuyOrder save(SingleBuyOrder singleBuyOrder);
	
	public List<SingleBuyOrder> getAllSingleBuyOrders();
	
	public List<SingleBuyOrder> findByUserid(Integer userid);
	
	public SingleBuyOrder findByOrderid(Integer orderid);
	
	public List<Object[]> findTotalIncome();

}

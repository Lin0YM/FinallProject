package com.infotran.springboot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.infotran.springboot.dao.SingleBuyOrderItemRepository;
import com.infotran.springboot.model.singlebuy.SingleBuyOrderItem;
import com.infotran.springboot.service.SingleBuyOrderItemService;

@Repository
@Transactional
public class SingleBuyOrderItemServiceImpl implements SingleBuyOrderItemService {
	
	SingleBuyOrderItemRepository singleBuyOrderItemRepository;
	
	@Autowired
	SingleBuyOrderItemServiceImpl(SingleBuyOrderItemRepository singleBuyOrderItemRepository) {
		this.singleBuyOrderItemRepository = singleBuyOrderItemRepository;
	}

	@Override
	public SingleBuyOrderItem save(SingleBuyOrderItem singleBuyOrderItem) {
		return singleBuyOrderItemRepository.save(singleBuyOrderItem);
	}

	@Override
	public List<SingleBuyOrderItem> findByOrderId(Integer orderId) {
		return singleBuyOrderItemRepository.findByOrderid(orderId);
	}

	@Override
	public List<Object[]> findItemTotalPrice() {
		return singleBuyOrderItemRepository.findItemTotalPrice();
	}

}

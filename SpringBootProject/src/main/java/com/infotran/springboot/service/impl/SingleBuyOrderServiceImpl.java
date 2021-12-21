package com.infotran.springboot.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.infotran.springboot.dao.SingleBuyOrderRepository;
import com.infotran.springboot.model.singlebuy.SingleBuyOrder;
import com.infotran.springboot.service.SingleBuyOrderService;

@Repository
@Transactional
public class SingleBuyOrderServiceImpl implements SingleBuyOrderService {
	
	SingleBuyOrderRepository singleBuyOrderRepository;
	
	@Autowired
	SingleBuyOrderServiceImpl(SingleBuyOrderRepository singleBuyOrderRepository) {
		this.singleBuyOrderRepository = singleBuyOrderRepository;
	}

	@Override
	public SingleBuyOrder save(SingleBuyOrder singleBuyOrder) {
		return singleBuyOrderRepository.save(singleBuyOrder);
	}

	@Override
	public List<SingleBuyOrder> getAllSingleBuyOrders() {
		return singleBuyOrderRepository.findAll();
	}

	@Override
	public List<SingleBuyOrder> findByUserid(Integer userid) {
		return singleBuyOrderRepository.findByUserid(userid);
	}

	@Override
	public SingleBuyOrder findByOrderid(Integer orderid) {
		Optional<SingleBuyOrder> op = singleBuyOrderRepository.findById(orderid);
		SingleBuyOrder bean = op.get();
		return bean;
	}

	@Override
	public List<Object[]> findTotalIncome() {
		return singleBuyOrderRepository.findTotalIncome();
	}

}

package com.infotran.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.infotran.springboot.model.goodsbean.GoodsBean;
import com.infotran.springboot.model.goodsbean.OrderItemGoodsBean;

public interface OrderItemGoodsBeanRepository extends JpaRepository<OrderItemGoodsBean, Integer> {
	
	
}

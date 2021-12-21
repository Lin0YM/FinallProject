package com.infotran.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.infotran.springboot.model.goodsbean.OrderGoodsBean;

public interface OrderGoodsBeanRepository extends JpaRepository<OrderGoodsBean, Integer> {

}

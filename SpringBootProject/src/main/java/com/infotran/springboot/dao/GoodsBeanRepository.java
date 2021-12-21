package com.infotran.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.infotran.springboot.model.goodsbean.GoodsBean;

public interface GoodsBeanRepository extends JpaRepository<GoodsBean, Integer> {
	
	List<GoodsBean> findByUploadMember(String uploadmember);
	
	List<GoodsBean> findByGoodsType(String goodsType);
}

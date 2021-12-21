package com.infotran.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.infotran.springboot.model.goodsbean.MemberOrderListBean;
import com.infotran.springboot.model.goodsbean.OrderItemGoodsBean;

public interface MemberOrderListBeanRepository extends JpaRepository<MemberOrderListBean, Integer> {
	
	List<MemberOrderListBean> findByOrderitemusername(String orderitemusername);
	
	List<MemberOrderListBean> findByGoodsuploadusername(String goodsuploadusername);
	
	List<MemberOrderListBean> findByGoodsscope(String goodsscope);
}

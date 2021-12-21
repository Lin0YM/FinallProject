package com.infotran.springboot.dao.groupBuy;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.infotran.springboot.model.product.ShopItemBean;

public interface ShopItemBeanRepository extends JpaRepository<ShopItemBean, Integer> {

	List<ShopItemBean> findByShopname(String name);
	
	
}

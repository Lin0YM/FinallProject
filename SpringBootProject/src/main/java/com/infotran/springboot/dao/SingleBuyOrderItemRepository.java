package com.infotran.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infotran.springboot.model.singlebuy.SingleBuyOrderItem;

public interface SingleBuyOrderItemRepository extends JpaRepository<SingleBuyOrderItem, Integer> {

	public List<SingleBuyOrderItem> findByOrderid(Integer orderid);
	
	@Query(value = "SELECT sbi.classification, sum(sboi.itemprice*sboi.quantity) \"totalprice\"\r\n"
			+ "FROM singlebuyorderitem sboi\r\n"
			+ "LEFT JOIN singlebuyitem sbi\r\n"
			+ "ON sboi.itemid=sbi.itemid\r\n"
			+ "group by sbi.classification;\r\n", nativeQuery = true)
	public List<Object[]> findItemTotalPrice();
}

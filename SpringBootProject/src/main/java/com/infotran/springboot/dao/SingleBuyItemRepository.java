package com.infotran.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.infotran.springboot.model.singlebuy.SingleBuyItem;


public interface SingleBuyItemRepository extends JpaRepository<SingleBuyItem, Integer> {
	
	List<SingleBuyItem> findByClassification(String classification);
	
	@Query(value = "select * from singlebuyitem sbi where sbi.itemname like concat('%', :name, '%')",nativeQuery = true)
	List<SingleBuyItem> findBySearch(@Param("name") String search);
	
	
	@Query(value = "select itemid, itemname, itemprice from singlebuyitem",nativeQuery = true)
	public List<Object[]> getAllItemsForAjax();
	
}

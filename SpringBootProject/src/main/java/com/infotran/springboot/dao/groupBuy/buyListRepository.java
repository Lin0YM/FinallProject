package com.infotran.springboot.dao.groupBuy;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.infotran.springboot.model.groupbuy.buyList;

public interface buyListRepository extends JpaRepository<buyList, Integer> {

	void deleteByGroupId(Integer groupId);
	List<buyList> findByBuyerName(String name);
	buyList findByGroupIdAndBuyerNameAndItemId(int groupId,String buyerName,int itemId);
	List<buyList> findByGroupIdAndItemId(int groupId,int itemId);
	
	@Modifying
	@Query("update buyList set itemNumber=:itemNumber where groupId=:groupId "
			+ "and itemId=:itemId and buyerName=:buyerName")
	void updateBuyListBygroupIdAndItemIdAndBuyerName(
			@Param("itemNumber") Integer itemNumber,
			@Param("groupId") Integer groupId,
			@Param("itemId") Integer itemId,
			@Param("buyerName") String buyerName
			);
	
	
}

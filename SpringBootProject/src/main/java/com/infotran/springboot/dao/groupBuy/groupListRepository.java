package com.infotran.springboot.dao.groupBuy;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.infotran.springboot.model.groupbuy.groupList;

public interface groupListRepository extends JpaRepository<groupList, Integer> {
	
	groupList findByGroupId(Integer groupId);
	List<groupList> findByGroupShopName(String name);
	groupList findByPromoterAndGroupName(String Promoter,String GroupName); 
	List<groupList> findByPubliconootAndSoldStatus(String pon,String ss); 
	
	@Modifying
	@Query("update groupList set soldStatus='cancel' where groupId=:gId")
	void updateSoldStatusByGroupId(@Param("gId") Integer groupId);
	
}

package com.infotran.springboot.dao.groupBuy;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.infotran.springboot.model.groupbuy.buyDetail;

public interface buyDetailRepository extends JpaRepository<buyDetail, Integer> {

	void deleteByGroupId(Integer groupId);
	List<buyDetail> findByGroupId(Integer groupId);
	buyDetail findByGroupIdAndItemId(Integer groupId,Integer itemId);
	
	@Modifying
	@Query("update buyDetail set groupName=:gName where groupId=:gId")
	void updateGroupNameByGroupId(@Param("gName") String name,@Param("gId") Integer groupId);
	
	@Modifying
	@Query("update buyDetail set itemTotal=:itemTotal where groupId=:groupId and itemId=:itemId")
	void updateitemTotal(
			@Param("itemTotal") Integer itemTotal,
			@Param("groupId") Integer groupId,
			@Param("itemId") Integer itemId
			);
}

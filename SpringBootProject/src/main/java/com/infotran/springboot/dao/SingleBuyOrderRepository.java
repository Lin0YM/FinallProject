package com.infotran.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infotran.springboot.model.singlebuy.SingleBuyOrder;

public interface SingleBuyOrderRepository extends JpaRepository<SingleBuyOrder, Integer> {
	
	public List<SingleBuyOrder> findByUserid(Integer userid);
	
	@Query(value = "select month(orderTime) \"month\", sum(totalprice) \"totalincome\"\r\n"
			+ "from singlebuyorder\r\n"
			+ "where cancelstatus= '訂單完成'\r\n"
			+ "group by month(orderTime);", nativeQuery = true)
	public List<Object[]> findTotalIncome();

}

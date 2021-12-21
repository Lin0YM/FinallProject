package com.infotran.springboot.service;

import java.util.List;
import java.util.Optional;

import com.infotran.springboot.model.wishpool.WishPoolBean;


public interface WishPoolService {

	Optional<WishPoolBean> findById(Integer id);
	
	List<WishPoolBean> findBySort(String sort);
	
	WishPoolBean getById(Integer id);
	
	List<WishPoolBean> getWishPools();

	WishPoolBean save(WishPoolBean bean);
	
	WishPoolBean updateWishPool(WishPoolBean bean); 

	void deleteWishPoolByPrimaryKey(int key);
}

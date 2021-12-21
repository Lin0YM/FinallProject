package com.infotran.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.infotran.springboot.model.wishpool.WishPoolBean;



public interface WishPoolRepository extends 
					JpaRepository<WishPoolBean, Integer> {
	
	List<WishPoolBean> findBySort(String sort);
	
}

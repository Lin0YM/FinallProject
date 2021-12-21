package com.infotran.springboot.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.infotran.springboot.dao.WishPoolRepository;
import com.infotran.springboot.model.wishpool.WishPoolBean;
import com.infotran.springboot.service.WishPoolService;

@Repository
@Transactional
public class WishPoolServiceImpl implements WishPoolService {

	WishPoolRepository wishPoolRepository;
	
	@Autowired
	public WishPoolServiceImpl(WishPoolRepository wishPoolRepository) {
		this.wishPoolRepository = wishPoolRepository;
	}

	@Override
	public Optional<WishPoolBean> findById(Integer id) {
		return wishPoolRepository.findById(id);
	}
	
	@Override
	public List<WishPoolBean> findBySort(String sort) {
		return wishPoolRepository.findBySort(sort);
	}
	
	@Override
	public WishPoolBean getById(Integer id) {
		return wishPoolRepository.getById(id);
	}

	@Override
	public List<WishPoolBean> getWishPools() {
		return wishPoolRepository.findAll();
	}

	@Override
	public WishPoolBean save(WishPoolBean bean) {
		return wishPoolRepository.save(bean);
	}

	@Override
	public WishPoolBean updateWishPool(WishPoolBean bean) {
		return wishPoolRepository.save(bean);
	}

	@Override
	public void deleteWishPoolByPrimaryKey(int key) {
		wishPoolRepository.deleteById(key);
	}

}

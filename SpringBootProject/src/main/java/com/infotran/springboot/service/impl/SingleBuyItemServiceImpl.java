package com.infotran.springboot.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.infotran.springboot.dao.SingleBuyItemRepository;
import com.infotran.springboot.model.singlebuy.SingleBuyItem;
import com.infotran.springboot.service.SingleBuyItemService;

@Repository
@Transactional
public class SingleBuyItemServiceImpl implements SingleBuyItemService {
	
	SingleBuyItemRepository singleBuyItemRepository;

	@Autowired
	SingleBuyItemServiceImpl(SingleBuyItemRepository singleBuyItemRepository) {
		this.singleBuyItemRepository = singleBuyItemRepository;
	}

	@Override
	public List<SingleBuyItem> getAllItems() {
		return singleBuyItemRepository.findAll();
	}

	@Override
	public List<SingleBuyItem> getItemsByClassification(String classification) {
		return singleBuyItemRepository.findByClassification(classification);
	}

	@Override
	public SingleBuyItem getItemById(Integer itemId) {
		Optional<SingleBuyItem> op = singleBuyItemRepository.findById(itemId);
		SingleBuyItem bean = op.get();
		return bean;
	}

	@Override
	public void deleteItem(int itemId) {
		singleBuyItemRepository.deleteById(itemId);
	}

	@Override
	public List<SingleBuyItem> findBySearch(String search) {
		return singleBuyItemRepository.findBySearch(search);
	}

	@Override
	public Integer addItem(SingleBuyItem singleBuyItem) {
		SingleBuyItem save = singleBuyItemRepository.save(singleBuyItem);
		return save.getItemid();
	}

	@Override
	public List<Object[]> getAllItemsForAjax() {
		return singleBuyItemRepository.getAllItemsForAjax();
	}

}

package com.infotran.springboot.service;

import java.sql.Blob;
import java.util.List;

import com.infotran.springboot.model.singlebuy.SingleBuyItem;

public interface SingleBuyItemService {
	
	List<SingleBuyItem> getAllItems();
	
	List<SingleBuyItem> getItemsByClassification(String classification);
	
	SingleBuyItem getItemById(Integer itemId);
	
	void deleteItem(int itemId);
	
	List<SingleBuyItem> findBySearch(String search);
	
	Integer addItem(SingleBuyItem singleBuyItem);
	
	public List<Object[]> getAllItemsForAjax();
	
}

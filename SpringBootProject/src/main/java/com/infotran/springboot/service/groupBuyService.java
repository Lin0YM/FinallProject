package com.infotran.springboot.service;

import java.util.List;
import java.util.Optional;

import com.infotran.springboot.model.groupbuy.buyDetail;
import com.infotran.springboot.model.groupbuy.buyList;
import com.infotran.springboot.model.groupbuy.groupList;
import com.infotran.springboot.model.product.ShopItemBean;

public interface groupBuyService {

	List<ShopItemBean> findAllShopItemBeanService();

	List<buyDetail> findAllBuyDetailService();

	List<buyList> findAllBuyListService();

	List<groupList> findAllGroupListService();

	void deleteAdminService(Integer groupId);

	groupList updateAdminShowService(Integer groupId);

	Optional<groupList> findByIdgroupListService(Integer groupId);

	void updateAdminSaveService(groupList bean);

	List<groupList> findAllShopGroupListService(String name);

	List<groupList> findAllBuyListService(String name);

	List<buyDetail> findShopItemService(String name);

	List<buyDetail> groupListCreateService(groupList glBean);

	buyList buyerEditPromoterService(int itemId, int groupId);

	void updadteBuyList(buyList bean);

	List<buyDetail> findBuyDetailService(int groupId);

	List<groupList> findGroupListNomalService(String name);

	groupList findByGroupId(int id);

	List<buyDetail> findBuyDetailService(buyList bean);

	List<buyDetail> groupListAttService(groupList glBean,String buyer);

	buyList buyerEditAttService(int itemId, int groupId, String buyer);

	void updateCancelSaveService(Integer groupId);

//	UserDB findUserDBService(String emailaddress,String pw);

}
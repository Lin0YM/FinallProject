package com.infotran.springboot.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.infotran.springboot.dao.groupBuy.ShopItemBeanRepository;
import com.infotran.springboot.dao.groupBuy.buyDetailRepository;
import com.infotran.springboot.dao.groupBuy.buyListRepository;
import com.infotran.springboot.dao.groupBuy.groupListRepository;
import com.infotran.springboot.model.groupbuy.buyDetail;
import com.infotran.springboot.model.groupbuy.buyList;
import com.infotran.springboot.model.groupbuy.groupList;
import com.infotran.springboot.model.product.ShopItemBean;
import com.infotran.springboot.service.groupBuyService;

@Service
@Transactional
public class groupBuyServiceImpl implements groupBuyService {
	
	ShopItemBeanRepository shopItemDao;
	buyDetailRepository buyDetailDao;
	buyListRepository buyListDao;
	groupListRepository groupListDao;

	@Autowired
	public groupBuyServiceImpl(
			ShopItemBeanRepository shopItemDao,
			buyDetailRepository buyDetailDao,
			buyListRepository buyListDao,
			groupListRepository groupListDao
			) {
		this.shopItemDao = shopItemDao;
		this.buyDetailDao = buyDetailDao;
		this.buyListDao = buyListDao;
		this.groupListDao = groupListDao;
	}
	
	@Override
	public List<ShopItemBean> findAllShopItemBeanService() {
		return shopItemDao.findAll();
	}
	@Override
	public List<buyDetail> findAllBuyDetailService() {
		return buyDetailDao.findAll();
	}
	@Override
	public List<buyList> findAllBuyListService() {
		return buyListDao.findAll();
	}
	@Override
	public List<groupList> findAllGroupListService() {
		return groupListDao.findAll();
	}
//	@Override
//	public UserDB findUserDBService(String emailaddress,String pw) {
//		return UserDBDao.findByEmailaddressAndPassword(emailaddress,pw);
//	}
	
	//admin--------------------------------
	@Override
	public void deleteAdminService(Integer groupId) {
		groupListDao.deleteById(groupId);
		buyDetailDao.deleteByGroupId(groupId);
		buyListDao.deleteByGroupId(groupId);
	}
	@Override
	public groupList updateAdminShowService(Integer groupId) {
		return groupListDao.findByGroupId(groupId);
	}
	@Override
	public Optional<groupList> findByIdgroupListService(Integer groupId) {
		return groupListDao.findById(groupId);
	}
	@Override
	public void updateAdminSaveService(groupList bean) {
		buyDetailDao.updateGroupNameByGroupId(bean.getGroupName(), bean.getGroupId());
		groupListDao.save(bean);
	}
	
	//admin--------------------------------
	
	//shop--------------------------------
	@Override
	public List<groupList> findAllShopGroupListService(String name) {
		return groupListDao.findByGroupShopName(name);
	}

	
	//shop--------------------------------
	
	
	//byuer--------------------------------
	@Override
	public List<groupList> findAllBuyListService(String name) {
		List<buyList> lblBean = buyListDao.findByBuyerName(name);
		List<Integer> list1 = new ArrayList<>();
		for(buyList blBean:lblBean ) {
			list1.add(blBean.getGroupId());
		};
		Set<Integer> setList1 = new HashSet<>(list1);
		List<Integer> list2 = new ArrayList<>(setList1);
		
		List<groupList> lglBean = new ArrayList<>();
		for(int i=0; i<list2.size();i++) {
			Integer groupId = list2.get(i);
			System.out.println(groupId);
			groupList glBean2 = groupListDao.findByGroupId(groupId);
			lglBean.add(glBean2);
		}
		return lglBean;
	}
	
	@Override
	public List<buyDetail> findBuyDetailService(buyList bean) {
		return buyDetailDao.findByGroupId(bean.getGroupId() );
		
	}
	
	@Override
	public List<buyDetail> groupListCreateService(groupList glBean) {
		groupListDao.save(glBean);
		groupList glBean1 = groupListDao.findByPromoterAndGroupName(glBean.getPromoter(), glBean.getGroupName());
		
		List<ShopItemBean> lsib2 = shopItemDao.findByShopname(glBean1.getGroupShopName());
		for(ShopItemBean sib2: lsib2) {
			buyDetail bd = new buyDetail();
			bd.setGroupName(glBean1.getGroupName());
			bd.setGroupId(glBean1.getGroupId());
			bd.setGroupShopName(glBean1.getGroupShopName());
			bd.setItemId(sib2.getId());
			bd.setItemName(sib2.getShopitem());
			bd.setItemIntro(sib2.getItemintro());
			bd.setItemPrice(sib2.getItemprice());
			bd.setItemUnit(sib2.getPriceunit());
			bd.setItemTotal(0);
			buyDetailDao.save(bd);
			
			
			buyList blBean = new buyList();
			blBean.setGroupId(glBean1.getGroupId());
			blBean.setBuyerName(glBean1.getPromoter());
			blBean.setItemId(sib2.getId());
			blBean.setItemNumber(0);
			buyListDao.save(blBean);
		}
		
		
		return buyDetailDao.findByGroupId(glBean1.getGroupId());
	}
	@Override
	public List<buyDetail> groupListAttService(groupList glBean,String buyer) {
		groupListDao.save(glBean);
		groupList glBean1 = groupListDao.findByPromoterAndGroupName(glBean.getPromoter(), glBean.getGroupName());
		
		List<ShopItemBean> lsib2 = shopItemDao.findByShopname(glBean1.getGroupShopName());
		for(ShopItemBean sib2: lsib2) {
			
			buyList blBean = new buyList();
			blBean.setGroupId(glBean1.getGroupId());
			blBean.setBuyerName(buyer);
			blBean.setItemId(sib2.getId());
			blBean.setItemNumber(0);
			buyListDao.save(blBean);
		}
		
		
		return buyDetailDao.findByGroupId(glBean1.getGroupId());
	}
	
	@Override
	public buyList buyerEditPromoterService(int itemId,int groupId) {
		groupList glBean = groupListDao.findByGroupId(groupId);
		return buyListDao.findByGroupIdAndBuyerNameAndItemId(groupId,glBean.getPromoter(),itemId);
		
	}
	@Override
	public buyList buyerEditAttService(int itemId,int groupId,String buyer) {
		return buyListDao.findByGroupIdAndBuyerNameAndItemId(groupId,buyer,itemId);
		
	}
	@Override
	public void updadteBuyList(buyList bean) {
		buyListDao.updateBuyListBygroupIdAndItemIdAndBuyerName(
				bean.getItemNumber(),
				bean.getGroupId(),
				bean.getItemId(),
				bean.getBuyerName()
				);

		List<buyList> lblBean = buyListDao.findByGroupIdAndItemId(bean.getGroupId(),bean.getItemId());
		
		
		int sum = 0 ;
		for(buyList blBean: lblBean) {
			sum += blBean.getItemNumber();
		}
		buyDetailDao.updateitemTotal(sum,bean.getGroupId() ,bean.getItemId());
	}
	
	@Override
	public List<buyDetail> findBuyDetailService(int groupId) {
		return buyDetailDao.findByGroupId(groupId);
		
	}
	
	@Override
	public List<groupList> findGroupListNomalService(String name) {
		return groupListDao.findByPubliconootAndSoldStatus("公開","undone");
	}
	@Override
	public groupList findByGroupId(int id) {
		return groupListDao.findByGroupId(id);
	}

	@Override
	public List<buyDetail> findShopItemService(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void updateCancelSaveService(Integer groupId) {
		groupListDao.updateSoldStatusByGroupId(groupId);
	}
	
	
	//byuer--------------------------------
	
	
	
	
	
	
}

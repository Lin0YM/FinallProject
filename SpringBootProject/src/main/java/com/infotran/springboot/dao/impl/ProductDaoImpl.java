package com.infotran.springboot.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.infotran.springboot.dao.ProductDao;
import com.infotran.springboot.model.product.ShopIntroBean;
import com.infotran.springboot.model.product.ShopItemBean;

@Repository
public class ProductDaoImpl implements ProductDao {

//	private SessionFactory factory;
//
//	@Autowired
//	public ProductDaoImpl(SessionFactory factory) {
//		this.factory = factory;
//	}
	
	private Session session;
	
	@Autowired
	ProductDaoImpl(Session session) {
	this.session = session;
	}

	@Override
	public List<ShopIntroBean> getAllProducts() {

//		Session session = factory.getCurrentSession();
		String hql = "FROM ShopIntroBean";
		List<ShopIntroBean> list = new ArrayList<>();
		list = session.createQuery(hql, ShopIntroBean.class).getResultList();
		return list;
	}
	
	@Override
	public List<ShopIntroBean> searchByShop(String shop) {

//		Session session = factory.getCurrentSession();
		String hql = "from ShopIntroBean sib where sib.shopname like :shop";
		List<ShopIntroBean> list = session.createQuery(hql, ShopIntroBean.class)
								   .setParameter("shop", "%" + shop + "%")
								   .getResultList();
		return list;
	}

	@Override
	public List<ShopItemBean> searchByItem(String item) {
		
//		Session session = factory.getCurrentSession();
		String hql = "from ShopItemBean sib where sib.shopitem like :item";
		System.out.println(hql);
		List<ShopItemBean> itemList = session.createQuery(hql, ShopItemBean.class)
								   .setParameter("item", "%" + item + "%")
								   .getResultList();
		return itemList;
//		System.out.println(itemList.size());
//		if(itemList.size() != 0) {
//			hql = "from ShopIntroBean sib where ";
//			
//			for(int i = 0 ; i < itemList.size() ; i++) {
//				hql += "sib.shopname = '" + itemList.get(i) + "'";
//				while (i != (itemList.size() - 1)) {
//					hql += " or ";
//					break;
//				}
//			}
//			
//			System.out.println(hql);
//			List<ShopIntroBean> list = session.createQuery(hql, ShopIntroBean.class)
//					.getResultList();
//			return list;
//		}else {
//			return null;
//		}
	}
	
	@Override
	public ShopIntroBean getShopById(int shopId) {
		
//		Session session = factory.getCurrentSession();
		ShopIntroBean sib = session.get(ShopIntroBean.class, shopId);
		return sib;
	}
	
	@Override
	public ShopIntroBean getShopByName(String shopName) {
		
//		Session session = factory.getCurrentSession();
		String hql = "from ShopIntroBean sib where sib.shopname = :shop";
		ShopIntroBean sib = session.createQuery(hql, ShopIntroBean.class)
								   .setParameter("shop", shopName)
								   .getResultList().get(0);
		return sib;
	}
	
	@Override
	public ShopItemBean getItemById(int itemId) {
		
//		Session session = factory.getCurrentSession();
		ShopItemBean sib = session.get(ShopItemBean.class, itemId);
		return sib;
	}
	
	@Override
	public List<ShopItemBean> getItemByShopName(String shopName) {
		
//		Session session = factory.getCurrentSession();
		String hql = "from ShopItemBean sib where sib.shopname = :shop";
		List<ShopItemBean> list = session.createQuery(hql, ShopItemBean.class)
								   .setParameter("shop", shopName)
								   .getResultList();
		return list;
	}
	
	@Override
	public void deleteItem(int itemId) {
		
//		Session session = factory.getCurrentSession();
		ShopItemBean deleteBean = session.get(ShopItemBean.class, itemId);
		if(deleteBean != null) {
			session.delete(deleteBean);
		}
		
	}
	
	@Override
	public void updateShop(String shopIntro,Integer editShopId) {
		
//		Session session = factory.getCurrentSession();
		String hql = "update ShopIntroBean sib set sib.shopintro = :intro where sib.id = :id";
		session.createQuery(hql)
			   .setParameter("intro", shopIntro)
			   .setParameter("id", editShopId)
			   .executeUpdate();
	}
	
	@Override
	public void storeShopImage(MultipartFile photo, Integer editShopId) throws Exception {
		
		byte[] photoBytes = photo.getBytes();
		SerialBlob photoBlob = new SerialBlob(photoBytes);
//		Session session = factory.getCurrentSession();
		String hql = "update ShopIntroBean sib set sib.shopimg = :img where sib.id = :id";
		session.createQuery(hql)
			   .setParameter("img", photoBlob)
			   .setParameter("id", editShopId)
			   .executeUpdate();
	}
	
	@Override
	public void updateItem(String itemName,String itemIntro,Integer itemPrice,String priceUnit,Integer editItemId) {
		
//		Session session = factory.getCurrentSession();
		String hql = "update ShopItemBean sib set sib.shopitem = :name, sib.itemintro = :intro, sib.itemprice = :price, sib.priceunit = :unit where sib.id = :id";
		session.createQuery(hql)
			   .setParameter("name", itemName)
			   .setParameter("intro", itemIntro)
			   .setParameter("price", itemPrice)
			   .setParameter("unit", priceUnit)
			   .setParameter("id", editItemId)
			   .executeUpdate();
	}
	
	@Override
	public void storeItemImage(MultipartFile photo, Integer editItemId) throws Exception {
		
		byte[] photoBytes = photo.getBytes();
		SerialBlob photoBlob = new SerialBlob(photoBytes);
//		Session session = factory.getCurrentSession();
		String hql = "update ShopItemBean sib set sib.itemimg = :img where sib.id = :id";
		session.createQuery(hql)
			   .setParameter("img", photoBlob)
			   .setParameter("id", editItemId)
			   .executeUpdate();
	}
	
	@Override
	public Integer addItem(String editShopName,String itemName,String itemIntro,Integer itemPrice,String priceUnit) {
		
//		Session session = factory.getCurrentSession();
		ShopItemBean shopItemBean = new ShopItemBean(editShopName, itemName, itemIntro, itemPrice, priceUnit);
		Serializable itemIdSer = session.save(shopItemBean);
		Integer itemId = (Integer)itemIdSer;
		return itemId;
	}

	@Override
	public List<ShopItemBean> getAllItems() {

		String hql = "FROM ShopItemBean";
		List<ShopItemBean> list = new ArrayList<>();
		list = session.createQuery(hql, ShopItemBean.class).getResultList();
		return list;
	}

}

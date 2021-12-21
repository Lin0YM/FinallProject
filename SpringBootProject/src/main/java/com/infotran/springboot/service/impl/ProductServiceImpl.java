package com.infotran.springboot.service.impl;

import java.util.List;

import javax.persistence.EntityManagerFactory;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.infotran.springboot.dao.ProductDao;
import com.infotran.springboot.model.product.ShopIntroBean;
import com.infotran.springboot.model.product.ShopItemBean;
import com.infotran.springboot.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {
	
//	private SessionFactory factory;
	private Session session;
	ProductDao productDao;
	
	@Autowired
	public ProductServiceImpl(Session session, ProductDao productDao) {
		this.session = session;
		this.productDao = productDao;
	}
	
//	@Autowired
//	EntityManagerFactory emf;
//	
//	SessionFactory factory = emf.unwrap(SessionFactory.class);
	
	@Override
	@Transactional //A.O.P 要記得把RootApp的thread註解掉
	public List<ShopIntroBean> getAllProducts() {
		return productDao.getAllProducts();
	}

	@Override
	@Transactional
	public List<ShopIntroBean> searchByShop(String shop) {
		return productDao.searchByShop(shop);
	}

	@Override
	@Transactional
	public List<ShopItemBean> searchByItem(String item) {
		return productDao.searchByItem(item);
	}

	@Override
	@Transactional
	public ShopIntroBean getShopById(int shopId) {
		return productDao.getShopById(shopId);
	}
	
	@Override
	@Transactional
	public ShopIntroBean getShopByName(String shopName) {
		return productDao.getShopByName(shopName);
	}
	
	@Override
	@Transactional
	public ShopItemBean getItemById(int itemId) {
		return productDao.getItemById(itemId);
	}

	@Override
	@Transactional
	public List<ShopItemBean> getItemByShopName(String shopName) {
		return productDao.getItemByShopName(shopName);
	}

	@Override
	@Transactional
	public void deleteItem(int itemId) {
		productDao.deleteItem(itemId);
	}

	@Override
	@Transactional
	public void updateShop(String shopIntro, Integer editShopId) {
		productDao.updateShop(shopIntro, editShopId);
	}

	@Override
	@Transactional
	public void storeShopImage(MultipartFile photo, Integer editShopId) throws Exception {
		productDao.storeShopImage(photo, editShopId);
	}

	@Override
	@Transactional
	public void updateItem(String itemName, String itemIntro, Integer itemPrice, String priceUnit, Integer editItemId) {
		productDao.updateItem(itemName, itemIntro, itemPrice, priceUnit, editItemId);
	}

	@Override
	@Transactional
	public void storeItemImage(MultipartFile photo, Integer editItemId) throws Exception {
		productDao.storeItemImage(photo, editItemId);
	}

	@Override
	@Transactional
	public Integer addItem(String editShopName, String itemName, String itemIntro, Integer itemPrice,
			String priceUnit) {
		return productDao.addItem(editShopName, itemName, itemIntro, itemPrice, priceUnit);
	}

	@Override
	public List<ShopItemBean> getAllItems() {
		return productDao.getAllItems();
	}

}

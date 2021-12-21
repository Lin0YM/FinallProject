package com.infotran.springboot.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.infotran.springboot.model.product.ShopIntroBean;
import com.infotran.springboot.model.product.ShopItemBean;

public interface ProductDao {

	List<ShopIntroBean> getAllProducts();
	
	List<ShopIntroBean> searchByShop(String shop);
	
	List<ShopItemBean> searchByItem(String item);
	
	ShopIntroBean getShopById(int shopId);
	
	ShopIntroBean getShopByName(String shopName);
	
	ShopItemBean getItemById(int itemId);
	
	List<ShopItemBean> getItemByShopName(String shopName);
	
	List<ShopItemBean> getAllItems();
	
	void deleteItem(int itemId);
	
	void updateShop(String shopIntro,Integer editShopId);
	
	void storeShopImage(MultipartFile photo, Integer editShopId) throws Exception;
	
	void updateItem(String itemName,String itemIntro,Integer itemPrice,String priceUnit,Integer editItemId);
	
	void storeItemImage(MultipartFile photo, Integer editItemId) throws Exception;
	
	Integer addItem(String editShopName,String itemName,String itemIntro,Integer itemPrice,String priceUnit);

}
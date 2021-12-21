package com.infotran.springboot.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.infotran.springboot.model.product.ShopIntroBean;
import com.infotran.springboot.model.product.ShopItemBean;
import com.infotran.springboot.service.ProductService;

@Controller
public class ProductController {
	
	ProductService productService;
	
	
	@Autowired
	public ProductController(ProductService productService) {
		this.productService = productService;
	}

	@GetMapping("/shops")
	public String shopList(Model model) {

		List<ShopIntroBean> beans = productService.getAllProducts();
//		Collections.shuffle(beans);
		model.addAttribute("shops", beans);
		return "ItemList/shop";
	}
	
	@GetMapping("/search")
	public String searchShop(
			@RequestParam("howtosearch") String howtosearch,
			@RequestParam("search") String search,
			Model model
			) {
		List<ShopIntroBean> shopList = null;
		List<ShopItemBean> itemList = null;
		System.out.println(howtosearch);
		if(howtosearch.equals("shop")) {
			shopList = productService.searchByShop(search);
//			Collections.shuffle(shopList);
			model.addAttribute("shops", shopList);
			return "ItemList/shop";
		}else {
			itemList = productService.searchByItem(search);
			Collections.shuffle(itemList);
			model.addAttribute("items", itemList);
			return "ItemList/searchitem";
		}
	}
	
	@GetMapping("/itembyname")
	public String itemListByName(
			@RequestParam("shopname") String shopname,
			Model model
			) {
		ShopIntroBean shopBean = productService.getShopByName(shopname);
//		String shopName = shopBean.getShopname();
		List<ShopItemBean> itemBeans = productService.getItemByShopName(shopname);
		Collections.shuffle(itemBeans);
		model.addAttribute("shop", shopBean);
		model.addAttribute("items", itemBeans);
		return "ItemList/item";
	}
	
	@GetMapping("/item")
	public String itemList(
			@RequestParam("id") Integer id,
			Model model
			) {
		ShopIntroBean shopBean = productService.getShopById(id);
		String shopName = shopBean.getShopname();
		List<ShopItemBean> itemBeans = productService.getItemByShopName(shopName);
		Collections.shuffle(itemBeans);
		model.addAttribute("shop", shopBean);
		model.addAttribute("items", itemBeans);
		return "ItemList/item";
	}
	
	@GetMapping("/editpage")
	public String edit(
			@RequestParam("id") Integer id,
			Model model
			) {
		ShopIntroBean shopBean = productService.getShopById(id);
		String shopName = shopBean.getShopname();
		List<ShopItemBean> itemBeans = productService.getItemByShopName(shopName);
		model.addAttribute("shop", shopBean);
		model.addAttribute("items", itemBeans);
		return "ItemList/edit";
	}
	
	@PostMapping("/editshop")
	public String editShop(
			@RequestParam("editshopid") Integer editShopId,
			@RequestParam("shopintrovalue") String shopIntro,
			@RequestParam("uploadshopimg") MultipartFile photo,
			@RequestParam("checkshopupload") String checkShopUpload,
			HttpServletRequest request,
			Model model
			) throws Exception {
		
		productService.updateShop(shopIntro, editShopId);
		
		if (checkShopUpload.equals("upload")) {
			System.out.println("更新照片");
			productService.storeShopImage(photo, editShopId);
		}
		
		return "redirect:/editpage?id=" + editShopId;
	}
	
	@PostMapping("/edititem")
	public String editItem(
			@RequestParam("editshopid") Integer editShopId,
			@RequestParam("edititemid") Integer editItemId,
			@RequestParam("itemnamevalue") String itemName,
			@RequestParam("itemintrovalue") String itemIntro,
			@RequestParam("itempricevalue") Integer itemPrice,
			@RequestParam("priceunitvalue") String priceUnit,
			@RequestParam("uploaditemimg") MultipartFile photo,
			@RequestParam("checkitemupload") String checkItemUpload,
			HttpServletRequest request,
			Model model
			) throws Exception {
		
		productService.updateItem(itemName, itemIntro, itemPrice, priceUnit, editItemId);
		
		if (checkItemUpload.equals("upload")) {
			System.out.println("更新照片");
			productService.storeItemImage(photo, editItemId);
		}
		
		return "redirect:/editpage?id=" + editShopId;
	}
	
	@PostMapping("/additem")
	public String addItem(
			@RequestParam("editshopid") Integer editShopId,
			@RequestParam("editshopname") String editShopName,
			@RequestParam("itemnamevalue") String itemName,
			@RequestParam("itemintrovalue") String itemIntro,
			@RequestParam("itempricevalue") Integer itemPrice,
			@RequestParam("priceunitvalue") String priceUnit,
			@RequestParam("uploaditemimg") MultipartFile photo,
			@RequestParam("checkitemupload") String checkItemUpload,
			HttpServletRequest request,
			Model model
			) throws Exception {
		
		Integer addItemId = productService.addItem(editShopName, itemName, itemIntro, itemPrice, priceUnit);
		
		if (checkItemUpload.equals("upload")) {
			System.out.println("更新照片");
			productService.storeItemImage(photo, addItemId);
		}
		
		return "redirect:/editpage?id=" + editShopId;
	}
	
	@PostMapping("/deleteitem")
	public String deleteItem(
			@RequestParam("deleteitemid") Integer deleteItemId,
			@RequestParam("editshopid") Integer editShopId,
			Model model
			) {
		productService.deleteItem(deleteItemId);
		
		return "redirect:/editpage?id=" + editShopId;
	}
	
	@GetMapping("/showshopimage")
	public void showShopImage(
			@RequestParam("shopid") Integer shopId,
			HttpServletResponse response
			) throws Exception {
		
		ShopIntroBean shopBean = productService.getShopById(shopId);
		response.setContentType("image/jpg");
		byte[] imgBytes = shopBean.getShopimg().getBytes(1, (int)shopBean.getShopimg().length());
		response.getOutputStream().write(imgBytes);
		
		response.getOutputStream().close();
	}
	
	@GetMapping("/showshopimagebyname")
	public void showShopImageByName(
			@RequestParam("shopname") String shopname,
			HttpServletResponse response
			) throws Exception {
		
		ShopIntroBean shopBean = productService.getShopByName(shopname);
		response.setContentType("image/jpg");
		byte[] imgBytes = shopBean.getShopimg().getBytes(1, (int)shopBean.getShopimg().length());
		response.getOutputStream().write(imgBytes);
		
		response.getOutputStream().close();
	}
	
	@GetMapping("/showitemimage")
	public void showItemImage(
			@RequestParam("itemid") Integer itemId,
			HttpServletResponse response
			) throws Exception {
		
		ShopItemBean itemBean = productService.getItemById(itemId);
		response.setContentType("image/jpg");
		byte[] imgBytes = itemBean.getItemimg().getBytes(1, (int)itemBean.getItemimg().length());
		response.getOutputStream().write(imgBytes);
		
		response.getOutputStream().close();
	}

}

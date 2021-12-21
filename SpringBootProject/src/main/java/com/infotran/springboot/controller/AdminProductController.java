package com.infotran.springboot.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.infotran.springboot.model.member.Member;
import com.infotran.springboot.model.product.ShopIntroBean;
import com.infotran.springboot.model.product.ShopItemBean;
import com.infotran.springboot.model.singlebuy.SingleBuyItem;
import com.infotran.springboot.model.singlebuy.SingleBuyOrder;
import com.infotran.springboot.model.singlebuy.SingleBuyOrderItem;
import com.infotran.springboot.service.ProductService;
import com.infotran.springboot.service.SingleBuyItemService;
import com.infotran.springboot.service.SingleBuyOrderItemService;
import com.infotran.springboot.service.SingleBuyOrderService;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {
	
	ProductService productService;
	
	SingleBuyItemService singleBuyItemService;
	SingleBuyOrderService singleBuyOrderService;
	SingleBuyOrderItemService singleBuyOrderItemService;
	
	@Autowired
	public AdminProductController(ProductService productService, SingleBuyItemService singleBuyItemService,
			SingleBuyOrderService singleBuyOrderService, SingleBuyOrderItemService singleBuyOrderItemService) {
		this.productService = productService;
		this.singleBuyItemService = singleBuyItemService;
		this.singleBuyOrderService = singleBuyOrderService;
		this.singleBuyOrderItemService = singleBuyOrderItemService;
	}

	@GetMapping("/singlebuyitemlist")
	public String singleBuyItemList(
			Model model
			) {
		
		List<SingleBuyItem> allItems = singleBuyItemService.getAllItems();
		model.addAttribute("allItems",allItems);
		return "SingleBuy/admin/adminitemlist";
	}
	
	@PostMapping("/deletesinglebuyitem")
	public String deleteSingleBuyItem(
			@RequestParam("deleteitemid") Integer deleteItemId,
			Model model
			) {
		singleBuyItemService.deleteItem(deleteItemId);
		
		return "redirect:/admin/product/singlebuyitemlist";
	}
	
	@PostMapping("/addsinglebuyitem")
	public String addSingleBuyItem(
			@RequestParam("classificationvalue") String classification,
			@RequestParam("itemnamevalue") String itemName,
			@RequestParam("itemintrovalue") String itemIntro,
			@RequestParam("itempricevalue") Integer itemPrice,
			@RequestParam("priceunitvalue") String priceUnit,
			@RequestParam("uploaditemimg") MultipartFile photo,
			Model model
			) throws Exception {
		
		byte[] photoBytes = photo.getBytes();
		SerialBlob photoBlob = new SerialBlob(photoBytes);
		
		SingleBuyItem newitem = new SingleBuyItem(classification, itemName, itemIntro, itemPrice, priceUnit, photoBlob);
		singleBuyItemService.addItem(newitem);
		return "redirect:/admin/product/singlebuyitemlist";
	}
	
	@PostMapping("/editsinglebuyitem")
	public String editSingleBuyItem(
			@RequestParam("edititemid") Integer editItemId,
			@RequestParam("classificationvalue") String classification,
			@RequestParam("itemnamevalue") String itemName,
			@RequestParam("itemintrovalue") String itemIntro,
			@RequestParam("itempricevalue") Integer itemPrice,
			@RequestParam("priceunitvalue") String priceUnit,
			@RequestParam("uploaditemimg") MultipartFile photo,
			@RequestParam("checkitemupload") String checkShopUpload,
			Model model
			) throws Exception {
		
		SingleBuyItem editItem = singleBuyItemService.getItemById(editItemId);
		editItem.setClassification(classification);
		editItem.setItemname(itemName);
		editItem.setItemintro(itemIntro);
		editItem.setItemprice(itemPrice);
		editItem.setPriceunit(priceUnit);
		
		if (checkShopUpload.equals("upload")) {
			System.out.println("更新照片");
			byte[] photoBytes = photo.getBytes();
			SerialBlob photoBlob = new SerialBlob(photoBytes);
			editItem.setItemimg(photoBlob);
		}
		
		singleBuyItemService.addItem(editItem);
		return "redirect:/admin/product/singlebuyitemlist";
	}
	
	@GetMapping("/orderlist")
	public String orderList(
			Model model
			) {
		
		List<SingleBuyOrder> orders = null;
		orders = singleBuyOrderService.getAllSingleBuyOrders();
		List<Object[]> itemTotalPrice = singleBuyOrderItemService.findItemTotalPrice();
		List<Object[]> totalIncome = singleBuyOrderService.findTotalIncome();
		model.addAttribute("itemTotalPrice",itemTotalPrice);
		model.addAttribute("totalIncome",totalIncome);
		model.addAttribute("orders",orders);
		return "SingleBuy/admin/adminorderlist";
	}
	
	@GetMapping("/orderdetail")
	public String orderDetail(
			@RequestParam("orderid") Integer orderid,
			Model model
			) {
		List<SingleBuyOrderItem> orderitems = singleBuyOrderItemService.findByOrderId(orderid);
		SingleBuyOrder order = singleBuyOrderService.findByOrderid(orderid);

		model.addAttribute("orderitems",orderitems);
		model.addAttribute("order",order);
		return "SingleBuy/admin/adminorderdetail";
	}
	
	@GetMapping("/shoplist")
	public String shopList(Model model) {

		List<ShopIntroBean> beans = productService.getAllProducts();
		model.addAttribute("shops", beans);
		return "ItemList/admin/adminshoplist";
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
		return "ItemList/admin/admineditshop";
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
		
		return "redirect:/admin/product/editpage?id=" + editShopId;
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
		
		return "redirect:/admin/product/editpage?id=" + editShopId;
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
		
		return "redirect:/admin/product/editpage?id=" + editShopId;
	}
	
	@PostMapping("/deleteitem")
	public String deleteItem(
			@RequestParam("deleteitemid") Integer deleteItemId,
			@RequestParam("editshopid") Integer editShopId,
			Model model
			) {
		productService.deleteItem(deleteItemId);
		
		return "redirect:/admin/product/editpage?id=" + editShopId;
	}
	
}

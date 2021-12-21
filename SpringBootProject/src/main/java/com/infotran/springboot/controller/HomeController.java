package com.infotran.springboot.controller;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.infotran.springboot.model.product.ShopIntroBean;
import com.infotran.springboot.model.product.ShopItemBean;
import com.infotran.springboot.model.singlebuy.SingleBuyItem;
import com.infotran.springboot.service.ProductService;
import com.infotran.springboot.service.SingleBuyItemService;
import com.infotran.springboot.service.SingleBuyOrderItemService;
import com.infotran.springboot.service.SingleBuyOrderService;

@Controller
public class HomeController {
	
	SingleBuyItemService singleBuyItemService;
	SingleBuyOrderService singleBuyOrderService;
	SingleBuyOrderItemService singleBuyOrderItemService;
	ProductService productService;

	@Autowired
	public HomeController(SingleBuyItemService singleBuyItemService,ProductService productService,
			SingleBuyOrderService singleBuyOrderService, SingleBuyOrderItemService singleBuyOrderItemService) {
		this.singleBuyItemService = singleBuyItemService;
		this.singleBuyOrderService = singleBuyOrderService;
		this.singleBuyOrderItemService = singleBuyOrderItemService;
		this.productService = productService;
	}
	
	@GetMapping("/")
	public String index(
			Model model
			) {
		
//		List<SingleBuyItem> items = singleBuyItemService.getAllItems();
		List<ShopItemBean> items = productService.getAllItems();
		int size = items.size();
		HashSet<ShopItemBean> recommendItems = new HashSet<ShopItemBean>();
		int i;
		while( recommendItems.size() < 7) {
			i = (int)(Math.random() * size);
			recommendItems.add(items.get(i));
		}
		
		model.addAttribute("recommendItems", recommendItems);
		return "index";
	}
	
}

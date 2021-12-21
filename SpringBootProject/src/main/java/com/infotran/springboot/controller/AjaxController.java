package com.infotran.springboot.controller;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.infotran.springboot.model.product.ShopItemBean;
import com.infotran.springboot.model.singlebuy.SingleBuyItem;
import com.infotran.springboot.service.ProductService;
import com.infotran.springboot.service.SingleBuyItemService;
import com.infotran.springboot.service.SingleBuyOrderItemService;
import com.infotran.springboot.service.SingleBuyOrderService;

@RestController
public class AjaxController {
	
	SingleBuyItemService singleBuyItemService;
	SingleBuyOrderService singleBuyOrderService;
	SingleBuyOrderItemService singleBuyOrderItemService;
	ProductService productService;

	@Autowired
	public AjaxController(SingleBuyItemService singleBuyItemService,ProductService productService,
			SingleBuyOrderService singleBuyOrderService, SingleBuyOrderItemService singleBuyOrderItemService) {
		this.singleBuyItemService = singleBuyItemService;
		this.singleBuyOrderService = singleBuyOrderService;
		this.singleBuyOrderItemService = singleBuyOrderItemService;
		this.productService = productService;
	}
	
	@PostMapping("/index2")
	public List<Object[]> index2(
			Model model
			) {
		
//		List<ShopItemBean> items = productService.getAllItems();
//		List<Object[]> items = singleBuyOrderItemService.findItemTotalPrice();
//		List<Object[]> items = singleBuyOrderService.findTotalIncome();
//		List<SingleBuyItem> items = singleBuyItemService.getAllItems();
		List<Object[]> items = singleBuyItemService.getAllItemsForAjax();
		return items;
	}

}

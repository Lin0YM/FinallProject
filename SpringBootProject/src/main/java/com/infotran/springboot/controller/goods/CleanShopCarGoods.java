package com.infotran.springboot.controller.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.infotran.springboot.model.goodsbean.GoodsBean;
import com.infotran.springboot.service.GoodsService;

@Controller
@SessionAttributes("ShoppingCartGoodsBean")
public class CleanShopCarGoods {
	
GoodsService springGoodsService;
	
	
	@Autowired
	public CleanShopCarGoods(GoodsService springGoodsService) {
		this.springGoodsService = springGoodsService;
	}
	
	@GetMapping("/goods/homelist")
	public String welcome(Model model,SessionStatus status) {
		
		status.setComplete();
		model.addAttribute("title","二手商品交易專區");
		model.addAttribute("subtitle1","會員上架商品");
		model.addAttribute("subtitle2","會員上架商品清單");
		model.addAttribute("subtitle3","會員購物車清單");
		model.addAttribute("subtitle4","查詢下訂商品狀態");
		model.addAttribute("subtitle5","查詢出售商品狀態");
		model.addAttribute("subtitle6","查詢評論");
		
		List<GoodsBean> goods= springGoodsService.findAllGoods();
		model.addAttribute("goods",goods);
		return "jspfile/homepage";
	}
}

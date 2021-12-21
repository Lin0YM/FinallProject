package com.infotran.springboot.controller.goods;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes("ShoppingCartGoodsBean")
public class ShopCargoodsLogout {

	@GetMapping("/goods/return")
	public String goodsOrderLogout(Model model , SessionStatus status) {
		
		status.setComplete();
		
		return "jspfile/index";
		
	}
}

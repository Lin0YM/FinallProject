package com.infotran.springboot.controller.goods;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.infotran.springboot.model.goodsbean.GoodsBean;
import com.infotran.springboot.model.goodsbean.MemberOrderListBean;
import com.infotran.springboot.model.goodsbean.OrderItemGoodsBean;
import com.infotran.springboot.model.goodsbean.ShoppingCartGoodsBean;
import com.infotran.springboot.model.member.Member;
import com.infotran.springboot.service.GoodsService;



@Controller
@SessionAttributes({"member3","ShoppingCartGoodsBean"})
public class ShoppingCarGoodsController {
	
	GoodsService springGoodsService;
	
	
	@Autowired
	public ShoppingCarGoodsController(GoodsService springGoodsService) {
		this.springGoodsService = springGoodsService;
	}

	//=================下訂購物商品資訊==================

	@GetMapping("/goods/Ordergoodsitem")
	public String Shopcargoodsadd(@RequestParam("id") Integer id,Model model) {
		Optional<GoodsBean> goodbeans=springGoodsService.goodById(id);
		if(goodbeans.isPresent()) {
			GoodsBean goodbean=goodbeans.get();
			model.addAttribute("shopcaraddinfo",goodbean);
			return "jspfile/Shopcarorderspage";
		}else {
			throw new RuntimeException("不存在");
		}
		
	}
	
	
	
	//==================組合購物車資訊=============================
	
	@GetMapping("/goods/shopcarlist")
	public String Shopcargoodslistcheck(
			@RequestParam("ordergoodsID") Integer id,
			@RequestParam("ordergoodnum") Integer num,
			@RequestParam("ordergoodsprice") Integer price,
			@RequestParam("orderaddress") String orderaddress,
			Model model) {
		ShoppingCartGoodsBean cart = (ShoppingCartGoodsBean)model.getAttribute("ShoppingCartGoodsBean");
		Optional<GoodsBean> beans = springGoodsService.goodById(id);
		if(beans.isPresent()) {
			GoodsBean bean=beans.get();
			bean.setGoodsNum(num);
			bean.setGoodsPrice(price);
			OrderItemGoodsBean oib = new OrderItemGoodsBean(null, bean, num ,orderaddress);
			Long number=id.longValue();
			cart.addOrderCar(number, oib);
			return "jspfile/Shopcarlist";
		}else {
			throw new RuntimeException("不存在");
		}
	}
	
	@GetMapping("/goods/Toshopcarlist")
	public String Shopcargoodslistcheck() {
		return "jspfile/Shopcarlist";
	}
	
	//==================create 購物車物件=================
	
	@ModelAttribute("ShoppingCartGoodsBean")
	public ShoppingCartGoodsBean createShopping(Model model) {
		ShoppingCartGoodsBean sc = new ShoppingCartGoodsBean();
		return sc;
	}
	
	//=================shopcarinsertTo資料庫===============
	
	@GetMapping("/goods/shopcartohistory")
	public String shopCarGoodsHistory(@ModelAttribute("goodsorderinsert") MemberOrderListBean memberlistbean ,Model model) {
		ShoppingCartGoodsBean shopBean=(ShoppingCartGoodsBean)model.getAttribute("ShoppingCartGoodsBean");
		Member memberbean=(Member)model.getAttribute("member3");
		String loginusername=memberbean.getUsername();
		Map<Long, OrderItemGoodsBean> odrin=shopBean.getShopCar();
		String shopDate = shopBean.getOrderDate();
		springGoodsService.shopCarAddGoods(loginusername,odrin , shopDate);

		List<OrderItemGoodsBean> list = new ArrayList<OrderItemGoodsBean>(odrin.values());
		springGoodsService.ordergoodsin(list,loginusername);
		
		return "jspfile/Memberorderfinish";
		
	}
	
	
	//=================shopcar 刪除單一商品項目================
	
	
	@GetMapping("/goods/shopcar/delete")
	public String deletesingleitem(@RequestParam("id") Integer number ,Model model) {
		ShoppingCartGoodsBean shopBean=(ShoppingCartGoodsBean)model.getAttribute("ShoppingCartGoodsBean");
		Long goodsnumber=number.longValue();
		shopBean.deleteBook(goodsnumber);
		return "jspfile/Shopcarlist";
		
	}
	
	@GetMapping("/goods/ordergoodslist")
	public String findAllOrderList(Model model) {
		Member loginmemberbean  = (Member)model.getAttribute("member3");
		String username = loginmemberbean.getUsername();
		List<MemberOrderListBean> ordergoodslist = springGoodsService.findByOrderitemusername(username);
		model.addAttribute("ordergoodslist",ordergoodslist);
		return "jspfile/findpersonalordergoodslist";
	}
	
	//============================訂單狀態確認===================================
	@GetMapping("/goods/goodsorderstatus")
	public String ordergoodsstatuscheck(Model model) {
		Member loginmemberbean  = (Member)model.getAttribute("member3");
		String goodsuploadusername = loginmemberbean.getUsername();
		List<MemberOrderListBean> ordergoodslistconfirm=springGoodsService.findByGoodsuploadusername(goodsuploadusername);
		List<MemberOrderListBean> newordergoodslistconfirm=new ArrayList<>();
		for(MemberOrderListBean bean:ordergoodslistconfirm) {
			if(bean.getGoodstransationstatus().equals("請等候賣家....")) {
			newordergoodslistconfirm.add(bean);
			}
		}
		model.addAttribute("ordergoodslist",newordergoodslistconfirm);
		return "jspfile/ordergoodsstatus";
		
	}
	
	@GetMapping("/goods/checkstatusconfirm/{id}")
	public String goodsorderstatusconfirm(@PathVariable("id") Integer ordernumber) {
		Optional<MemberOrderListBean> needchangestatusbeans=springGoodsService.changeOrderGoodsById(ordernumber);
		if(needchangestatusbeans.isPresent()) {
			MemberOrderListBean getneedchangestatusbean=needchangestatusbeans.get();
			getneedchangestatusbean.setGoodstransationstatus("確認出貨");
			springGoodsService.confirmorcancel(getneedchangestatusbean);
			return "redirect:/goods/goodsorderstatus";
		}else {
			throw new RuntimeException("不存在");
		}

	}
	
	@GetMapping("/goods/checkstatuscancel/{id}")
	public String goodsorderstatuscancel(@PathVariable("id") Integer ordernumber) {
		Optional<MemberOrderListBean> needchangestatusbeans=springGoodsService.changeOrderGoodsById(ordernumber);
		if(needchangestatusbeans.isPresent()) {
			MemberOrderListBean getneedchangestatusbean=needchangestatusbeans.get();
			getneedchangestatusbean.setGoodstransationstatus("取消出貨");
			springGoodsService.confirmorcancel(getneedchangestatusbean);
			return "redirect:/goods/goodsorderstatus";
		}else {
			throw new RuntimeException("不存在");
		}

	}
	
	
	
	
	
	
}

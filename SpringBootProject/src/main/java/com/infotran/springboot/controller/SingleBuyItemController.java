package com.infotran.springboot.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.infotran.springboot.dao.SingleBuyOrderItemRepository;
import com.infotran.springboot.model.member.Member;
import com.infotran.springboot.model.singlebuy.CartItem;
import com.infotran.springboot.model.singlebuy.SingleBuyItem;
import com.infotran.springboot.model.singlebuy.SingleBuyOrder;
import com.infotran.springboot.model.singlebuy.SingleBuyOrderItem;
import com.infotran.springboot.service.SingleBuyItemService;
import com.infotran.springboot.service.SingleBuyOrderItemService;
import com.infotran.springboot.service.SingleBuyOrderService;

@Controller
@RequestMapping("/singlebuy")
@SessionAttributes({"members","member3", "name", "status", "loginCheck", "cart"})
public class SingleBuyItemController {
	
	SingleBuyItemService singleBuyItemService;
	SingleBuyOrderService singleBuyOrderService;
	SingleBuyOrderItemService singleBuyOrderItemService;

	@Autowired
	public SingleBuyItemController(SingleBuyItemService singleBuyItemService,
			SingleBuyOrderService singleBuyOrderService, SingleBuyOrderItemService singleBuyOrderItemService) {
		this.singleBuyItemService = singleBuyItemService;
		this.singleBuyOrderService = singleBuyOrderService;
		this.singleBuyOrderItemService = singleBuyOrderItemService;
	}

	@GetMapping("/items")
	public String itemList(Model model) {
		
		return "SingleBuy/itemsforajax";
	}
	
	@GetMapping("/classitems")
	public String classItems(
			@RequestParam("classification") String classification,
			Model model
			) {
		List<SingleBuyItem> items = singleBuyItemService.getItemsByClassification(classification);
//		Collections.shuffle(items);
		model.addAttribute("items", items);
		return "SingleBuy/items";
	}
	
	@GetMapping("/searchitem")
	public String searchItem(
			@RequestParam("search") String search,
			Model model
			) {
		
		List<SingleBuyItem> items = singleBuyItemService.findBySearch(search);
		model.addAttribute("items", items);
		
		return "SingleBuy/items";
	}
	
	@GetMapping("/itempage")
	public String itemPage(
			@RequestParam("itemid") Integer itemid,
			Model model
			) {
		SingleBuyItem item = singleBuyItemService.getItemById(itemid);
		List<SingleBuyItem> items = singleBuyItemService.getItemsByClassification(item.getClassification());
		int size = items.size();
		HashSet<SingleBuyItem> recommendItems = new HashSet<SingleBuyItem>();
		int i;
		while( recommendItems.size() < 7) {
			i = (int)(Math.random() * size);
			recommendItems.add(items.get(i));
		}
		
		model.addAttribute("recommendItems", recommendItems);
		model.addAttribute("item", item);
		return "SingleBuy/itempage";
	}
	
	@PostMapping("/addcart")
	public String addCart(
			@RequestParam("quantity") Integer quantity,
			@RequestParam("gocartitemid") Integer gocartitemid,
			Model model
			) {
		CartItem newCartItem = new CartItem(gocartitemid, quantity, singleBuyItemService.getItemById(gocartitemid));
		
		List<CartItem> theCart = (ArrayList<CartItem>) model.getAttribute("cart");
		if(theCart == null) {
			theCart = new ArrayList<>();
            theCart.add(newCartItem);
		}else {
			boolean found = false;
            Iterator<CartItem> iter = theCart.iterator();
            while (!found && iter.hasNext()) {
            	CartItem aCartItem = (CartItem)iter.next();
//            	System.out.println(aCartItem.getItemId() + "：" + aCartItem.getQuantity() + "個");
            	if(aCartItem.getItemId() == newCartItem.getItemId()) {
            		aCartItem.setQuantity(aCartItem.getQuantity() + newCartItem.getQuantity());
            		found = true;
            	}
            }
            if (!found) {
            	theCart.add(newCartItem);
            }
		}
		model.addAttribute("cart",theCart);
		return "redirect:/singlebuy/itempage?itemid=" + gocartitemid;
	}
	
	@GetMapping("/shoppingcart")
	public String shoppingcart(
			Model model
			) {
		int itemtotalprice = 0;
		List<CartItem> theCart = (ArrayList<CartItem>) model.getAttribute("cart");
		if(theCart != null) {
            Iterator<CartItem> iter = theCart.iterator();
            while (iter.hasNext()) {
            	CartItem aCartItem = (CartItem)iter.next();
            	itemtotalprice += (aCartItem.getQuantity())*(aCartItem.getSingleBuyItem().getItemprice());
            }
		}
		System.out.println(itemtotalprice);
		//運費 總價
		int deliveryfee = 0;
		if(itemtotalprice <= 500 && itemtotalprice != 0) {
			deliveryfee = 50;
		}
		int totalprice = itemtotalprice + deliveryfee;
		
		model.addAttribute("cart",theCart);
		model.addAttribute("itemtotalprice",itemtotalprice);
		model.addAttribute("deliveryfee",deliveryfee);
		model.addAttribute("totalprice",totalprice);
		return "SingleBuy/shoppingcart_first";
	}
	
	@GetMapping("/chooseshop")
	public String chooseShop(
			@RequestParam("st_name") String st_name,
			@RequestParam("st_addr") String st_addr,
			HttpServletRequest request,
			Model model
			) throws UnsupportedEncodingException{

		String address = st_name + "-" + st_addr;
		
		int itemtotalprice = 0;
		List<CartItem> theCart = (ArrayList<CartItem>) model.getAttribute("cart");
		if(theCart != null) {
            Iterator<CartItem> iter = theCart.iterator();
            while (iter.hasNext()) {
            	CartItem aCartItem = (CartItem)iter.next();
            	itemtotalprice += (aCartItem.getQuantity())*(aCartItem.getSingleBuyItem().getItemprice());
            }
		}
		int deliveryfee = 0;
		if(itemtotalprice <= 500 && itemtotalprice != 0) {
			deliveryfee = 50;
		}
		int totalprice = itemtotalprice + deliveryfee;
		
		
		model.addAttribute("address",address);
		
		model.addAttribute("itemtotalprice",itemtotalprice);
		model.addAttribute("deliveryfee",deliveryfee);
		model.addAttribute("totalprice",totalprice);
		
		return "SingleBuy/shoppingcart_second";
	}
	
	@PostMapping("/deletecartitem")
	public String deletecartitem(
			@RequestParam("deleteitemid") Integer deleteitemid,
			Model model
			) {
		List<CartItem> theCart = (ArrayList<CartItem>) model.getAttribute("cart");
		
		Iterator<CartItem> iter = theCart.iterator();
        while (iter.hasNext()) {
        	CartItem aCartItem = (CartItem)iter.next();
        	if(aCartItem.getItemId() == deleteitemid) {
        		iter.remove();
        		break;
        	}
        }

		model.addAttribute("cart",theCart);
		return "redirect:/singlebuy/shoppingcart";
	}
	
	@PostMapping("/goorder")
	public String goorder(
			@RequestParam("paymethod") String paymethod,
			@RequestParam("deliverymethod") String deliverymethod,
			@RequestParam("address") String address,
			@RequestParam("name") String name,
			@RequestParam("phonenumber") String phonenumber,
			@RequestParam("itemtotalprice") Integer itemtotalprice,
			@RequestParam("deliveryfee") Integer deliveryfee,
			@RequestParam("totalprice") Integer totalprice,
			Model model
			) throws ParseException {
		List<CartItem> theCart = (ArrayList<CartItem>) model.getAttribute("cart");
		
		Member member = (Member)model.getAttribute("member3");
		Integer memberId = member.getId();
		
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String current = sdFormat.format(new Date());
		
//		Timestamp ts = new Timestamp(System.currentTimeMillis());
		SingleBuyOrder theOrder = new SingleBuyOrder(memberId, paymethod, deliverymethod, name, phonenumber, address, itemtotalprice, deliveryfee, totalprice, current, "配送中");
		SingleBuyOrder orderbean = singleBuyOrderService.save(theOrder);
		Integer orderid = orderbean.getOrderid();
		System.out.println("orderid = " + orderid);
		
		for(int i = 0 ; i < theCart.size() ; i++) {
			CartItem cartItem = theCart.get(i);
			SingleBuyOrderItem singleBuyOrderItem = new SingleBuyOrderItem(orderid, memberId, cartItem.getItemId(), cartItem.getSingleBuyItem().getItemname(), 
					cartItem.getSingleBuyItem().getItemprice(), cartItem.getQuantity(), "Yes");
			singleBuyOrderItemService.save(singleBuyOrderItem);
		}
		
		theCart.clear();
		model.addAttribute("cart",theCart);
		return "redirect:/singlebuy/orderlist";//去訂單查詢
	}
	
	@GetMapping("/orderlist")
	public String orderList(
			Model model
			) {
		String status = (String)model.getAttribute("status");
		Member member = (Member)model.getAttribute("member3");
		Integer memberId = member.getId();
		List<SingleBuyOrder> orders = null;
//		if(status.equals("管理員")) {
//			orders = singleBuyOrderService.getAllSingleBuyOrders();
//			model.addAttribute("orders",orders);
//			return "SingleBuy/orderlistforadmin";
//		}else {
			orders = singleBuyOrderService.findByUserid(memberId);
			model.addAttribute("orders",orders);
			return "SingleBuy/orderlistforcustomer";
//		}
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
		return "SingleBuy/orderdetail";
	}
	
	@GetMapping("/cancelorder")
	public String cancelOrder(
			@RequestParam("orderid") Integer orderid,
			Model model
			) {
		SingleBuyOrder order = singleBuyOrderService.findByOrderid(orderid);
		order.setCancelstatus("等待取消");
		singleBuyOrderService.save(order);
		
		return "redirect:/singlebuy/orderlist";
	}
	
	@GetMapping("/finishorder")
	public String finishOrder(
			@RequestParam("orderid") Integer orderid,
			Model model
			) {
		SingleBuyOrder order = singleBuyOrderService.findByOrderid(orderid);
		order.setCancelstatus("訂單完成");
		singleBuyOrderService.save(order);
		
		return "redirect:/admin/product/orderlist";
	}
	
	@GetMapping("/confirmcancel")
	public String confirmCancel(
			@RequestParam("orderid") Integer orderid,
			Model model
			) {
		SingleBuyOrder order = singleBuyOrderService.findByOrderid(orderid);
		order.setCancelstatus("取消完成");
		singleBuyOrderService.save(order);
		
		return "redirect:/admin/product/orderlist";
	}
	
	@GetMapping("/showitemimage")
	public void showItemImage(
			@RequestParam("itemid") Integer itemId,
			HttpServletResponse response
			) throws Exception {
		
		SingleBuyItem itemBean = singleBuyItemService.getItemById(itemId);
		response.setContentType("image/jpg");
		byte[] imgBytes = itemBean.getItemimg().getBytes(1, (int)itemBean.getItemimg().length());
		response.getOutputStream().write(imgBytes);
		response.getOutputStream().close();
	}

}

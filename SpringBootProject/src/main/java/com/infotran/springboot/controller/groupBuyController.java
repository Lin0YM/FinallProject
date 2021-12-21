package com.infotran.springboot.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.infotran.springboot.model.groupbuy.buyDetail;
import com.infotran.springboot.model.groupbuy.buyList;
import com.infotran.springboot.model.groupbuy.groupList;
import com.infotran.springboot.model.product.ShopItemBean;
import com.infotran.springboot.service.groupBuyService;

@Controller
//@SessionAttributes(value="member")
@SessionAttributes(value="member3")
public class groupBuyController {
	ServletContext context;
	groupBuyService gbService;

	@Autowired
	public groupBuyController(ServletContext context,groupBuyService gbService) {
		this.context = context;
		this.gbService = gbService;
	} 
//	public String loginCheck(Model model) {
//		UserDB bx = (UserDB) model.getAttribute("member");
//		if(bx != null) {
//			System.out.println(bx.getName());
//			return null;
//		}else {
//			System.out.println("nothing");
//			return "index";
//		}
//	}
//	
//	@GetMapping("/groupBuyloginPage")
//	public String loginPage(Model model) {
//		UserDB bean = new UserDB();
//		model.addAttribute("loginInfor", bean);
//		return "groupBuy/loginPage";
//	} 
//	
//	@PostMapping("/groupBuyloginsubmit")
//	public String loginsubmit(
//			@ModelAttribute("loginInfor") UserDB bean,
//			Model model
//			) {
//		UserDB uDB = gbService.findUserDBService(bean.getEmailaddress(),bean.getPassword());
//		if(uDB != null) {
//			model.addAttribute("member",uDB);
//			if(uDB.getStatus().equals("管理員")) {
//				return "groupBuy/admin/adminMain";
//			}
//			else if(uDB.getStatus().equals("廠商")){
//				return "groupBuy/shopMain";
//			}
//			else {
//				return "groupBuy/buyerMain";
//			}
//			
//		}else {
//		return "groupBuy/loginPage";
//		}
//	} 
//	
//	@GetMapping("/groupBuylogOut")
//	public String logOut(SessionStatus sessionStatus) {
//		sessionStatus.setComplete();
//		return "index";
//	} 
//	@GetMapping("/member/logout")
//	public String adminlogOut(SessionStatus sessionStatus) {
//		sessionStatus.setComplete();
//		return "index";
//	} 
//	
//	@GetMapping("/groupBuyindex")
//	public String groupBuyindex(Model model) {
//		String status = loginCheck(model);
//		if(status != null) {
//			return status;
//		}else {
//			return "groupBuy/groupBuyindex";
//		}	
//	} 
	
	@GetMapping("/sampleMember")
	public String sampleMember(Model model) {
		return "groupBuy/sampleMember";
	}

	
	
	
	
	
	//test-------------------------------
	@GetMapping("/test")
	public String test() {
		return "groupBuy/testtt";
	} 
	@GetMapping("/testShopItem")
	public String testShopItemBean(Model model) {
		List<ShopItemBean> lsiBean = gbService.findAllShopItemBeanService();
		model.addAttribute("testShopItemResult", lsiBean);
		return "groupBuy/testtt";
	}
	@GetMapping("/testBuyDetail")
	public String testBuyDetail(Model model) {
		List<buyDetail> lbdBean = gbService.findAllBuyDetailService();
		model.addAttribute("testBuyDetailResult", lbdBean);
		return "groupBuy/testtt";
	}
	@GetMapping("/testBuyList")
	public String testBuyList(Model model) {
		List<buyList> lblBean = gbService.findAllBuyListService();
		model.addAttribute("testBuyListResult", lblBean);
		return "groupBuy/testtt";
	}
	@GetMapping("/testGroupList")
	public String testGroupList(Model model) {
		List<groupList> lglBean = gbService.findAllGroupListService();
		model.addAttribute("testGroupListResult", lglBean);
		return "groupBuy/testtt";
	}
	//test-------------------------------
	
	//admin-------------------------------
	@GetMapping("/sampleBack")
	public String sampleBack(Model model) {
		return "groupBuy/admin/sampleBack";
	}
	@GetMapping("/groupBuyadminMain")
	public String adminMain(Model model) {
		return "groupBuy/admin/adminMain";
	}
	
	@GetMapping("/groupBuyadmin")
	public String adminFindAll(Model model) {
		List<groupList> lglBean = gbService.findAllGroupListService();
		model.addAttribute("adminFindAll", lglBean);
		return "groupBuy/admin/admin";
	} 
	
	@GetMapping("/groupBuyadminDelete")
	public String adminDelete(@RequestParam int groupId,
			Model model) {
		gbService.deleteAdminService(groupId);
		List<groupList> lglBean = gbService.findAllGroupListService();
		model.addAttribute("adminFindAll", lglBean);
		return "groupBuy/admin/admin";
	} 
	
	@GetMapping("/groupBuyadminUpdate")
	public String adminUpdateShow(@RequestParam int groupId,
			Model model) {
		groupList glBean = gbService.updateAdminShowService(groupId);
		model.addAttribute("adminUpdateShow", glBean);
		return "groupBuy/admin/adminUpdateShow";
	} 
	
	// 修改admin groupList資料
	@PostMapping("/groupBuyadminUpdateSave")
	public String adminUpdateSave(
			Model model,
			@ModelAttribute("adminUpdateShow") groupList bean) {
//		System.out.println(bean.getGroupArea()+" " + bean.getPromoter());	
		gbService.updateAdminSaveService(bean);
		
		List<groupList> lglBean = gbService.findAllGroupListService();
		model.addAttribute("adminFindAll", lglBean);
		return "groupBuy/admin/admin";
	}
	//admin-------------------------------
	
	//shop-------------------------------
	@GetMapping("/groupBuyshopMain")
	public String shopMain(Model model) {
		return "groupBuy/shopMain";
	}
	
	
	@GetMapping("/groupBuyshop")
	public String shopFindAll(@RequestParam String name,
			Model model) {
//		System.out.println("\n"+"dddddddddddddddddd"+name);
//		System.out.println("我很好");
		List<groupList> lglBean = gbService.findAllShopGroupListService(name);
		model.addAttribute("adminFindAll", lglBean);
		return "groupBuy/shop";
	} 
	
	@GetMapping("/groupBuyshopUpdate")
	public String shopUpdateShow(@RequestParam int groupId,
			Model model) {
		groupList glBean = gbService.updateAdminShowService(groupId);
		model.addAttribute("adminUpdateShow", glBean);
		return "groupBuy/shopUpdateShow";
	}
	// 修改admin groupList資料
	@PostMapping("/groupBuyshopUpdateSave")
	public String shopUpdateSave(
			Model model,
			@ModelAttribute("adminUpdateShow") groupList bean) {
//		System.out.println(bean.getGroupArea()+" " + bean.getPromoter());	
		gbService.updateAdminSaveService(bean);
		
		List<groupList> lglBean = gbService.findAllShopGroupListService(bean.getGroupShopName());
		model.addAttribute("adminFindAll", lglBean);
		return "groupBuy/admin";
	}
	
	@GetMapping("/groupBuyshopCancel")
	public String shopCancel(
			@RequestParam int groupId,
			@RequestParam String groupShopName,
			Model model) {
		gbService.updateCancelSaveService(groupId);
		List<groupList> lglBean = gbService.findAllShopGroupListService(groupShopName);
		model.addAttribute("adminFindAll", lglBean);
		return "groupBuy/shop";
	} 
	
	@PostMapping("/groupBuyUpdateSave")
	public String UpdateSave(
			Model model,
			@ModelAttribute("adminUpdateShow") groupList bean) {
//		System.out.println(bean.getGroupArea()+" " + bean.getPromoter());	
		gbService.updateAdminSaveService(bean);
		
		
//		List<groupList> lglBean = gbService.findAllGroupListService();
		List<groupList> lglBean = gbService.findAllShopGroupListService(bean.getGroupShopName());
		
		model.addAttribute("adminFindAll", lglBean);
		return "groupBuy/shop";
	}
	
	//shop-------------------------------
	
	
	//buyer-------------------------------
	@GetMapping("/groupBuybuyerMain")
	public String buyer(Model model) {
		return "groupBuy/buyerMain";
	}
	
	
	@GetMapping("/groupBuybuyer")
	public String buyerFindAll(@RequestParam String name,
			Model model) {
		List<groupList> lglBean = gbService.findAllBuyListService(name);
		model.addAttribute("buyListFindAll", lglBean);
		model.addAttribute("buyListName", name);
		return "groupBuy/buyer";
	} 
	
	// 本方法送出新增groupList資料的空白表單
	@GetMapping("/groupBuybuyerStart")
	public String buyerxxx(
			@RequestParam String buyer,
			Model model) {
		groupList glBean = new groupList();
		glBean.setPromoter(buyer);
		glBean.setSoldStatus("undone");
		model.addAttribute("groupList", glBean);
		return "groupBuy/buyerGroupList";
	} 
	@PostMapping("/groupBuybuyerGroupListStart")
	public String buyerGroupListStart(
			@ModelAttribute("groupList") groupList bean,
			Model model) {
		
		List<buyDetail> lsiBean = gbService.groupListCreateService(bean);
		model.addAttribute("buyDetail", lsiBean);
		
		return "groupBuy/buyerBuyDetail";
	} 
	
	@GetMapping("/groupBuybuyerEdit")
	public String buyerEditPromoter(
			@RequestParam int itemId,
			@RequestParam int groupId,
			@RequestParam String buyer,
			Model model) {
		System.out.println("aaaaaaa"+itemId+groupId+buyer);
		buyList blBean = gbService.buyerEditPromoterService(itemId,groupId);	
		model.addAttribute("itemNum", blBean);
		return "groupBuy/buyerEditPage";
	} 
	@GetMapping("/groupBuybuyerEditAtt")
	public String buyerEditAtt(
			@RequestParam int itemId,
			@RequestParam int groupId,
			@RequestParam String buyer,
			Model model) {
		System.out.println("bbbbbb"+itemId+groupId+buyer);	
		buyList blBean = gbService.buyerEditAttService(itemId,groupId,buyer);	
		model.addAttribute("itemNum", blBean);
		return "groupBuy/buyerEditPage";
	} 
	
	@PostMapping("/groupBuyitemNumUpadate")
	public String itemNumUpadate(
			@ModelAttribute("itemNum") buyList bean,
			Model model) {
		
		gbService.updadteBuyList(bean);
		List<buyDetail> lsiBean = gbService.findBuyDetailService(bean);
		model.addAttribute("buyDetail", lsiBean);
		
		return "groupBuy/buyerBuyDetail";
	} 
	
	@GetMapping("/groupBuybuyerUpdate")
	public String buyerUpdate(
			@RequestParam int groupId,
			@RequestParam String buyListName,
			Model model) {
		List<buyDetail> lsiBean = gbService.findBuyDetailService(groupId);
		model.addAttribute("buyDetail", lsiBean);
		model.addAttribute("buyer", buyListName);
		return "groupBuy/buyerBuyDetail";
	} 
	
	@GetMapping("/groupBuybuyeratt")
	public String buyeratt(
			@RequestParam String buyer,
			Model model) {
		List<groupList> lsiBean = gbService.findGroupListNomalService(buyer);
		model.addAttribute("groupList", lsiBean);
		model.addAttribute("buyer", buyer);
		return "groupBuy/buyerAttttt";
	} 
	
	@GetMapping("/groupBuybuyerATTTTT")
	public String buyerATTTTT(
			@RequestParam int groupId,
			@RequestParam String buyer,
			Model model) {
		groupList glBean = gbService.findByGroupId(groupId);
		List<buyDetail> lsiBean = gbService.groupListAttService(glBean,buyer);
		model.addAttribute("buyDetail", lsiBean);
		model.addAttribute("buyer", buyer);
		
		return "groupBuy/buyerBuyDetail";
	} 
	
	@GetMapping("/groupBuybuyerCancel")
	public String buyerCancel(
			@RequestParam int groupId,
			@RequestParam String buyListName,
			Model model) {
		gbService.updateCancelSaveService(groupId);
		
		List<groupList> lglBean2 = gbService.findAllGroupListService();
		
		List<groupList> lglBean = gbService.findAllBuyListService(buyListName);
		model.addAttribute("buyListFindAll", lglBean);
		model.addAttribute("buyListName", buyListName);
		return "groupBuy/buyer";
	} 
	
	
	//buyer-------------------------------
	
	
}

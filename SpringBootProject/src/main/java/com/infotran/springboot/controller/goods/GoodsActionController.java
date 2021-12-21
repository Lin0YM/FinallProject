package com.infotran.springboot.controller.goods;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectSerializer;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.infotran.springboot.model.goodsbean.GoodsBean;
import com.infotran.springboot.model.goodsbean.MemberOrderListBean;
import com.infotran.springboot.model.member.Member;
import com.infotran.springboot.service.GoodsService;
import com.infotran.springboot.validate.CustomerValidator;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import ecpay.payment.integration.ecpayOperator.EcpayFunction;
import example.ExampleAllInOne;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@Controller
@SessionAttributes({"member3","goods","updategoods"})
public class GoodsActionController {
	
	GoodsService springGoodsService;
	
	ServletContext servletContext;
	
	Integer number =35000;
	
	@Autowired
	public GoodsActionController(GoodsService springGoodsService, ServletContext servletContext) {
		this.springGoodsService = springGoodsService;
		this.servletContext = servletContext;
	}
	
	
	
	@GetMapping("/goods/products/add")
	public String getAdddata(Model model) {
		GoodsBean gBean = new GoodsBean();
		model.addAttribute("newgood",gBean);
		return "jspfile/putgoods";
	}
	
	@PostMapping("/goods/products/add")
	public String addGoods(@ModelAttribute("newgood") GoodsBean gb ,
			RedirectAttributes attr,
			BindingResult result) {
		new CustomerValidator().validate(gb, result);
		if (result.hasErrors()) {
			return "jspfile/putgoods";
		}
		MultipartFile goodpic = gb.getGoodpic();
		String fileName=goodpic.getOriginalFilename();
		gb.setFileName(fileName);
		gb.setSumPrice(gb.getGoodsNum()*gb.getGoodsPrice());
		if(goodpic!=null && !goodpic.isEmpty()) {
			
			try {
				byte[] b=goodpic.getBytes();
				Blob blob=new SerialBlob(b);
				gb.setImageData(blob);
			} catch (IOException e) {
				
				e.printStackTrace();
			} catch (SerialException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
		GoodsBean goodsbean=springGoodsService.insert(gb);
		
			String ext=fileName.substring(fileName.lastIndexOf("."));
			String rootDirector= servletContext.getRealPath("/");
			
			try {
				File imgFile=new File(rootDirector,"imageFile");
				if(!imgFile.exists()) {
					imgFile.mkdirs();
				}
				File file=new File(imgFile,"goodsID_"+gb.getid()+ext);
				goodpic.transferTo(file);
			} catch (IllegalStateException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}

		attr.addFlashAttribute("newgood",goodsbean);
		return "redirect:/goods/goodspage";
	}
	
	@GetMapping("/goods/goodspage")
	public String goodById(Model model) {
		return "jspfile/goodspage";
	}
	
	
	@GetMapping("/goods/getPicture/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
	    String filePath = "/resources/images/NoImage.jpg";

	    byte[] media = null;
	    HttpHeaders headers = new HttpHeaders();
	    String filename = "";
	    int len = 0;
	    Optional<GoodsBean> beans = springGoodsService.goodById(id);
	    if (beans.isPresent()) {
	    	GoodsBean bean=beans.get();
	        Blob blob = bean.getImageData();
	        filename = bean.getFileName();
	        if (blob != null) {
	            try {
	                len = (int) blob.length();
	                media = blob.getBytes(1, len);
	            } catch (SQLException e) {
	                throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
	            }
	        } else {
	            media = toByteArray(filePath);
	            filename = filePath;
	        }
	    } else {
	        media = toByteArray(filePath);
	        filename = filePath;
	    }
	    headers.setCacheControl(CacheControl.noCache().getHeaderValue());
	    String mimeType = servletContext.getMimeType(filename); //image/jpeg,image/gif
	    MediaType mediaType = MediaType.valueOf(mimeType);
	    System.out.println("mediaType =" + mediaType);
	    headers.setContentType(mediaType);
	    ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
	    return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
	    byte[] b = null;
	    String realPath = servletContext.getRealPath(filepath);
	    try {
	        File file = new File(realPath);
	        long size = file.length();
	        b = new byte[(int) size];
	        InputStream fis = servletContext.getResourceAsStream(filepath);
	        fis.read(b);
	    } catch (FileNotFoundException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return b;
	}
	
	@GetMapping("/goods/goodslist")
	public String list(Model model) {
		Member loginmemberbean  = (Member)model.getAttribute("member3");
		String username = loginmemberbean.getUsername();
		System.out.println(username);
		List<GoodsBean> goodslist =springGoodsService.findUploadByMember(username);
		model.addAttribute("goodsbymember",goodslist);   
		return "jspfile/goodsfindall";
	}
	
	
	
	@GetMapping("/goods/update")
	public String goodById(@RequestParam("id") Integer id,Model model) {
		Optional<GoodsBean> goodbeans=springGoodsService.goodById(id);
		if(goodbeans.isPresent()) {
			GoodsBean goodbean=goodbeans.get();
			model.addAttribute("updategoods",goodbean);
			return "jspfile/goodspriceupdatepags";
		}else {
			throw new RuntimeException("不存在");
		}
	}
	
	@PostMapping("/goods/goodsupdate")
	public String updategood(@ModelAttribute("updategoods") GoodsBean bean,Model model) {
		Integer sumprice=bean.getGoodsNum()*bean.getGoodsPrice();
		bean.setSumPrice(sumprice);
		springGoodsService.updategood(bean);
		Member membean =(Member)model.getAttribute("member3");
		String username=membean.getUsername();
		List<GoodsBean> goods=springGoodsService.findUploadByMember(username);
		model.addAttribute("goodsbymember",goods);
		return "jspfile/goodsfindall";
	}
	
	@GetMapping("/goods/delete")
	public String deletegood(@RequestParam("id") Integer id,Model model) {
		springGoodsService.deletegood(id);
		Member membean =(Member)model.getAttribute("member3");
		String username=membean.getUsername();
		List<GoodsBean> goods=springGoodsService.findUploadByMember(username);
		model.addAttribute("goodsbymember",goods);
		return "jspfile/goodsfindall";
		
	}
	
	
	
	//==================Restful CRUD==============================
	
	@PostMapping("/goods/GoodsBean")@ResponseBody
	public String goodsAddAction(
			@RequestParam(name="goodsName") String goodsName,
			@RequestParam(name = "goodsPrice") Integer goodsPrice,
			@RequestParam(name = "goodsNum") Integer goodsNum,
			@RequestParam(name = "goodsInt") String goodsInt) {
		Integer sumprice= goodsNum*goodsPrice;
		GoodsBean gb = new GoodsBean();
		gb.setGoodsName(goodsName);
		gb.setGoodsPrice(goodsPrice);
		gb.setGoodsNum(goodsNum);
		gb.setGoodsInt(goodsInt);
		springGoodsService.insert(gb);
		return "Insert OK";
		
	}
	@GetMapping("/goods/GoodsBean/{goodsID}")@ResponseBody
	public String goodsQueryAction(
			@PathVariable("goodsID") Integer goodsid) {
		Optional<GoodsBean> gbs =springGoodsService.goodById(goodsid);
		if(gbs.isPresent()) {
			GoodsBean gb=gbs.get();
			return gb.getid()+" "+gb.getGoodsName()+" "+gb.getGoodsNum()+" "+gb.getGoodsPrice()+" "+gb.getGoodsInt();
		}else {
			throw new RuntimeException("不存在");
		}
	}
	
	@PutMapping("/goods/GoodsBean/{goodsID}")@ResponseBody
	public String goodsUpdateAction(
			@PathVariable("goodsID") Integer goodsid,
			@RequestParam(name="goodsName") String goodsName,
			@RequestParam(name = "goodsPrice") Integer goodsPrice,
			@RequestParam(name = "goodsNum") Integer goodsNum,
			@RequestParam(name = "goodsInt") String goodsInt) {
		Integer sumprice=goodsNum*goodsPrice;
		GoodsBean gb =new GoodsBean();
		gb.setid(goodsid);
		gb.setGoodsName(goodsName);
		gb.setGoodsPrice(goodsPrice);
		gb.setGoodsNum(goodsNum);
		gb.setGoodsInt(goodsInt);
		gb.setSumPrice(sumprice);
		springGoodsService.update(gb);
		return "Update OK";
	}
	
	@DeleteMapping("/goods/GoodsBean/{goodsID}")@ResponseBody
	public String deletegoods(
			@PathVariable("goodsID") Integer goodsid,
			@RequestParam(name="goodsName") String goodsName,
			@RequestParam(name = "goodsPrice") Integer goodsPrice,
			@RequestParam(name = "goodsNum") Integer goodsNum,
			@RequestParam(name = "goodsInt") String goodsInt) {
		GoodsBean gb = new GoodsBean();
		gb.setid(goodsid);
		gb.setGoodsName(goodsName);
		gb.setGoodsPrice(goodsPrice);
		gb.setGoodsNum(goodsNum);
		gb.setGoodsInt(goodsInt);
		springGoodsService.delete(gb);
		return "Delete OK";
	}
	
	//============================Restful==查詢by商品Id==========================
	
	
	
	@GetMapping("/goods/checkg")
	public String Check() {
		return "jspfile/putgoods2ajax";
		
	}
	
	
	@RequestMapping(value ="/goods/checkgoods" ,produces = "text/plain;charset=utf-8" ,method = RequestMethod.POST)@ResponseBody
	public String checkGoods(
			@RequestBody GoodsBean gb){
		Optional<GoodsBean> gbBeans = springGoodsService.checkgoods(gb);
		if(gbBeans.isPresent()) {
			GoodsBean gbBean=gbBeans.get();
			return "<p>goodsName:"+gbBean.getGoodsName()+"</p><br/>"+"<p>goodsType:"+gbBean.getGoodsType()+"</p><br/>"+"<p>goodsNum:"+gbBean.getGoodsNum()+"</p><br/>"+"<p>goodsSumPrice:"+gbBean.getSumPrice()+"</p>";
		}else {
			throw new RuntimeException("不存在");
		}
	}
	
	@GetMapping("/goods/findbytype/{lifeItem}")
	public String findbytype(@PathVariable("lifeItem") String type,Model model) {
		List<GoodsBean> findtype=springGoodsService.findByGoodsType(type);
		model.addAttribute("findbytype",findtype);
		return "jspfile/findgoodsbytypelife";
		
	}
	
	//============================賣家評價功能==============================
	
	@GetMapping("/goods/shopcartohistory/{id}")
	public String scope(@PathVariable("id") Integer id,Model model) {
		
		Optional<MemberOrderListBean> scopebeans=springGoodsService.scopeById(id);
		if(scopebeans.isPresent()) {
			MemberOrderListBean confirmscopebean=scopebeans.get();
			confirmscopebean.setGoodstransationstatus("評論完成");
			springGoodsService.confirmorcancel(confirmscopebean);
			model.addAttribute("confirmscope",confirmscopebean);
		}
		return "jspfile/writegoodsscope";
	}
	
	@PostMapping("/goods/scopelists")
	public String findAllScopelist(@RequestParam("id") Integer id , @RequestParam("memberscope") String membersocpe,
			Model model) {
		Optional<MemberOrderListBean> orderlistbean =springGoodsService.scopeById(id);
		if(orderlistbean.isPresent()) {
			MemberOrderListBean goodsscopebean=orderlistbean.get();
			goodsscopebean.setGoodsscope(membersocpe);
			springGoodsService.confirmorcancel(goodsscopebean);
		}
		List<MemberOrderListBean> listbeans=springGoodsService.findAllScope();
		List<MemberOrderListBean> newlistbeans=new ArrayList<>();
		for(MemberOrderListBean list:listbeans) {
			if(list.getGoodsscope()!=null) {
				newlistbeans.add(list);
			}
		}
		model.addAttribute("scopelist",newlistbeans);
		
		return "jspfile/goodsscopelist";
		
	}
	
	@GetMapping("/goods/findscopelists")
	public String findscopelists(Model model) {
		Member memberbean =(Member)model.getAttribute("member3");
		List<MemberOrderListBean> listbeans=springGoodsService.findAllScope();
		List<MemberOrderListBean> newlistbeans=new ArrayList<>();
		for(MemberOrderListBean list:listbeans) {
			if(list.getGoodsscope()!=null) {
				if((list.getGoodsuploadusername()).equals(memberbean.getUsername())) {
				newlistbeans.add(list);
				}
			}
		}
		model.addAttribute("scopelist",newlistbeans);
		
		return "jspfile/goodsscopelist";
		
	}
	
	//==========================================管理員查詢上架商品列表==============================
	
	@GetMapping("/addminfind/goodslist")
	public String adminfindlist(Model model) {
		List<GoodsBean> membergoodslist =springGoodsService.findAllMemberUpload();
		model.addAttribute("goodsbymember",membergoodslist);   
		return "jspfile/adminpage1";
	}
	
	@GetMapping("/admin/uploadgoodsupdate")
	public String changegoodsinfo(@RequestParam("id") Integer number,Model model) {
		Optional<GoodsBean> goodbeans=springGoodsService.goodById(number);
		if(goodbeans.isPresent()) {
			GoodsBean goodbean=goodbeans.get();
			model.addAttribute("adminimprovegoods",goodbean);
			return "jspfile/adminpage1-1";
		}else {
			throw new RuntimeException("不存在");
		}
	}
	
	@PostMapping("/admin/changeuploadgoodsinfo")
	public String changegoodsinfotoo(@RequestParam("id") Integer number,
			@RequestParam("goodsName") String Name,
			@RequestParam("goodsNum") Integer Num,
			@RequestParam("goodsPrice") Integer price,
			@RequestParam("uploadMember") String Member,
			@RequestParam("goodsInt") String Intro,
			@RequestParam("goodsType") String Type,
			@RequestParam("goodpic") MultipartFile goodpic,
			Model model) {
		Optional<GoodsBean> goodbeans=springGoodsService.goodById(number);
		if(goodbeans.isPresent()) {
			GoodsBean goodbean=goodbeans.get();
			
			MultipartFile goodpicpart = goodpic;
			String fileName=goodpicpart.getOriginalFilename();
			goodbean.setGoodsName(Name);
			goodbean.setGoodsNum(Num);
			goodbean.setGoodsPrice(price);
			goodbean.setUploadMember(Member);
			goodbean.setGoodsInt(Intro);
			goodbean.setGoodsType(Type);
			goodbean.setFileName(fileName);
			goodbean.setSumPrice(Num*price);
			if(goodpicpart!=null && !goodpicpart.isEmpty()) {
				
				try {
					byte[] b=goodpicpart.getBytes();
					Blob blob=new SerialBlob(b);
					goodbean.setImageData(blob);
				} catch (IOException e) {
					
					e.printStackTrace();
				} catch (SerialException e) {
					
					e.printStackTrace();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
			
			springGoodsService.insert(goodbean);
			
			String ext=fileName.substring(fileName.lastIndexOf("."));
			String rootDirector= servletContext.getRealPath("/");
			
			try {
				File imgFile=new File(rootDirector,"imageFile");
				if(!imgFile.exists()) {
					imgFile.mkdirs();
				}
				File file=new File(imgFile,"goodsID_"+goodbean.getid()+ext);
				goodpicpart.transferTo(file);
			} catch (IllegalStateException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}

			model.addAttribute("adminimprovegoods",goodbean);
			return "redirect:/addminfind/goodslist";
		}else {
			throw new RuntimeException("不存在");
		}
	}
	
	@GetMapping("/admin/uploadgoodsdelete")
	public String adminDelete(@RequestParam("id") Integer num) {
		springGoodsService.deletegood(num);
		return "redirect:/addminfind/goodslist";
		
	}
	
	//==========================================管理員查詢下訂商品列表==============================
	
	@GetMapping("/addminfind/orderrecord")
	public String findAllOrderList(Model model) {
		List<MemberOrderListBean> ordergoodslist = springGoodsService.findAllgoodsorderlist();
		model.addAttribute("ordergoodslist",ordergoodslist);
		return "jspfile/adminpage2";
	}
	
	@GetMapping("/admin/ordergoodsupdate")
	public String changeOrderRecord(@RequestParam("id") Integer num,Model model) {
		Optional<MemberOrderListBean> ordergoodslist = springGoodsService.changeOrderGoodsById(num);
		if(ordergoodslist.isPresent()) {
			MemberOrderListBean sindleorderbean=ordergoodslist.get();
		model.addAttribute("changeordergoodslist",sindleorderbean);
		return "jspfile/adminpage2-1";
		}else {
			throw new RuntimeException("不存在");
		}
	
	}
	
	@GetMapping("/admin/ordergoodsupdateinfo")
	public String changeOrderRecordinfo(@RequestParam("id") Integer num,
			@RequestParam("orderitemtype") String orderitemtype,
			@RequestParam("orderitemname") String orderitemname,
			@RequestParam("orderitemtotalcount") Integer orderitemtotalcount,
			@RequestParam("orderitemsingleprice") Integer orderitemsingleprice,
			@RequestParam("orderitemfinishdate") String orderitemfinishdate,
			@RequestParam("goodsorderType") String goodsorderType,
			@RequestParam("goodsuploadusername") String goodsuploadusername,
			@RequestParam("orderitemusername") String orderitemusername,
			@RequestParam("orderuseraddress") String orderuseraddress,
			Model model) {
		Optional<MemberOrderListBean> ordergoodslist = springGoodsService.changeOrderGoodsById(num);
		if(ordergoodslist.isPresent()) {
			MemberOrderListBean sindleorderbeanrecord=ordergoodslist.get();
			sindleorderbeanrecord.setOrderitemtype(orderitemtype);
			sindleorderbeanrecord.setOrderitemname(orderitemname);
			sindleorderbeanrecord.setOrderitemtotalcount(orderitemtotalcount);
			sindleorderbeanrecord.setOrderitemsingleprice(orderitemsingleprice);
			Integer singleprice=sindleorderbeanrecord.getOrderitemsingleprice();
			Integer goodstotalnum=sindleorderbeanrecord.getOrderitemtotalcount();
			sindleorderbeanrecord.setOrderitemfinishdate(orderitemfinishdate);
			sindleorderbeanrecord.setGoodstransationstatus(goodsorderType);
			sindleorderbeanrecord.setGoodsuploadusername(goodsuploadusername);
			sindleorderbeanrecord.setOrderitemusername(orderitemusername);
			sindleorderbeanrecord.setOrderuseraddress(orderuseraddress);
			sindleorderbeanrecord.setOrderitemsumprice(singleprice*goodstotalnum);
			springGoodsService.confirmorcancel(sindleorderbeanrecord);
		return "redirect:/addminfind/orderrecord";
		}else {
			throw new RuntimeException("不存在");
		}
	
	}
	
	
	@GetMapping("/admin/ordergoodsdelete")
	public String adminOrderRecordDelete(@RequestParam("id") Integer num) {
		springGoodsService.deleteOrderRecord(num);
		return "redirect:/addminfind/orderrecord";
	} 
	
	
	//==========================================管理員查詢評論專區==============================
	
	@GetMapping("/addminfind/toscopepage")
	public String findAllOrderScope(Model model) {
		List<MemberOrderListBean> ordergoodslist = springGoodsService.findAllgoodsorderlist();
		List<MemberOrderListBean> catchnewgoodslist =new ArrayList<>();
		for(MemberOrderListBean singlebean:ordergoodslist) {
			if(singlebean.getGoodsscope() !=null) {
				catchnewgoodslist.add(singlebean);
			}
		}
		model.addAttribute("ordergoodslist",catchnewgoodslist);
		return "jspfile/adminpage3";
	}
	
	
	@GetMapping("/admin/scopeupdate")
	public String changeOrderScope(@RequestParam("id") Integer num,Model model) {
		Optional<MemberOrderListBean> ordergoodslist = springGoodsService.changeOrderGoodsById(num);
		if(ordergoodslist.isPresent()) {
			MemberOrderListBean sindleorderbean=ordergoodslist.get();
		model.addAttribute("changeordergoodslist",sindleorderbean);
		return "jspfile/adminpage3-1";
		}else {
			throw new RuntimeException("不存在");
		}
	
	}
	
	@PostMapping("/admin/scopeupdate")
	public String changeOrderScopetoo(@RequestParam("orderlistid") Integer num,
			@RequestParam("orderitemtype") String orderitemtype,
			@RequestParam("orderitemname") String orderitemname,
			@RequestParam("orderitemfinishdate") String orderitemfinishdate,
			@RequestParam("orderitemusername") String orderitemusername,
			@RequestParam("goodsscope") String goodsscope,
			Model model) {
		Optional<MemberOrderListBean> ordergoodslist = springGoodsService.changeOrderGoodsById(num);
		if(ordergoodslist.isPresent()) {
			MemberOrderListBean sindleorderbean=ordergoodslist.get();
			sindleorderbean.setGoodsscope(goodsscope);
			springGoodsService.confirmorcancel(sindleorderbean);
		model.addAttribute("changeordergoodslist",sindleorderbean);
		return "redirect:/addminfind/toscopepage";
		}else {
			throw new RuntimeException("不存在");
		}
	
	}
	
	@GetMapping("/admin/scopedelete")
	public String deleteOrderScope(@RequestParam("id") Integer num) {
		Optional<MemberOrderListBean> ordergoodslist = springGoodsService.changeOrderGoodsById(num);
		if(ordergoodslist.isPresent()) {
			MemberOrderListBean sindleorderbean=ordergoodslist.get();
			sindleorderbean.setGoodsscope(null);
		springGoodsService.confirmorcancel(sindleorderbean);
		return "redirect:/addminfind/toscopepage";
	}else {
		throw new RuntimeException("不存在");
		}
	}
	
	//===========================================測試綠界===================================
	

	@PostMapping("/greentestx/sends")@ResponseBody
	public String greentest(@RequestBody String jsonstring,RedirectAttributes attr) {
		
		JSONObject json = JSONObject.fromObject(jsonstring);
		String CustomField1=json.getString("CustomField1");
		String MerchantTradeNo=json.getString("MerchantTradeNo");
		String MerchantTradeDate=json.getString("MerchantTradeDate");
		String TotalAmount=json.getString("TotalAmount"); //aio套版用抓string 非綠界指定之int
		String TradeDesc=json.getString("TradeDesc");
		String ItemName=json.getString("ItemName");
		String ReturnURL=json.getString("ReturnURL");
		
		int numberNO=Integer.parseInt(MerchantTradeNo);
		
		Optional<MemberOrderListBean> needchangestatusbeans=springGoodsService.changeOrderGoodsById(numberNO);
		if(needchangestatusbeans.isPresent()) {
			MemberOrderListBean getneedchangestatusbean=needchangestatusbeans.get();
			getneedchangestatusbean.setGoodstransationstatus("已付款");
			springGoodsService.confirmorcancel(getneedchangestatusbean);
		}
	
		AllInOne all =new AllInOne("");
		number++;
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantTradeNo(MerchantTradeNo+number);
		obj.setMerchantTradeDate(MerchantTradeDate);
		obj.setTotalAmount(TotalAmount);
		obj.setTradeDesc(TradeDesc);
		obj.setItemName(ItemName);
		obj.setReturnURL(ReturnURL);
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		obj.setCustomField1(CustomField1);
		obj.setClientBackURL("http://localhost:9090/springapp/goods/ordergoodslist");
		String form = all.aioCheckOut(obj, null);
		System.out.println(form);
		return form;

		

	}

	@PostMapping("/goods/goodslist")
	public String greentestlist(Model model) {
		Member loginmemberbean  = (Member)model.getAttribute("member3");
		String username = loginmemberbean.getUsername();
		System.out.println(username);
		List<GoodsBean> goodslist =springGoodsService.findUploadByMember(username);
		model.addAttribute("goodsbymember",goodslist);   
		return "jspfile/goodsfindall";
	}
	
}

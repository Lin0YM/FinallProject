package com.infotran.springboot.controller;

import java.io.File;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.infotran.springboot.model.member.Member;
import com.infotran.springboot.model.wishpool.WishPoolBean;
import com.infotran.springboot.model.wishpool.memberbean;
import com.infotran.springboot.service.WishPoolService;
import com.infotran.springboot.validate.WishPoolValidator;

@Controller
@SessionAttributes({ "wishpool", "member3", "wishpoolBean" })
public class WishPoolFunctionController {

	WishPoolService wishPoolService;

	ServletContext servletContext;

	static SimpleDateFormat dateformatAll = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Autowired
	public WishPoolFunctionController(WishPoolService wishPoolService, ServletContext servletContext) {
		this.wishPoolService = wishPoolService;
		this.servletContext = servletContext;
	}

	@ModelAttribute("wishpoolBean")
	public WishPoolBean m1(@RequestParam(required = false) Integer id) {
		WishPoolBean bean = null;
		if (id == null) {
			bean = new WishPoolBean();
		} else {
			Optional<WishPoolBean> optional = wishPoolService.findById(id);
			if (optional.isPresent()) {
				bean = optional.get();
				System.out.println("in @ModelAttribute, bean=" + bean);
			}
		}
		return bean;
	}

	// ==================================//

	// 預覽功能
	@GetMapping("/view/{id}")
	public String view(Model model, @PathVariable(required = false) Integer id) {
		if (id == null) {
			throw new RuntimeException("請提供編號");
		}
		Optional<WishPoolBean> optional = wishPoolService.findById(id);
		if (optional.isPresent()) {
			WishPoolBean bean = optional.get();
//			model.addAttribute("wishpool",bean);
			model.addAttribute("wishpoolBean", bean);
		}
		List<WishPoolBean> bean = wishPoolService.getWishPools();
		model.addAttribute("wishpool", bean);
		return "wishpool/viewwish";
	}

	// 進入管理員預覽功能
	@GetMapping("/admin")
	public String shoWishPool(Model model) {
		List<WishPoolBean> bean = wishPoolService.getWishPools();
		model.addAttribute("wishpool", bean);
		return "wishpool/admin/admin";
	}

	// session取值8
	@PostMapping(path = "/view/vote", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String vote(@RequestBody WishPoolBean bb, Model model) {
		Member member = (Member) model.getAttribute("member3");
		WishPoolBean bean = (WishPoolBean) model.getAttribute("wishpoolBean");
		System.out.println("55" + member);
		System.out.println("99" + bean);
//		if(member.getUsername())
		if ((member.getUsername()).equals(bean.getCreator())) {
			// alert顯示創建者不行投票
		} else {
			int count = 1;
			int supporting = bean.getSupportting();
			if (count == 1) { // 判斷是否投過票
				supporting += count;
				bean.setSupportting(supporting);
			} else {
				supporting -= count;
				bean.setSupportting(supporting);
			}
		}

		wishPoolService.save(bean);
		model.addAttribute("wishpool", bean);
		return "投票數:" + bean.getSupportting();
	}

	@GetMapping("/allsearchByMemberCRUD")
	public String showWishPool(Model model) {
		List<WishPoolBean> bean = wishPoolService.getWishPools();
		model.addAttribute("wishpool", bean);
		return "wishpool/memberCRUD";
	}

	@PostMapping({ "/adminwish", "/adminupdate/adminwish" })
	public String adminprocessAddNewProductForm(@ModelAttribute("wishpoolBean") WishPoolBean bb, BindingResult result,
			Model model) {
		new WishPoolValidator().validate(bb, result);
		if (result.hasErrors()) {
			return "wishpool/wish";
		}
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}

		MultipartFile productImage = bb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		bb.setFileName(originalFilename);

		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		if (bb.getSupportting() == null || bb.getSupportting() <= 0) {
			bb.setSupportting(0);
		}
		if (bb.getWishpoolId() == null) {
			try {
				Timestamp ts = new Timestamp(System.currentTimeMillis());
				String str = dateformatAll.format(ts);
				Date date;
				date = dateformatAll.parse(str);
				bb.setCreatetime(date);

				Calendar c = Calendar.getInstance();
				c.setTime(date);
				c.add(Calendar.DATE, 7);
				date = c.getTime();

				bb.setStoptime(date);

				Member member = (Member) model.getAttribute("member3");

				memberbean mbbean = new memberbean();
				mbbean.setUsername(member.getUsername());
				mbbean.setwishpool(bb);
				Set<memberbean> smbbean = new LinkedHashSet<memberbean>();
				smbbean.add(mbbean);
				bb.setMemberBeans(smbbean);

				bb.setCreator(member.getUsername());
				model.addAttribute("wishpool", bb);

			} catch (Exception e) {
				e.printStackTrace();
			}
//		}else {

		}

		// ------------------------------------
		wishPoolService.save(bb);
		// ------------------------------------
		String ext = originalFilename.substring(originalFilename.lastIndexOf(".")); // .png
		String rootDirectory = servletContext.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, "WishPoolBean_" + bb.getWishpoolId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		List<WishPoolBean> bean = wishPoolService.getWishPools();
		model.addAttribute("wishpool", bean);
		return "wishpool/admin/admin";
	}

	@GetMapping("/adminupdate/{id}")
	public String adminupdateById(Model model, @PathVariable(required = false) Integer id) {
		if (id == null) {
			throw new RuntimeException("請提供編號");
		}
		Optional<WishPoolBean> optional = wishPoolService.findById(id);
		if (optional.isPresent()) {
			WishPoolBean bean = optional.get();
			System.out.println("++++++++" + bean);
			model.addAttribute("wishpoolBean", bean);
		}
		return "wishpool/admin/wish";
	}

	@GetMapping("/admindelete/{id}")
	public String admindelete(Model model, @PathVariable(required = false) Integer id) {
		if (id == null) {
			throw new RuntimeException("請求未提供客戶Id");
		}
		System.out.println(id);
		Optional<WishPoolBean> optional = wishPoolService.findById(id);
		if (optional.isPresent()) {
			wishPoolService.deleteWishPoolByPrimaryKey(id);
		} else {
			throw new RuntimeException("客戶不存在，Id=" + id);
		}
		return "redirect:/admin";
	}

	@GetMapping("/adminview/{id}")
	public String adminview(Model model, @PathVariable(required = false) Integer id) {
		if (id == null) {
			throw new RuntimeException("請提供編號");
		}
		Optional<WishPoolBean> optional = wishPoolService.findById(id);
		if (optional.isPresent()) {
			WishPoolBean bean = optional.get();
//			model.addAttribute("wishpool",bean);
			model.addAttribute("wishpoolBean", bean);
		}
		return "wishpool/admin/view";
	}
}

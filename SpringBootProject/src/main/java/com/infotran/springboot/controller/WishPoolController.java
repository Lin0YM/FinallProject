package com.infotran.springboot.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import com.infotran.springboot.model.member.Member;
import com.infotran.springboot.model.wishpool.WishPoolBean;
import com.infotran.springboot.model.wishpool.memberbean;
import com.infotran.springboot.service.WishPoolService;
import com.infotran.springboot.validate.WishPoolValidator;

@Controller
@SessionAttributes({ "member3", "wishpool" })
public class WishPoolController {

	WishPoolService wishPoolService;

	ServletContext servletContext;

	static SimpleDateFormat dateformatAll = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Autowired
	public WishPoolController(WishPoolService wishPoolService, ServletContext servletContext) {
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

	// wishpool.index.controller
	@GetMapping("/wishindex")
	public String index(Model model) {
		Member member = (Member) model.getAttribute("member3");
		if (member != null) {
			List<WishPoolBean> bean = wishPoolService.getWishPools();
			model.addAttribute("wishpool", bean);
//			WishPoolBean bean = new WishPoolBean();
//			bean.setFileName("wishpool.jpg");
//			model.addAttribute("wishpool",bean);
			return "wishpool/index"; // /WEB-INF/views/index.jsp
		}
		return "redirect:/"; // /WEB-INF/views/index.jsp
	}

	@GetMapping("/wish")
	public String wish(Model model) {
//		WishPoolBean bean = new WishPoolBean();
//		model.addAttribute("wishpoolBean",bean);
		return "wishpool/wish";
	}

	@GetMapping("/watchpool")
	public String watchpool() {
		return "wishpool/watchpool";
	}

	@GetMapping("/allviews")
	public String allviews() {
		return "wishpool/allviews";
	}

	@GetMapping("/view")
	public String view(Model model) {
		List<WishPoolBean> bean = wishPoolService.getWishPools();
		model.addAttribute("wishpool", bean);
		return "wishpool/admin/viewwish";
	}

	@GetMapping("/adminwish")
	public String viewtest(Model model) {
		WishPoolBean bean = null;
		model.addAttribute("wishpool", bean);
		return "wishpool/admin/wish";
	}

	@GetMapping("/adminview")
	public String sss() {
		return "wishpool/admin/view";
	}

	// ==================================//

	@PostMapping({ "/wish", "/update/wish" })
	public String processAddNewProductForm(@ModelAttribute("wishpoolBean") WishPoolBean bb, BindingResult result,
			Model model) {
		new WishPoolValidator().validate(bb, result);
		if (result.hasErrors()) {
			return "wishpool/wish";
		}
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		Member member = (Member) model.getAttribute("member3");
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
		bb.setCreator(member.getUsername());
		model.addAttribute("wishpool", bb);

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
		return "wishpool/InsertWishPoolSuccess";
	}

	@GetMapping("/update/{id}")
	public String updateById(Model model, @PathVariable(required = false) Integer id) {
		if (id == null) {
			throw new RuntimeException("請提供編號");
		}
		Optional<WishPoolBean> optional = wishPoolService.findById(id);
		if (optional.isPresent()) {
			WishPoolBean bean = optional.get();
			model.addAttribute("wishpoolBean", bean);
		}
		return "wishpool/wish";
	}

	@GetMapping("/delete/{id}")
	public String delete(Model model, @PathVariable(required = false) Integer id) {
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
		return "redirect:/allsearch";
	}

	@GetMapping("/allsearch")
	public String showWishPool(Model model) {
		List<WishPoolBean> bean = wishPoolService.getWishPools();
		model.addAttribute("wishpool", bean);
		return "wishpool/allviews";
	}

	@GetMapping("/searchbysort/{sort}")
	public String showBySort(Model model, @PathVariable(required = false) String sort) {
		List<WishPoolBean> bean = wishPoolService.findBySort(sort);
		model.addAttribute("wishpool", bean);
		return "wishpool/membermanage";
	}

	// ==================================//

	@GetMapping("/getPicture/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "/WEB-INF/views/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		WishPoolBean bean = wishPoolService.getById(id);
		if (bean != null) {
			Blob blob = bean.getCoverImage();
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
		String mimeType = servletContext.getMimeType(filename); // images/jpeg 、gif
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	@GetMapping("/getPictureByPC/{fileName}")
	public ResponseEntity<byte[]> getPictureByPC(HttpServletResponse resp, @PathVariable String fileName) {
		String filePath = "/WEB-INF/views/images/" + fileName;

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		media = toByteArray(filePath);

		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = servletContext.getMimeType(filePath); // images/jpeg 、gif
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

	@InitBinder
	public void initBinder(WebDataBinder binder, WebRequest request) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		CustomDateEditor ce = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, ce);
	}

}

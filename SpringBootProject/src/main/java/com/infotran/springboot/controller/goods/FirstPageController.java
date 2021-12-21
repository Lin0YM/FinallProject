package com.infotran.springboot.controller.goods;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.infotran.springboot.model.goodsbean.GoodsBean;
import com.infotran.springboot.model.goodsbean.ImageBean;
import com.infotran.springboot.service.GoodsService;
import com.infotran.springboot.validate.CustomerValidator;



@Controller
@SessionAttributes("goods")
public class FirstPageController {
	
	GoodsService springGoodsService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	public FirstPageController(GoodsService springGoodsService) {
		this.springGoodsService = springGoodsService;
	}
	
	
	@GetMapping("/member/{name}")
	public String membergoodspagelogin(@PathVariable("name") String username) {
			return "redirect:/goods/home";	
	}

	@GetMapping({"/goods/welcome","/goods/home"})
	public String welcome(Model model) {
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
	
	@GetMapping("/member/")
	public String membergoodspageloginfail() {
			return "/memberSystem/login";	
	}
	
	
	//================================管理員登入頁面=================
	@GetMapping("/admin/xxx")
	public String adminlogin() {
		return "jspfile/adminpage";
		
	}
	

	
	
	//===============================會員廣告顯示==================
	
	//================================存JPG or GIF圖片到資料庫 ================
	@PostMapping("/other/productspic/add")
	public String addpictures(@RequestParam("uploadpic") MultipartFile goodpic 
			) {
		
		ImageBean ib = new ImageBean();
		
		String fileName=goodpic.getOriginalFilename();
		ib.setFileName(fileName);
		if(goodpic!=null && !goodpic.isEmpty()) {
			
			try {
				byte[] b=goodpic.getBytes();
				Blob blob=new SerialBlob(b);
				ib.setImageStream(blob);
			} catch (IOException e) {
				
				e.printStackTrace();
			} catch (SerialException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
		ImageBean imgb=springGoodsService.addimg(ib);
		return "jspfile/adminpage";
		
		
	
	}
	

	
		//================================從資料庫取JPG or GIF圖片到頁面顯示==============
		
		@GetMapping("/other/Picture/{id}")
		public ResponseEntity<byte[]> otherGetPicture(HttpServletResponse resp, @PathVariable Integer id) {
		    String filePath = "/resources/images/NoImage.jpg";

		    byte[] media = null;
		    HttpHeaders headers = new HttpHeaders();
		    String filename = "";
		    int len = 0;
		    Optional<ImageBean> beans = springGoodsService.getPictureById(id);
		    if (beans.isPresent()) {
		    	ImageBean bean=beans.get();
		        Blob blob = bean.getImageStream();
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
	

	
	
	
}

package com.infotran.springboot.controller.forum;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.infotran.springboot.model.forum.Forum;
import com.infotran.springboot.model.member.Member;
import com.infotran.springboot.service.ForumService;


@SessionAttributes("member3")
@Controller
public class AdminForumController {

	@Autowired
	private ForumService forumService;
	@Autowired
	ServletContext servletContext;
	
	// 展示員工清單

	@GetMapping("/adminforum") // JSP對應路徑互叫這邊的方法用
	public String viewHomePage(Model model) { // Model model 是Spring boot用來存或取暫存空間資料的介面
		model.addAttribute("listForum", forumService.getAllForum()); // addAttribute<--暫存空間可存資料數據，"listEmployees"定義暫
																		// 存空間名稱，用於抓取用，呼叫介面(Servie)也可以改其他形式呼叫，
																		// 透過@autowired抓取Service請Dao做事情。
		return "forum/adminforum";
		// 導引至forum資料夾的forum.jsp，因為spring.mvc.view.prefix: /WEB-INF/views/
		// 最後有加"/"，所以這裡路徑最前面不用加"/"，後面spring.mvc.view.suffix: .jsp，有加.jsp所以也不用加".jsp"

		// 從header.jsp 標籤 <a href="<c:url value='/forum'
		// />連結到@GetMapping("/forum")使用方法取得值之後，return "forum/forum";
		// 回傳至forum.jsp，放入值顯示前端

	}

//
//	@GetMapping("/forum/showNewForumForm")
//	public String showNewForumForm(Model model) {
//		Member member3  = (Member)model.getAttribute("member3"); //取暫存區
//		System.out.println(member3);
//		
//		if(member3 == null) {
//			return "memberSystem/login";
//		}else {			
//		Forum forum = new Forum();
//		model.addAttribute("forum", forum); // 創一個forum空的Bean(空白表單)位置準備塞東西，創出空白表單
//		return "forum/new_forum"; // 導引至forum資料夾的new_forum.jsp
//	}
//	}
//
	@PostMapping("/adminforum/saveForumAdmin") //@PostMapping 表單傳送不會帶網址列?後面的東西 通常是用在帳號密碼
	public String saveForumForAdmin(@ModelAttribute("forum") Forum forum) { // 把@ModelAttribute("forum")填寫的資料傳到new_forum，再傳到Forum
																	// forum創出空間
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String date2 =sdf.format(date);
		forum.setLastdate(date2);
		
		forumService.savaForum(forum);
		return "redirect:/adminforum"; // 要導到的網頁路徑，因為/springapp，最後沒添加/，所以redirect引導路徑須加上/

	}

	@GetMapping("/adminforum/adminUpdate")
	public String showFormForUpdateForAdmin(@RequestParam(value = "id") long id, Model model) { // @PathVariable(value =
																						// "id")抓值抓字串放入，a標籤
																						// @RequestParam除了抓前端input
																						// name名稱值以外，如果是抓<a>，則是?後面ID的值
		Member member3  = (Member)model.getAttribute("member3"); //取暫存區
		System.out.println(member3);
		
		if(member3 == null) {
			return "memberSystem/login";
		}else {
	
		Forum forum = forumService.getForumById(id);

		model.addAttribute("forum", forum);
		return "forum/adminupdate_forum";
	}
	}

	
//	@PostMapping("/adminforum/adminUpdate")
//	public String FormForUpdateAdmin(@ModelAttribute("forum") Forum forum) { // 把@ModelAttribute("forum")填寫的資料傳到new_forum，再傳到Forum
//																	// forum創出空間
//		// save employee to database
//		Date lastDate = new Date();
//		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		
//		String lastDate2 =sdf2.format(lastDate);
//		forum.setLastdate(lastDate2);
//					
//		forumService.savaForum(forum);
//		
//		return "redirect:/adminforum";}
	
//	
//	
	@GetMapping("/adminforum/admindeleteForum")
	public String deleteForum(@RequestParam(value = "id") long id) {
		// 呼叫刪除Forum方法
		this.forumService.deleteForumById(id);
		return "redirect:/adminforum";
	}

	@GetMapping("/forum/showFormArticleAdmin") // JSP對應路徑呼叫這邊的方法用
	public String showFormArticleAdmin(@RequestParam(value = "id") long id, Model model) { 
		model.addAttribute("ForumById", forumService.getForumById(id));
		Forum forum = forumService.getForumById(id);
		
		Long count = forum.getCount();		 	
		 count++;		   
		  forum.setCount(count);
		  forumService.savaForum(forum);  
		  
		  model.addAttribute("ForumById",forum);
//		  model.addAttribute("ReplyById",reply);
		
		return "forum/adminarticle";
		// 從forum.jsp 標籤 <c:url value='/forum/showFormArticle?id=${theme.id}連結到@GetMapping("/forum/showFormArticle")使用方
		// 法取得值之後，return "forum/article"; 回傳至article.jsp，放入值顯示前端
	}

	}
	



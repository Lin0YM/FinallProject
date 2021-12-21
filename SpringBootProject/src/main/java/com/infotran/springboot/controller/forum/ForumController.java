package com.infotran.springboot.controller.forum;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.infotran.springboot.model.forum.Forum;
import com.infotran.springboot.model.forum.Reply;
import com.infotran.springboot.model.member.Member;
import com.infotran.springboot.service.ForumService;


@SessionAttributes("member3")
@Controller
public class ForumController {

	@Autowired
	private ForumService forumService;
	@Autowired
	ServletContext servletContext;

	// 展示員工清單

	@GetMapping("/forum") // JSP對應路徑互叫這邊的方法用
	public String viewHomePage(Model model) { // Model model 是Spring boot用來存或取暫存空間資料的介面
		model.addAttribute("listForum", forumService.getAllForum()); // addAttribute<--暫存空間可存資料數據，"listEmployees"定義暫
																		// 存空間名稱，用於抓取用，呼叫介面(Servie)也可以改其他形式呼叫，
																		// 透過@autowired抓取Service請Dao做事情。
		return "forum/forum";
		// 導引至forum資料夾的forum.jsp，因為spring.mvc.view.prefix: /WEB-INF/views/
		// 最後有加"/"，所以這裡路徑最前面不用加"/"，後面spring.mvc.view.suffix: .jsp，有加.jsp所以也不用加".jsp"

		// 從header.jsp 標籤 <a href="<c:url value='/forum'
		// />連結到@GetMapping("/forum")使用方法取得值之後，return "forum/forum";
		// 回傳至forum.jsp，放入值顯示前端

	}

	@GetMapping("forum/saveForum")
	public String showNewForumForm(Model model) {
		
		Member member3  = (Member)model.getAttribute("member3"); //取暫存區
		System.out.println(member3);		
		if(member3 == null) {
			return "redirect:/member/loginPage";
		}else {	
					
		Forum forum = new Forum();
		model.addAttribute("forum", forum); // 創一個forum空的Bean(空白表單)位置準備塞東西，創出空白表單
		return "forum/new_forum"; // 導引至forum資料夾的new_forum.jsp
	}
	}

	@PostMapping("forum/saveForum")
	public String saveForum(@ModelAttribute("forum") Forum forum) { // 把@ModelAttribute("forum")填寫的資料傳到new_forum，再傳到Forum
																	// forum創出空間
		// save employee to database
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String date2 =sdf.format(date);
		forum.setDate(date2);
			
		forumService.savaForum(forum);

		return "redirect:/forum"; // 要導到的網頁路徑，因為/springapp，最後沒添加/，所以redirect引導路徑須加上/
	}

	@GetMapping("/forum/showForumForUpdate")
	public String showFormForUpdate(@RequestParam(value = "id") long id, Model model) { // @PathVariable(value =
																						// "id")抓值抓字串放入，a標籤
																						// @RequestParam除了抓前端input
																						// name名稱值以外，如果是抓<a>，則是?後面ID的值
		Member member3  = (Member)model.getAttribute("member3"); //取暫存區
		System.out.println(member3);
		
		if(member3 == null) {
			return "redirect:/member/loginPage";
		}else {
		
		// get Forum from the service
		Forum forum = forumService.getForumById(id);
		// set Forum as a model attribute to pre-populate form
		model.addAttribute("forum", forum);
		return "forum/update_forum";
	}
	}
	
	@PostMapping("forum/saveUpdate")
	public String saveUpdate(@ModelAttribute("forum") Forum forum) { // 把@ModelAttribute("forum")填寫的資料傳到new_forum，再傳到Forum
																	// forum創出空間
		// save employee to database
		
		Date lastDate = new Date();
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String lastDate2 =sdf2.format(lastDate);
		forum.setLastdate(lastDate2);
					
		forumService.savaForum(forum);

		return "redirect:/forum"; // 要導到的網頁路徑，因為/springapp，最後沒添加/，所以redirect引導路徑須加上/
	}
	
	
	
	@GetMapping("/forum/deleteForum")
	public String deleteForum(@RequestParam(value = "id") long id) {
		// 呼叫刪除Forum方法
		this.forumService.deleteForumById(id);
		return "redirect:/forum";
	}

	@GetMapping("/forum/showFormArticle") // JSP對應路徑呼叫這邊的方法用
	public String showFormArticle(@RequestParam(value = "id")  long id,   Model model) { 		
		Forum forum = forumService.getForumById(id);	
//		Reply reply = replyService.getReplyById(replyId);
//		@RequestParam(value = "replyId",required = false) Long replyId,
		
		

		 long count = forum.getCount();		 	
		 count++;		   
		  forum.setCount(count);
		  forumService.savaForum(forum);  
		  
		  model.addAttribute("ForumById",forum);
//		  model.addAttribute("ReplyById",reply);
		  
		return "forum/article";
		// 從forum.jsp 標籤 <c:url value='/forum/showFormArticle?id=${theme.id}連結到@GetMapping("/forum/showFormArticle")使用方
		// 法取得值之後，return "forum/article"; 回傳至article.jsp，放入值顯示前端
	}

	
	
	
	
	
//	=====================Reply CRUD============================
	
	//addReply
	
//	@GetMapping("/reply") // JSP對應路徑互叫這邊的方法用
//	public String viewHomePage(Model model) { // Model model 是Spring boot用來存或取暫存空間資料的介面
//		model.addAttribute("listForum", forumService.getAllForum()); // addAttribute<--暫存空間可存資料數據，"listEmployees"定義暫
//																		// 存空間名稱，用於抓取用，呼叫介面(Servie)也可以改其他形式呼叫，
//																		// 透過@autowired抓取Service請Dao做事情。
//		return "forum/forum";
//		// 導引至forum資料夾的forum.jsp，因為spring.mvc.view.prefix: /WEB-INF/views/
//		// 最後有加"/"，所以這裡路徑最前面不用加"/"，後面spring.mvc.view.suffix: .jsp，有加.jsp所以也不用加".jsp"
//
//		// 從header.jsp 標籤 <a href="<c:url value='/forum'
//		// />連結到@GetMapping("/forum")使用方法取得值之後，return "forum/forum";
//		// 回傳至forum.jsp，放入值顯示前端
//
//	}

	@GetMapping("/forum/addReply")
	public String addReply(@RequestParam(value = "id")  Long id,Model model) {
		
		Member member3  = (Member)model.getAttribute("member3"); //取暫存區
		System.out.println(member3);		
		if(member3 == null) {
			return "memberSystem/login";
		}else {						
		Reply reply = new Reply();
		model.addAttribute("reply", reply); // 創一個forum空的Bean(空白表單)位置準備塞東西，創出空白表單
		return "forum/new_reply"; // 導引至forum資料夾的new_forum.jsp
	}
	}

	@PostMapping("/forum/addReply")
	public String addReply(@ModelAttribute("reply") Reply reply) { // 把@ModelAttribute("forum")填寫的資料傳到new_forum，再傳到Forum
																	// forum創出空間
		// save employee to database
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		
		String replyDate2 =sdf.format(date);
		reply.setReplyDate(replyDate2);					
//		replyService.savaReply(reply);

		return "redirect:/forum"; // 要導到的網頁路徑，因為/springapp，最後沒添加/，所以redirect引導路徑須加上/
	}
//
//	@GetMapping("/forum/updateReply")
//	public String updateReply(@RequestParam(value = "replyId") Long replyId, Model model) { // @PathVariable(value =
//																						// "id")抓值抓字串放入，a標籤
//																						// @RequestParam除了抓前端input
//																						// name名稱值以外，如果是抓<a>，則是?後面ID的值
//		Member member3  = (Member)model.getAttribute("member3"); //取暫存區
//		System.out.println(member3);
//		
//		if(member3 == null) {
//			return "memberSystem/login";
//		}else {
//		
//		// get Forum from the service
//			Reply reply = replyService.getReplyById(replyId);
//		// set Forum as a model attribute to pre-populate form
//		model.addAttribute("reply", reply);
//		return "forum/update_reply";
//	}
//	}
//	
//	@PostMapping("/forum/saveUpdateReply")
//	public String saveUpdateReply(@ModelAttribute("reply") Reply reply) { // 把@ModelAttribute("forum")填寫的資料傳到new_forum，再傳到Forum
//																	// forum創出空間
//		// save employee to database
//		Date replylastdate = new Date();
//		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		
//		String replylastdate2 =sdf2.format(replylastdate);
//		reply.setReplyLastDate(replylastdate2);
//					
//		replyService.savaReply(reply);
//
//		return "redirect:/forum"; // 要導到的網頁路徑，因為/springapp，最後沒添加/，所以redirect引導路徑須加上/
//	}
//	
//	
//	
//	@GetMapping("/forum/deleteReply")
//	public String deleteReply(@RequestParam(value = "replyId") Long replyId) {
//		// 呼叫刪除Forum方法
//		this.replyService.deleteReplyById(replyId);
//		return "redirect:/forum";
//	}
//
//
//	
//	
	
	
	
	
	
	
	
	
	
	

}






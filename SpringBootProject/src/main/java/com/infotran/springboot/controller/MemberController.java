package com.infotran.springboot.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.infotran.springboot.mail.SendFromGMailUsingJavaMailLab;
import com.infotran.springboot.model.member.Member;
import com.infotran.springboot.service.MemberService;
import com.infotran.springboot.util.GlobalService;
import com.infotran.springboot.validate.MemberAddNew2Validator;
import com.infotran.springboot.validate.MemberEditValidator;
import com.infotran.springboot.validate.MemberForgetPasswordValidator;
import com.infotran.springboot.validate.MemberLoginValidator;
import com.infotran.springboot.validate.MemberSearchByIdValidator;
import com.infotran.springboot.validate.MemberSearchByUsernameValidator;

@Controller
@SessionAttributes({ "member", "member3", "name", "status", "loginCheck", "message" })
@RequestMapping("/member")
public class MemberController {
	MemberService memberService;
	ServletContext servletContext;

	@Autowired
	public MemberController(MemberService memberService, ServletContext servletContext) {
		super();
		this.memberService = memberService;
		this.servletContext = servletContext;
	}

	@GetMapping("/edit/{id}")
	public String edit(Model model, @PathVariable(required = false) Integer id, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		if (id == null) {
			throw new RuntimeException("請求未提供客戶Id");
		}
		List<Member> members = memberService.selectById(id);
		Member member = members.get(0);
//		System.out.println("會員編輯未解密:" + member.getPassword());
		member.setPassword(GlobalService.decryptString(GlobalService.KEY, member.getPassword()));
		member.setPassword1(member.getPassword());
//		System.out.println("會員寫入password1" + member.getPassword1());
		model.addAttribute("member", member);
		return "/memberSystem/edit";
	}

	@GetMapping("/enable/{id}")
	public String enable(Model model, @PathVariable(required = false) Integer id, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
//		if (id == null) {
//			throw new RuntimeException("請求未提供客戶Id");
//		}
		List<Member> members = memberService.selectById(id);
		Member member = members.get(0);
		member.setAct_level("啟用");
		memberService.update(member);
//		model.addAttribute("member", member);
		return "redirect:/member/adminList";
	}

	@GetMapping("/disable/{id}")
	public String disable(Model model, @PathVariable(required = false) Integer id, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
//		if (id == null) {
//			throw new RuntimeException("請求未提供客戶Id");
//		}
		List<Member> members = memberService.selectById(id);
		Member member = members.get(0);
		member.setAct_level("停權");
		memberService.update(member);
//		model.addAttribute("member", member);
		return "redirect:/member/adminList";
	}

	@GetMapping("/editUser/{id}")
	public String editUser(Model model, @PathVariable(required = false) Integer id, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}

		if (status.equals("會員") || status.equals("廠商")) {
			if (id == null) {
				throw new RuntimeException("請求未提供客戶Id");
			}
			List<Member> members = memberService.selectById(id);
			Member member = members.get(0);
			member.setPassword(GlobalService.decryptString(GlobalService.KEY, member.getPassword()));
			member.setPassword1(member.getPassword());
			model.addAttribute("member", member);
		}
//---------------------------------------------------
		return "/memberSystem/editUser";
	}

	@GetMapping("/delete")
	public String delete(Model model, @RequestParam Integer id, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		List<Member> members = memberService.selectById(id);
		Member member = members.get(0);
		model.addAttribute("member", member);
		return "/memberSystem/delete";
	}

	@GetMapping("/addNew")
	public String addNew(Model model, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		Member member = new Member();
		model.addAttribute("member", member);
		return "/memberSystem/addNew";
	}

	@GetMapping("/addNew2")
	public String addNew2(Model model) {
		Member member = new Member();
		model.addAttribute("member", member);
		return "/memberSystem/addNew2";
	}

	@GetMapping("/forgetPassword")
	public String forgetPassword(Model model) {
		Member member = new Member();
		model.addAttribute("member", member);
		return "/memberSystem/forgetPassword";
	}

	@PostMapping("/sendForgetPasswordVerify")
	public String sendForgetPasswordVerify(@ModelAttribute("member") Member member, BindingResult result, Model model) {
//		System.out.println("----------");
		System.out.println(result.getAllErrors());
//		System.out.println("----------");
		boolean usernameCheck = memberService.usernameCheck(member.getUsername());
		boolean emailaddressCheck = false;
		MemberForgetPasswordValidator memberValidator = new MemberForgetPasswordValidator();
		memberValidator.setUsernameCheck(usernameCheck);
		// ----------------------------
		Member fgMember = memberService.forgetPasswordCheck(member.getUsername(), member.getEmailaddress());
		if (fgMember == null) {
			emailaddressCheck = true;
		}
		memberValidator.setEmailaddressCheck(emailaddressCheck);
		memberValidator.validate(member, result);
		if (result.hasErrors()) {
			return "memberSystem/forgetPassword";
		}
		if (fgMember != null) {
			SendFromGMailUsingJavaMailLab sendFrom = new SendFromGMailUsingJavaMailLab();
			sendFrom.sendFromGMail(fgMember.getEmailaddress(),
					GlobalService.decryptString(GlobalService.KEY, fgMember.getPassword()));
			model.addAttribute("message", "恭喜您驗證成功,已寄送信件至您的信箱");
			return "redirect:/member/message";
		}
		model.addAttribute("message", "很抱歉驗證失敗");
		return "redirect:/member/message";
	}

	@GetMapping("/message")
	public String message() {
		return "/memberSystem/message";
	}

	@GetMapping("/searchById")
	public String searchById(Model model, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		Member member = new Member();
		model.addAttribute("member", member);
		return "/memberSystem/searchById";
	}

	@GetMapping("/searchByUsername")
	public String searchByUsername(Model model, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		Member member = new Member();
		model.addAttribute("member", member);
		return "/memberSystem/searchByUsername";
	}

	@GetMapping("/loginPage")
	public String loginPage(Model model, @CookieValue(value = "username", required = false) String username,
			@CookieValue(value = "password", required = false) String password,
			@CookieValue(value = "rememberMe", required = false) Boolean rememberMe) {
		if (username == null)
			username = "";
		if (password == null) {
			password = "";
		} else {
			password = GlobalService.decryptString(GlobalService.KEY, password);
		}

		if (rememberMe != null) {
			rememberMe = Boolean.valueOf(rememberMe);
		} else {
			rememberMe = false;
		}
		Member member = new Member(username, password, rememberMe);
		member.getUsername();
		member.getPassword();
		member.isRememberMe();
		model.addAttribute("member", member);
		return "/memberSystem/login";
	}

	// --------------------------------------------------------
	@GetMapping("/GoListUser")
	public String GoListUser(Model model, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null) {
			System.out.println("*****");
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		if (status.equals("會員") || status.equals("廠商")) {
			Member member = (Member) model.getAttribute("member3");
			Integer id = member.getId();
			model.addAttribute("members", memberService.selectById(id));
		}
		return "/memberSystem/listUser";
		// ---------------------------------------------------
	}

	@PostMapping("/Register")
	public String Register(@ModelAttribute("member") Member member, BindingResult result, Model model,
			HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		System.out.println(result.getAllErrors());
		System.out.println(member.getUsername());
		boolean check = memberService.usernameCheck(member.getUsername());
		MemberAddNew2Validator memberValidator = new MemberAddNew2Validator();
		memberValidator.setCheck(check);
		memberValidator.validate(member, result);
		if (result.hasErrors()) {
			return "memberSystem/addNew";
		}
		member.setPassword(GlobalService.encryptString(member.getPassword()));
		// --------------------------------
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		member.setRegisterTime(ts);
		// ---------------------------------
		member.setAct_level("啟用");
		// ---------------------------------
		memberService.insert(member);
		model.addAttribute("message", "恭喜您註冊成功");
		return "redirect:/member/message2";
//		return "redirect:/member/adminList";
	}

	@GetMapping("/message2")
	public String message2() {
		return "/memberSystem/message2";
	}

	@GetMapping("/adminList")
	public String list(Model model, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		model.addAttribute("members", memberService.selectAll());
		return "/memberSystem/admin/adminList";
	}

	@PostMapping("/Register2")
	public String Register2(@ModelAttribute("member") Member member, BindingResult result, Model model) {
		System.out.println(result.getAllErrors());
		boolean check = memberService.usernameCheck(member.getUsername());
		MemberAddNew2Validator memberValidator = new MemberAddNew2Validator();
		memberValidator.setCheck(check);
		memberValidator.validate(member, result);
		if (result.hasErrors()) {
			return "memberSystem/addNew2";
		}
		member.setPassword(GlobalService.encryptString(member.getPassword()));
		// --------------------------------
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		member.setRegisterTime(ts);
		// ---------------------------------
		member.setAct_level("啟用");
		// ---------------------------------
		memberService.insert(member);
		model.addAttribute("message", "恭喜您註冊成功");
		return "redirect:/member/message";
	}

	@GetMapping("/login2")
	public String login() {
		return "/memberSystem/login";
	}

	@PostMapping("/Retrieve")
	public String Retrieve(Model model, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		model.addAttribute("members", memberService.selectAll());
		return "/memberSystem/admin/adminList";
	}

	@GetMapping("/Retrieve2")
	public String Retrieve2(Model model, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		model.addAttribute("members", memberService.selectAll());
		return "/memberSystem/admin/adminList";
	}

	@PostMapping("/RetrieveByIdMang")
	public String RetrieveByIdMang(@ModelAttribute("member") Member member, BindingResult result, Model model,
			HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		MemberSearchByIdValidator memberSearchByIdValidator = new MemberSearchByIdValidator();
		memberSearchByIdValidator.validate(member, result);
		if (result.hasErrors()) {
			return "memberSystem/searchById";
		}
		List<Member> members = memberService.selectById(member.getId());
		model.addAttribute("members", members);
		return "/memberSystem/admin/adminList";
	}

	@PostMapping("/RetrieveByUsernameIdMang")
	public String RetrieveByUsernameIdMang(@ModelAttribute("member") Member member, BindingResult result, Model model,
			HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		System.out.println("進來囉");
		boolean check = memberService.usernameCheck(member.getUsername());
		System.out.println("驗證帳戶是否存在: " + check);
		MemberSearchByUsernameValidator memberSearchByUsernameValidator = new MemberSearchByUsernameValidator();
		memberSearchByUsernameValidator.setCheck(check);
		memberSearchByUsernameValidator.validate(member, result);
		System.out.println("尚未驗證");
		if (result.hasErrors()) {
			return "memberSystem/searchByUsername";
		}
		System.out.println("驗證成功");
		List<Member> members = memberService.selectByUsername(member.getUsername());
		model.addAttribute("members", members);
		return "/memberSystem/admin/adminList";
	}

	@PostMapping("/RetrieveByIdUser")
	public String RetrieveByIdUser(Model model, @RequestParam Integer id, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("會員") || !status.equals("廠商")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		model.addAttribute("members", memberService.selectById(id));
		return "/memberSystem/listUser";
	}

	@PostMapping("/Delete")
	public String Delete(Model model, @RequestParam Integer id, HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		memberService.deleteById(id);
		model.addAttribute("members", memberService.selectAll());
		return "/memberSystem/admin/adminList";
	}

	@PostMapping("edit/Update")
	public String Update(@ModelAttribute("member") Member member, BindingResult result, Model model,
			HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null || !status.equals("管理員")) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}
		// ---------------------------------------------------
		boolean check;
		List<Member> members = memberService.selectById(member.getId());
		Member oldMember = members.get(0);
		MemberEditValidator memberEditValidator = new MemberEditValidator();
		if (oldMember.getUsername().equals(member.getUsername())) {
			check = false;
			memberEditValidator.setCheck(check);
		} else if (!oldMember.getUsername().equals(member.getUsername())) {
			check = memberService.usernameCheck(member.getUsername());
			memberEditValidator.setCheck(check);
		}
		memberEditValidator.validate(member, result);
		if (result.hasErrors()) {
			return "memberSystem/edit";
		}
		member.setPassword(GlobalService.encryptString(member.getPassword()));
		memberService.update(member);
		model.addAttribute("member3", member);
		if (member.getStatus().equals("管理員")) {
			model.addAttribute("name", member.getName());
			model.addAttribute("status", member.getStatus());
		}
		return "redirect:/member/adminList";
	}

//	@PostMapping("edit/change/{id}/{act_level}")
//	public String changeAct_level(@PathVariable(required = false) Integer id,String act_level) {
//		System.out.println("IN");
//		boolean check;
//		List<Member> members = memberService.selectById(id);
//		Member oldMember = members.get(0);
//		oldMember.setAct_level(act_level);
//		memberService.update(oldMember);
//		return "redirect:/member/adminList";
//	}
	@PostMapping("editUser/UpdateUser")
	public String UpdateUser(@ModelAttribute("member") Member member, BindingResult result, Model model,
			HttpServletRequest req) {
		String status = (String) model.getAttribute("status");
		if (req.getSession().getAttribute("status") == null) {
			model.addAttribute("message", "權限不足,請返回");
			return "redirect:/member/message";
		}

		if (status.equals("會員") || status.equals("廠商")) {
			boolean check;
			List<Member> members = memberService.selectById(member.getId());
			Member oldMember = members.get(0);
			MemberEditValidator memberEditValidator = new MemberEditValidator();
			if (oldMember.getUsername().equals(member.getUsername())) {
				check = false;
				memberEditValidator.setCheck(check);
			} else if (!oldMember.getUsername().equals(member.getUsername())) {
				check = memberService.usernameCheck(member.getUsername());
				memberEditValidator.setCheck(check);
			}
			memberEditValidator.validate(member, result);
			if (result.hasErrors()) {
				return "memberSystem/editUser";
			}
			member.setPassword(GlobalService.encryptString(member.getPassword()));
			memberService.update(member);
			model.addAttribute("member3", member);
			model.addAttribute("name", member.getName());
			model.addAttribute("status", member.getStatus());
		}
//---------------------------------------------------
		return "redirect:/member/GoListUser";
	}

	@PostMapping("/login")
	public String loginServlet(Model model, @ModelAttribute("member") Member member, BindingResult result,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		boolean check = memberService.usernameCheck(member.getUsername());
		MemberLoginValidator memberValidator2 = new MemberLoginValidator();
		memberValidator2.setCheck(check);
		memberValidator2.validate(member, result);
		System.out.println(result.getAllErrors());
		if (result.hasErrors()) {
			return "memberSystem/login";
		}
		System.out.println("NO ERROR");
		Member member3 = memberService.validate(member.getUsername(),
				GlobalService.encryptString(member.getPassword()));
		if (member3 == null) {
			result.rejectValue("username", "", "該帳號不存在或密碼錯誤");
			return "/memberSystem/login";
		}
		String name = member3.getName();
		String status = member3.getStatus();
		System.out.println(name);
		System.out.println(status);

		if (member3 != null) {
			if (status.equals("管理員")) {
				model.addAttribute("member3", member3);
				model.addAttribute("loginCheck", "true");
				model.addAttribute("name", name);
				model.addAttribute("status", status);
				session.setMaxInactiveInterval(15 * 60);
				processCookies(member, request, response);
				return "redirect:/member/adminList";
			} else if (status.equals("會員")) {
				model.addAttribute("member3", member3);
				model.addAttribute("loginCheck", "true");
				model.addAttribute("name", name);
				model.addAttribute("status", status);
				session.setMaxInactiveInterval(15 * 60);
				processCookies(member, request, response);
				return "redirect:/";
			} else if (status.equals("廠商")) {
				model.addAttribute("member3", member3);
				model.addAttribute("loginCheck", "true");
				model.addAttribute("name", name);
				model.addAttribute("status", status);
				session.setMaxInactiveInterval(15 * 60);
				processCookies(member, request, response);
				return "redirect:/";
			}
		}
		result.rejectValue("invalidCredentials", "", "該帳號不存在或密碼錯誤");
		return "/memberSystem/login";
	}

	private void processCookies(Member member, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookieUsername = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		String username = member.getUsername();
		String password = member.getPassword();

		// rm存放瀏覽器送來之RememberMe的選項，如果使用者對RememberMe打勾，rm就不會是null
		if (member.isRememberMe()) {
			cookieUsername = new Cookie("username", username);
			cookieUsername.setMaxAge(7 * 24 * 60 * 60); // Cookie的存活期: 七天
			cookieUsername.setPath(request.getContextPath());

			String encodePassword = GlobalService.encryptString(password);
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(7 * 24 * 60 * 60);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rememberMe", "true");
			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
			cookieRememberMe.setPath(request.getContextPath());
		} else { // 使用者沒有對 RememberMe 打勾
			cookieUsername = new Cookie("username", username);
			cookieUsername.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
			cookieUsername.setPath(request.getContextPath());

			String encodePassword = GlobalService.encryptString(password);
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rememberMe", "true");
			cookieRememberMe.setMaxAge(0);
			cookieRememberMe.setPath(request.getContextPath());
		}
		response.addCookie(cookieUsername);
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberMe);

	}

//	@PostMapping("/userscheck.controller")
//	public ResponseEntity<String> usernameCheck(@RequestBody Member member,HttpServletRequest req) {
//		boolean status = memberService.usernameCheck(member.getUsername());
//		if (status) {
//			return new ResponseEntity<String>("Y", HttpStatus.OK);
//		}
//		return new ResponseEntity<String>("N", HttpStatus.OK);
//
//	}
}

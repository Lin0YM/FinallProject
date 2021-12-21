package com.infotran.springboot.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes({"member","members","member3", "name", "status", "loginCheck", "message"})
@RequestMapping("/member")
public class LogoutController {

	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
//		return "redirect:/member/loginPage";
		return "redirect:/";
		
	}
	
}

package com.infotran.springboot.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes({"message"})
@RequestMapping("/member")
public class LogoutMessageController {
	
	@GetMapping("/logoutmessage")
	public String logoutmessage(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		System.out.println("message登出成功唷");
		return "redirect:/";
	}
}

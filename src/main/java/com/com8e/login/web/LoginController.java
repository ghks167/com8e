package com.com8e.login.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping(value = "login/loginForm")
	public String loginForm() {
		
		
		
		
		return "login/loginForm";
	}

}

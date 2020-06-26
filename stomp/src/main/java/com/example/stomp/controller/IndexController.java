package com.example.stomp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/")
	public String index(Model model,HttpSession sessionId) {
		System.out.println(sessionId);
		model.addAttribute("userid",sessionId);
		return "index";
	}

}

package com.codingdojo.login_registration.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.login_registration.models.User;
import com.codingdojo.login_registration.services.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userServ;
	
	@GetMapping("/home")
	public String home(HttpSession session, Model model) {
		if (session.getAttribute("userID") == null) {
			return "home.jsp";
		} else {
			
		Long userid = (Long) session.getAttribute("userID");
		User uzer = this.userServ.findUserById(userid);
		model.addAttribute("user", uzer);
		return "home.jsp";
		}
	}
	
	@GetMapping("/registration")
	public String registerForm(@ModelAttribute("user") User user) {
		return "registration.jsp";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login.jsp";
	}
	
	@PostMapping("/registration")
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "/registration";
		} else {
			User myUser = this.userServ.registerUser(user);
			session.setAttribute("userID", myUser.getId());
			return "redirect:/home";
		}
	}
	
	@PostMapping("/login")
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
		if (this.userServ.authenticationUser(email, password)) {
			User foundUser = this.userServ.findByEmail(email);
			session.setAttribute("userID", foundUser.getId());
			return "redirect:/home";
		} else {
			model.addAttribute("error", "Incurrect Email/Passowrd");
			return "login.jsp";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}

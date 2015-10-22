package com.freedomtech;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.freedomtech.persistence.Cart;
import com.freedomtech.persistence.Customer;
import com.freedomtech.persistence.LocalMemoryService;

@Controller
public class LoginController {

	@Autowired
	private LocalMemoryService localMemoryService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		model.addAttribute("categoryList",
				localMemoryService.categories.values());
		return "login-signup";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		model.addAttribute("categoryList",
				localMemoryService.categories.values());
		String email = request.getParameter("login-email");
		if (localMemoryService.customers.containsKey(email)) {
			request.getSession().setAttribute("email", email);
			return "home";
		} else
			return "login-signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(Model model, HttpServletRequest request) {
		model.addAttribute("categoryList",
				localMemoryService.categories.values());
		String email = request.getParameter("signup-email");
		String password = request.getParameter("signup-password");
		String name = request.getParameter("fname");
		String surname = request.getParameter("lname");
		String country = request.getParameter("country");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipcode = request.getParameter("zipcode");
		localMemoryService.customers.put(email, new Customer(name, surname,
				email, password, country, address, city, zipcode, new Cart()));
		request.getSession().setAttribute("email", email);
		return "home";
	}

	@RequestMapping(value = "/check-email")
	public @ResponseBody
	String emailCheck(@RequestParam(value = "input") String email) {
		if (localMemoryService.customers.containsKey(email)) {
			return "ko";
		} else
			return "ok";
	}

	@RequestMapping(value = "/check-login")
	public @ResponseBody
	String loginCheck(@RequestParam(value = "email") String email) {
		if (localMemoryService.customers.containsKey(email)) {
			return "ok";
		} else
			return "ko";
	}
}

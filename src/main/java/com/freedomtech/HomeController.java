package com.freedomtech;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.freedomtech.persistence.LocalMemoryService;

@Controller
public class HomeController {

	@Autowired
	private LocalMemoryService localMemoryService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		model.addAttribute("categoryList",
				localMemoryService.categories.values());
		return "home";
	}
}

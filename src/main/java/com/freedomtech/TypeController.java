package com.freedomtech;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.freedomtech.persistence.LocalMemoryService;
import com.freedomtech.persistence.Type;

@Controller
public class TypeController {

	@Autowired
	private LocalMemoryService localMemoryService;

	@RequestMapping(value = "/type-view", method = RequestMethod.GET)
	public String type(Model model, HttpServletRequest request) {
		String pageCategory = request.getParameter("category");
		Map<String, Type> typeMap = new HashMap<String, Type>();

		for (Type t : localMemoryService.types.values()) {
			if (t.category.name.equals(pageCategory)) {
				typeMap.put(t.name, t);
			}
		}

		model.addAttribute("pageCategory",
				localMemoryService.categories.get(pageCategory));
		model.addAttribute("categoryList",
				localMemoryService.categories.values());
		model.addAttribute("typeList", typeMap.values());
		return "type-view";
	}
}

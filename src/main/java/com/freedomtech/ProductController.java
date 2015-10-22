package com.freedomtech;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.freedomtech.persistence.Cart;
import com.freedomtech.persistence.Customer;
import com.freedomtech.persistence.LocalMemoryService;
import com.freedomtech.persistence.Product;
import com.freedomtech.persistence.Type;

@Controller
public class ProductController {

	@Autowired
	private LocalMemoryService localMemoryService;

	@RequestMapping(value = "/product-view", method = RequestMethod.GET)
	public String products(Model model, HttpServletRequest request) {
		String pageCategory = request.getParameter("category");
		String pageType = request.getParameter("type");
		Map<String, Type> typeMap = new HashMap<String, Type>();
		Map<String, Product> productMap = new HashMap<String, Product>();

		for (Type t : localMemoryService.types.values()) {
			if (t.category.name.equals(pageCategory)) {
				typeMap.put(t.name, t);
			}
		}

		for (Product p : localMemoryService.products.values()) {
			if (p.type.name.equals(pageType)) {
				productMap.put(p.name, p);
			}
		}

		model.addAttribute("pageCategory",
				localMemoryService.categories.get(pageCategory));
		model.addAttribute("pageType", localMemoryService.types.get(pageType));
		model.addAttribute("categoryList",
				localMemoryService.categories.values());
		model.addAttribute("typeList", typeMap.values());
		model.addAttribute("productList", productMap.values());
		return "product-view";
	}

	@RequestMapping(value = "/product-detail-view", method = RequestMethod.GET)
	public String product(Model model, HttpServletRequest request) {
		String pageCategory = request.getParameter("category");
		String pageType = request.getParameter("type");
		String pageProduct = request.getParameter("product");

		Map<String, Type> typeMap = new HashMap<String, Type>();

		for (Type t : localMemoryService.types.values()) {
			if (t.category.name.equals(pageCategory)) {
				typeMap.put(t.name, t);
			}
		}

		model.addAttribute("pageCategory",
				localMemoryService.categories.get(pageCategory));
		model.addAttribute("pageType", localMemoryService.types.get(pageType));
		model.addAttribute("pageProduct",
				localMemoryService.products.get(pageProduct));
		model.addAttribute("categoryList",
				localMemoryService.categories.values());
		model.addAttribute("typeList", typeMap.values());
		return "products/" + pageProduct;
	}

	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	public String addToCart(Model model, HttpServletRequest request,
			@RequestParam(value = "product") String productName) {
		String email = (String) request.getSession().getAttribute("email");
		int qty = Integer.parseInt(request.getParameter("qty"));
		Product product = localMemoryService.products.get(productName);
		Customer customer = localMemoryService.customers.get(email);
		Cart cart = customer.cart;
		cart.add(product, qty);
		Set<Product> products = new HashSet<Product>(cart.productList);
		model.addAttribute("products", products);
		model.addAttribute("cart", cart);
		model.addAttribute("customer", customer);
		return "cart-view";
	}
}

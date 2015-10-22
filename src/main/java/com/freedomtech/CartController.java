package com.freedomtech;

import java.util.ArrayList;
import java.util.HashSet;
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

@Controller
public class CartController {

	@Autowired
	private LocalMemoryService localMemoryService;

	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model, HttpServletRequest request) {
		model.addAttribute("categoryList",
				localMemoryService.categories.values());
		String email = (String) request.getSession().getAttribute("email");
		Customer customer = localMemoryService.customers.get(email);
		Cart cart = customer.cart;
		Set<Product> products = new HashSet<Product>(cart.productList);
		model.addAttribute("products", products);
		model.addAttribute("cart", cart);
		model.addAttribute("customer", customer);
		return "cart-view";
	}

	@RequestMapping(value = "/cart-remove", method = RequestMethod.GET)
	public String removeProduct(Model model, HttpServletRequest request,
			@RequestParam(value = "product") String productName) {
		model.addAttribute("categoryList",
				localMemoryService.categories.values());
		String email = (String) request.getSession().getAttribute("email");
		Customer customer = localMemoryService.customers.get(email);
		Cart cart = customer.cart;
		Product product = localMemoryService.products.get(productName);
		while (cart.productList.contains(product)){
			cart.remove(product);
		}
		Set<Product> products = new HashSet<Product>(cart.productList);
		model.addAttribute("products", products);
		model.addAttribute("cart", cart);
		model.addAttribute("customer", customer);
		return "cart-view";
	}
	
	@RequestMapping(value = "/placeOrder", method = RequestMethod.POST)
	public String placeOrder(Model model, HttpServletRequest request) {
		model.addAttribute("categoryList",
				localMemoryService.categories.values());
		String email = (String) request.getSession().getAttribute("email");
		Customer customer = localMemoryService.customers.get(email);
		Cart cart = customer.cart;
		cart.productList = new ArrayList<Product>();
		model.addAttribute("customer", customer);
		return "confirmation";
	}
}

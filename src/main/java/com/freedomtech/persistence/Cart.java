package com.freedomtech.persistence;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Cart {

	public List<Product> productList;

	public Cart() {
		this.productList = new ArrayList<Product>();
	}

	public void add(Product product, int qty) {
		for (int i = 0; i < qty; i++) {
			productList.add(product);
		}
	}

	public void remove(Product product) {
		productList.remove(product);
	}

	public int getQty(Product product) {
		return Collections.frequency(productList, product);
	}

	public int getPrice(Product product) {
		return Integer.parseInt(product.price) * getQty(product);
	}

	public int getTot() {
		int tot = 0;
		for (Product p : productList) {
			tot += Integer.parseInt(p.price);
		}
		return tot;
	}

}

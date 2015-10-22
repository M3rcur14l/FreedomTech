package com.freedomtech.persistence;


public class Product {

	public String name;
	public Type type;
	public String shortDescription;
	public String longDescription;
	public String price;

	public Product(String name, Type type, String shortDescription,
			String longDescription, String price) {
		this.name = name;
		this.type = type;
		this.shortDescription = shortDescription;
		this.longDescription = longDescription;
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getLongDescription() {
		return longDescription;
	}

	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

}

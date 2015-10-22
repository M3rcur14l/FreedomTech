package com.freedomtech.persistence;

public class Type {

	public String name;
	public String description;
	public Category category;

	public Type(String name, String description, Category category) {
		super();
		this.name = name;
		this.description = description;
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}

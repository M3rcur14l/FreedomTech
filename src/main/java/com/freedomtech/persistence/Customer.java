package com.freedomtech.persistence;

public class Customer {

	public String name;
	public String surname;
	public String email;
	public String password;
	public String country;
	public String address;
	public String city;
	public String zipcode;
	public Cart cart;

	public Customer(String name, String surname, String email, String password,
			String country, String address, String city, String zipcode,
			Cart cart) {
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.password = password;
		this.country = country;
		this.address = address;
		this.city = city;
		this.zipcode = zipcode;
		this.cart = cart;
	}

	public String getName() {
		return name;
	}

	public String getSurname() {
		return surname;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getCountry() {
		return country;
	}

	public String getAddress() {
		return address;
	}

	public String getCity() {
		return city;
	}

	public String getZipcode() {
		return zipcode;
	}

	public Cart getCart() {
		return cart;
	}
}

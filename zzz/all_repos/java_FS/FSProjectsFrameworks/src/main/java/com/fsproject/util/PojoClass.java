package com.fsproject.util;

public class PojoClass {
	
	private String userName;
	private String password;
	private String country;
	private String capital;
	
	public PojoClass(String userName,String password,String country,String capital) {
		this.userName=userName;
		this.password=password;
		this.country=country;
		this.capital=capital;
	}
	public String getUserName() {
		return this.userName;
	}
	public String getPassword() {
		return this.password;
	}
	public String getCountry() {
		return this.country;
	}
	public String getCapital() {
		return this.capital;
	}

}

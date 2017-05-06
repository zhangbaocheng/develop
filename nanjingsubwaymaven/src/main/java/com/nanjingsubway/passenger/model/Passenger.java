package com.nanjingsubway.passenger.model;

import java.util.Date;

public class Passenger {
	private Integer passengerId = null;
	private String idNumber = null;
	private String name = null;
	private String password = null;
	private String email = null;
	private String phoneNumber = null;
	private String nickName = null;
	private String headImage = null;
	private Date registerTime = null;
	public Integer getPassengerId() {
		return passengerId;
	}
	public void setPassengerId(Integer passengerId) {
		this.passengerId = passengerId;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getHeadImage() {
		return headImage;
	}
	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public Passenger() {
		super();
	}
	public Passenger(Integer passengerId, String idNumber, String name, String password, String email,
			String phoneNumber, String nickName, String headImage, Date registerTime) {
		super();
		this.passengerId = passengerId;
		this.idNumber = idNumber;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.nickName = nickName;
		this.headImage = headImage;
		this.registerTime = registerTime;
	}
	public Passenger(String idNumber, String name, String password, String email, String phoneNumber, String nickName,
			String headImage, Date registerTime) {
		super();
		this.idNumber = idNumber;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.nickName = nickName;
		this.headImage = headImage;
		this.registerTime = registerTime;
	}
	
}

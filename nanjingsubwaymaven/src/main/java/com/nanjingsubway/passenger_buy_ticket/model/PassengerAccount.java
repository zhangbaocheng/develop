package com.nanjingsubway.passenger_buy_ticket.model;

public class PassengerAccount {
	private Integer passengerAccountId = null;
	private String passengerAccountMoney = null;
	private String passengerId = null;
	public Integer getPassengerAccountId() {
		return passengerAccountId;
	}
	public void setPassengerAccountId(Integer passengerAccountId) {
		this.passengerAccountId = passengerAccountId;
	}
	public String getPassengerAccountMoney() {
		return passengerAccountMoney;
	}
	public void setPassengerAccountMoney(String passengerAccountMoney) {
		this.passengerAccountMoney = passengerAccountMoney;
	}
	public String getPassengerId() {
		return passengerId;
	}
	public void setPassengerId(String passengerId) {
		this.passengerId = passengerId;
	}
}

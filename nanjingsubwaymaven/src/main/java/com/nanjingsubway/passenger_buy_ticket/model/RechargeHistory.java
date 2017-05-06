package com.nanjingsubway.passenger_buy_ticket.model;

import java.util.Date;

public class RechargeHistory {
	private Integer rechargeHistoryId = null;
	private Integer passengerId = null;
	private Date rechargeDate = null;
	private String recharge_money = null;
	public Integer getRechargeHistoryId() {
		return rechargeHistoryId;
	}
	public void setRechargeHistoryId(Integer rechargeHistoryId) {
		this.rechargeHistoryId = rechargeHistoryId;
	}
	public Integer getPassengerId() {
		return passengerId;
	}
	public void setPassengerId(Integer passengerId) {
		this.passengerId = passengerId;
	}
	public Date getRechargeDate() {
		return rechargeDate;
	}
	public void setRechargeDate(Date rechargeDate) {
		this.rechargeDate = rechargeDate;
	}
	public String getRecharge_money() {
		return recharge_money;
	}
	public void setRecharge_money(String recharge_money) {
		this.recharge_money = recharge_money;
	}
}

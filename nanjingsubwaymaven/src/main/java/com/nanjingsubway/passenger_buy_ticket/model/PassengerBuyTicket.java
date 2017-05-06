package com.nanjingsubway.passenger_buy_ticket.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PassengerBuyTicket {
	private Integer buyTicketId = null;
	private String startPlace = null;
	private String endPlace = null;
	private String price = null;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date buyDate = null;
	/**�˿�Id*/
	private Integer passengerId = null;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date startTime = null;
	
	private String isEvaluation = null;
	private String linesPassBy = null;
	private String sitesNumberPassBy = null;
	
	public Integer getBuyTicketId() {
		return buyTicketId;
	}
	public void setBuyTicketId(Integer buyTicketId) {
		this.buyTicketId = buyTicketId;
	}
	public String getStartPlace() {
		return startPlace;
	}
	public void setStartPlace(String startPlace) {
		this.startPlace = startPlace;
	}
	public String getEndPlace() {
		return endPlace;
	}
	public void setEndPlace(String endPlace) {
		this.endPlace = endPlace;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Date getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}
	public Integer getPassengerId() {
		return passengerId;
	}
	public void setPassengerId(Integer passengerId) {
		this.passengerId = passengerId;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	public String getIsEvaluation() {
		return isEvaluation;
	}
	public void setIsEvaluation(String isEvaluation) {
		this.isEvaluation = isEvaluation;
	}
	public String getLinesPassBy() {
		return linesPassBy;
	}
	public void setLinesPassBy(String linesPassBy) {
		this.linesPassBy = linesPassBy;
	}
	public String getSitesNumberPassBy() {
		return sitesNumberPassBy;
	}
	public void setSitesNumberPassBy(String sitesNumberPassBy) {
		this.sitesNumberPassBy = sitesNumberPassBy;
	}
	public PassengerBuyTicket() {
	}
}

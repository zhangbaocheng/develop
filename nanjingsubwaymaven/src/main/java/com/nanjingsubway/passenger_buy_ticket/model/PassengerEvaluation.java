package com.nanjingsubway.passenger_buy_ticket.model;

public class PassengerEvaluation {
	private Integer id;
	private Integer passengerId;
	private Integer buyTicketId;
	private String evaluationStars;
	private String evaluationContent;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPassengerId() {
		return passengerId;
	}
	public void setPassengerId(Integer passengerId) {
		this.passengerId = passengerId;
	}
	public Integer getBuyTicketId() {
		return buyTicketId;
	}
	public void setBuyTicketId(Integer buyTicketId) {
		this.buyTicketId = buyTicketId;
	}
	public String getEvaluationStars() {
		return evaluationStars;
	}
	public void setEvaluationStars(String evaluationStars) {
		this.evaluationStars = evaluationStars;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
}

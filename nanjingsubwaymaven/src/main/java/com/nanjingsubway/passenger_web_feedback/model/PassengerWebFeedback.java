package com.nanjingsubway.passenger_web_feedback.model;

public class PassengerWebFeedback {
	private Integer webFeedbackId = null;
	/** ³Ë¿ÍId */
	private Integer passengerId = null;
	private String feedbackType = null;
	private String feedbackContent = null;
	public Integer getWebFeedbackId() {
		return webFeedbackId;
	}
	public void setWebFeedbackId(Integer webFeedbackId) {
		this.webFeedbackId = webFeedbackId;
	}
	public Integer getPassengerId() {
		return passengerId;
	}
	public void setPassengerId(Integer passengerId) {
		this.passengerId = passengerId;
	}
	public String getFeedbackType() {
		return feedbackType;
	}
	public void setFeedbackType(String feedbackType) {
		this.feedbackType = feedbackType;
	}
	public String getFeedbackContent() {
		return feedbackContent;
	}
	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent;
	}
	public PassengerWebFeedback() {
		super();
	}
	public PassengerWebFeedback(Integer passengerId, String feedbackType, String feedbackContent) {
		super();
		this.passengerId = passengerId;
		this.feedbackType = feedbackType;
		this.feedbackContent = feedbackContent;
	}
	public PassengerWebFeedback(Integer webFeedbackId, Integer passengerId, String feedbackType,
			String feedbackContent) {
		super();
		this.webFeedbackId = webFeedbackId;
		this.passengerId = passengerId;
		this.feedbackType = feedbackType;
		this.feedbackContent = feedbackContent;
	}
}

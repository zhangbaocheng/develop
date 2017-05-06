package com.nanjingsubway.passenger_android_feedback.model;

public class PassengerAndroidFeedback {
	private Integer androidFeedbackId = null;
	private Integer passengerId = null;
	private String feedbackType = null;
	private String feedbackContent = null;
	public Integer getAndroidFeedbackId() {
		return androidFeedbackId;
	}
	public void setAndroidFeedbackId(Integer androidFeedbackId) {
		this.androidFeedbackId = androidFeedbackId;
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
	public PassengerAndroidFeedback(Integer androidFeedbackId, Integer passengerId, String feedbackType,
			String feedbackContent) {
		super();
		this.androidFeedbackId = androidFeedbackId;
		this.passengerId = passengerId;
		this.feedbackType = feedbackType;
		this.feedbackContent = feedbackContent;
	}
	public PassengerAndroidFeedback() {
		super();
	}
	public PassengerAndroidFeedback(Integer passengerId, String feedbackType, String feedbackContent) {
		super();
		this.passengerId = passengerId;
		this.feedbackType = feedbackType;
		this.feedbackContent = feedbackContent;
	}
	
}

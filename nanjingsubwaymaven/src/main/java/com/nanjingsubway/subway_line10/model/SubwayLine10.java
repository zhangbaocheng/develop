package com.nanjingsubway.subway_line10.model;

public class SubwayLine10 {
	private Integer siteId = null;
	/** վ����� */
	private Integer siteNumber = null;
	/** վ������ */
	private String siteName = null;
	/** վ�㲥����ϸ���� */
	private String siteDetails = null;
	/** �Ƿ�ɻ���(��ʽ��[y|n]�� */
	private String transfered = null;
	/** �ɻ��˵���·(��ʽ:��·~��·~��·���м�ķ���ΪӢ�İ�ķ��ţ� */
	private String transferedLines = null;
	/** ��վ���Ƿ�ɳ�ֵ */
	private String recharged = null;
	/** �Ƿ��������� */
	private String toilet = null;
	public Integer getSiteId() {
		return siteId;
	}
	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}
	public Integer getSiteNumber() {
		return siteNumber;
	}
	public void setSiteNumber(Integer siteNumber) {
		this.siteNumber = siteNumber;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getSiteDetails() {
		return siteDetails;
	}
	public void setSiteDetails(String siteDetails) {
		this.siteDetails = siteDetails;
	}
	public String getTransfered() {
		return transfered;
	}
	public void setTransfered(String transfered) {
		this.transfered = transfered;
	}
	public String getTransferedLines() {
		return transferedLines;
	}
	public void setTransferedLines(String transferedLines) {
		this.transferedLines = transferedLines;
	}
	public String getRecharged() {
		return recharged;
	}
	public void setRecharged(String recharged) {
		this.recharged = recharged;
	}
	public String getToilet() {
		return toilet;
	}
	public void setToilet(String toilet) {
		this.toilet = toilet;
	}
	public SubwayLine10() {
	}
	public SubwayLine10(Integer siteNumber, String siteName, String siteDetails, String transfered,
			String transferedLines, String recharged, String toilet) {
		super();
		this.siteNumber = siteNumber;
		this.siteName = siteName;
		this.siteDetails = siteDetails;
		this.transfered = transfered;
		this.transferedLines = transferedLines;
		this.recharged = recharged;
		this.toilet = toilet;
	}
	public SubwayLine10(Integer siteId, Integer siteNumber, String siteName, String siteDetails, String transfered,
			String transferedLines, String recharged, String toilet) {
		super();
		this.siteId = siteId;
		this.siteNumber = siteNumber;
		this.siteName = siteName;
		this.siteDetails = siteDetails;
		this.transfered = transfered;
		this.transferedLines = transferedLines;
		this.recharged = recharged;
		this.toilet = toilet;
	}
}

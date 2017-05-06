package com.nanjingsubway.subway_lines.model;

public class SubwayLineSite {
	private Integer siteId = null;
	/** 站点序号 */
	private Integer siteNumber = null;
	/** 所在的线路 */
	private String lineNumber = null;
	/** 站点名称 */
	private String siteName = null;
	/** 站点播报详细内容 */
	private String siteDetails = null;
	/** 是否可换乘（格式【y|n】） */
	private String transfered = null;
	/** 可换乘的线路（格式：线路~线路~线路，中间的~为英文版的符号） */
	private String transferedLines = null;
	/**	该站点是否可充值 */
	private String recharged = null;
	/** 是否有卫生间 */
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
	public String getLineNumber() {
		return lineNumber;
	}
	public void setLineNumber(String lineNumber) {
		this.lineNumber = lineNumber;
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
	public SubwayLineSite() {
		super();
	}
	public SubwayLineSite(Integer siteNumber, String siteName, String siteDetails, String transfered,
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
	public SubwayLineSite(Integer siteId, Integer siteNumber, String lineNumber,String siteName, String siteDetails, String transfered,
			String transferedLines, String recharged, String toilet) {
		super();
		this.siteId = siteId;
		this.siteNumber = siteNumber;
		this.lineNumber = lineNumber;
		this.siteName = siteName;
		this.siteDetails = siteDetails;
		this.transfered = transfered;
		this.transferedLines = transferedLines;
		this.recharged = recharged;
		this.toilet = toilet;
	}
	@Override
	public String toString() {
		return "SubwayLineSite [siteId=" + siteId + ", siteNumber=" + siteNumber + ", lineNumber=" + lineNumber
				+ ", siteName=" + siteName + ", siteDetails=" + siteDetails + ", transfered=" + transfered
				+ ", transferedLines=" + transferedLines + ", recharged=" + recharged + ", toilet=" + toilet + "]";
	}
}

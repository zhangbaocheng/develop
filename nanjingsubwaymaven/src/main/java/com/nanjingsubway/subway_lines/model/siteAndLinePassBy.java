package com.nanjingsubway.subway_lines.model;

public class siteAndLinePassBy {
	private SubwayLineSite subwayLineSite;
	private Boolean needTransfered;
	public SubwayLineSite getSubwayLineSite() {
		return subwayLineSite;
	}
	public void setSubwayLineSite(SubwayLineSite subwayLineSite) {
		this.subwayLineSite = subwayLineSite;
	}
	public Boolean getNeedTransfered() {
		return needTransfered;
	}
	public void setNeedTransfered(Boolean needTransfered) {
		this.needTransfered = needTransfered;
	}
	@Override
	public String toString() {
		return "siteAndLinePassBy [subwayLineSite=" + subwayLineSite + ", needTransfered=" + needTransfered + "]";
	}
	
}

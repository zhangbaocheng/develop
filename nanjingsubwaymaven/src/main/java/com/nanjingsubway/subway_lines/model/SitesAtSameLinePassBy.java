package com.nanjingsubway.subway_lines.model;

import java.util.List;

public class SitesAtSameLinePassBy {
	/** 经过的站点 */
	List<SubwayLineSite> subwayLineSites;
	/** 所在的线路 */
	String lineNumber;
	/** 所需价格 */
	float price;
	public List<SubwayLineSite> getSubwayLineSites() {
		return subwayLineSites;
	}
	public void setSubwayLineSites(List<SubwayLineSite> subwayLineSites) {
		this.subwayLineSites = subwayLineSites;
	}
	public String getLineNumber() {
		return lineNumber;
	}
	public void setLineNumber(String lineNumber) {
		this.lineNumber = lineNumber;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "SitesAtSameLinePassBy [subwayLineSites=" + subwayLineSites + ", lineNumber=" + lineNumber + ", price="
				+ price + "]";
	}
	
}

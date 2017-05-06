package com.nanjingsubway.subway_lines.model;

public class LineNumberPassBy {
	private String lineNumber = null;
	private Boolean isErgodic = null;
	public String getLineNumber() {
		return lineNumber;
	}
	public void setLineNumber(String lineNumber) {
		this.lineNumber = lineNumber;
	}
	public Boolean getIsErgodic() {
		return isErgodic;
	}
	public void setIsErgodic(Boolean isErgodic) {
		this.isErgodic = isErgodic;
	}
	public LineNumberPassBy(String lineNumber, Boolean isErgodic) {
		super();
		this.lineNumber = lineNumber;
		this.isErgodic = isErgodic;
	}
	@Override
	public String toString() {
		return "LineNumberPassBy [lineNumber=" + lineNumber + ", isErgodic=" + isErgodic + "]";
	}
}

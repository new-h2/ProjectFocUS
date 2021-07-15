package service.model.vo;

import member.model.vo.Member;

public class Reserve {
	
	private int rUserNo;
	private int rBNo;
	private String rTitle;
	private String rWriter;
	private String rLocation;
	private String rTime;
	
	
	public Reserve() {}


	public Reserve(int rUserNo, int rBNo, String rTitle, String rWriter, String rLocation, String rTime) {
		super();
		this.rUserNo = rUserNo;
		this.rBNo = rBNo;
		this.rTitle = rTitle;
		this.rWriter = rWriter;
		this.rLocation = rLocation;
		this.rTime = rTime;
	}


	public int getrUserNo() {
		return rUserNo;
	}


	public void setrUserNo(int rUserNo) {
		this.rUserNo = rUserNo;
	}


	public int getrBNo() {
		return rBNo;
	}


	public void setrBNo(int rBNo) {
		this.rBNo = rBNo;
	}


	public String getrTitle() {
		return rTitle;
	}


	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}


	public String getrWriter() {
		return rWriter;
	}


	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}


	public String getrLocation() {
		return rLocation;
	}


	public void setrLocation(String rLocation) {
		this.rLocation = rLocation;
	}


	public String getrTime() {
		return rTime;
	}


	public void setrTime(String rTime) {
		this.rTime = rTime;
	}


	@Override
	public String toString() {
		return "Reserve [rUserNo=" + rUserNo + ", rBNo=" + rBNo + ", rTitle=" + rTitle + ", rWriter=" + rWriter
				+ ", rLocation=" + rLocation + ", rTime=" + rTime + "]";
	}
	
	
}	

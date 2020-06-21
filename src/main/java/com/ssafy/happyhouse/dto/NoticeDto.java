package com.ssafy.happyhouse.dto;

public class NoticeDto {
	private int no;
	private String id;
	private String subject;
	private String content;
	private String regtime;
	
	public NoticeDto() {
	}
	
	@Override
	public String toString() {
		return "NoticeDto [no=" + no + ", id=" + id + ", subject=" + subject + ", content=" + content + ", regtime="
				+ regtime + "]";
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	
	
}

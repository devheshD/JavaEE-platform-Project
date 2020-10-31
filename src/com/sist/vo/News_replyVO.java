package com.sist.vo;

import java.sql.*;

public class News_replyVO {
	private int news_no;
	private String id;
	private String pwd;
	private String content;
	private Date regdate;
	private String no;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public int getNews_no() {
		return news_no;
	}
	public void setNews_no(int news_no) {
		this.news_no = news_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}

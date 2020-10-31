package com.sist.vo;

import java.util.*;

public class NewsVO {
	private int news_no;
	private String title;
	private String thumbnail_img;
	private String detail_img;
	private String content;
	private String news_date;
	private String reporter;
	private String news_company;

	public int getNews_no() {
		return news_no;
	}

	public void setNews_no(int news_no) {
		this.news_no = news_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail_img() {
		return thumbnail_img;
	}

	public void setThumbnail_img(String thumbnail_img) {
		this.thumbnail_img = thumbnail_img;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getNews_company() {
		return news_company;
	}

	public void setNews_company(String news_company) {
		this.news_company = news_company;
	}

	public String getDetail_img() {
		return detail_img;
	}

	public void setDetail_img(String detail_img) {
		this.detail_img = detail_img;
	}

	public String getNews_date() {
		return news_date;
	}

	public void setNews_date(String news_date) {
		this.news_date = news_date;
	}

}

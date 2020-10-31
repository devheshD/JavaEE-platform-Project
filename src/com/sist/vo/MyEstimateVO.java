package com.sist.vo;

import java.util.Date;

public class MyEstimateVO {
	private int eno;
	private Date estimate_date;
	private String my_car_poster;
	private String my_car_name;
	private String my_model_name;
	private String my_trim_name;
	private int my_totalPrice;
	
	
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public Date getEstimate_date() {
		return estimate_date;
	}
	public void setEstimate_date(Date estimate_date) {
		this.estimate_date = estimate_date;
	}
	public String getMy_car_poster() {
		return my_car_poster;
	}
	public void setMy_car_poster(String my_car_poster) {
		this.my_car_poster = my_car_poster;
	}
	public String getMy_car_name() {
		return my_car_name;
	}
	public void setMy_car_name(String my_car_name) {
		this.my_car_name = my_car_name;
	}
	public String getMy_model_name() {
		return my_model_name;
	}
	public void setMy_model_name(String my_model_name) {
		this.my_model_name = my_model_name;
	}
	public String getMy_trim_name() {
		return my_trim_name;
	}
	public void setMy_trim_name(String my_trim_name) {
		this.my_trim_name = my_trim_name;
	}
	public int getMy_totalPrice() {
		return my_totalPrice;
	}
	public void setMy_totalPrice(int my_totalPrice) {
		this.my_totalPrice = my_totalPrice;
	}
	
}

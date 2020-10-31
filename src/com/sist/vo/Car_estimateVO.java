package com.sist.vo;

import java.util.Date;

public class Car_estimateVO {
	private String id;
	private String model_num;
	private String trim_num;
	private Date estimate_date;
	private int estimate_car_price;
	private int estimate_option_price;
	private int estimate_total_price;
	private int estimate_budget;
	private int estimate_debt;
	private int estimate_months;
	private int monthly_installment;
	private String option_choice;
	private int eno;
	
	
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getOption_choice() {
		return option_choice;
	}
	public void setOption_choice(String option_choice) {
		this.option_choice = option_choice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getModel_num() {
		return model_num;
	}
	public void setModel_num(String model_num) {
		this.model_num = model_num;
	}
	public String getTrim_num() {
		return trim_num;
	}
	public void setTrim_num(String trim_num) {
		this.trim_num = trim_num;
	}
	public Date getEstimate_date() {
		return estimate_date;
	}
	public void setEstimate_date(Date estimate_date) {
		this.estimate_date = estimate_date;
	}
	public int getEstimate_car_price() {
		return estimate_car_price;
	}
	public void setEstimate_car_price(int estimate_car_price) {
		this.estimate_car_price = estimate_car_price;
	}
	public int getEstimate_option_price() {
		return estimate_option_price;
	}
	public void setEstimate_option_price(int estimate_option_price) {
		this.estimate_option_price = estimate_option_price;
	}
	public int getEstimate_total_price() {
		return estimate_total_price;
	}
	public void setEstimate_total_price(int estimate_total_price) {
		this.estimate_total_price = estimate_total_price;
	}
	public int getEstimate_budget() {
		return estimate_budget;
	}
	public void setEstimate_budget(int estimate_budget) {
		this.estimate_budget = estimate_budget;
	}
	public int getEstimate_debt() {
		return estimate_debt;
	}
	public void setEstimate_debt(int estimate_debt) {
		this.estimate_debt = estimate_debt;
	}
	public int getEstimate_months() {
		return estimate_months;
	}
	public void setEstimate_months(int estimate_months) {
		this.estimate_months = estimate_months;
	}
	public int getMonthly_installment() {
		return monthly_installment;
	}
	public void setMonthly_installment(int monthly_installment) {
		this.monthly_installment = monthly_installment;
	}
	
}

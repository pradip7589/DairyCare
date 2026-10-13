package com.nt.entity;

import java.time.LocalDate;

public class milkReport {

	private LocalDate date;
	private float milk;
	private float fat;
	private float snf;
	private float rate;
	private float amount;
	
	public milkReport() {}
	
	public milkReport(LocalDate date, float milk, float fat, float snf, float rate, float amount) {
		super();
		this.date = date;
		this.milk = milk;
		this.fat = fat;
		this.snf = snf;
		this.rate = rate;
		this.amount = amount;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate today) {
		this.date = today;
	}
	public float getMilk() {
		return milk;
	}
	public void setMilk(float milk) {
		this.milk = milk;
	}
	public float getFat() {
		return fat;
	}
	public void setFat(float fat) {
		this.fat = fat;
	}
	public float getSnf() {
		return snf;
	}
	public void setSnf(float snf) {
		this.snf = snf;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	
}

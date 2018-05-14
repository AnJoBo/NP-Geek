package com.techelevator.npgeek.model;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class Weather {

	private String parkCode;
	private int forecastDay;
	private BigDecimal low;
	private BigDecimal high;
	private String forecast;
	
	
	
	public String getParkCode() {
		return parkCode;
	}
	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}
	public int getForecastDay() {
		return forecastDay;
	}
	public void setForecastDay(int forecastDay) {
		this.forecastDay = forecastDay;
	}
	public BigDecimal getLow() {
		return low;
	}
	public BigDecimal getLowC() {
		BigDecimal lowC = low.subtract(new BigDecimal("32"));
		lowC = lowC.multiply(new BigDecimal("0.556"));
		return lowC.setScale(2, RoundingMode.CEILING);
	}
	public void setLow(BigDecimal low) {
		this.low = low;
	}
	public BigDecimal getHigh() {
		return high;
	}
	public BigDecimal getHighC() { 
		BigDecimal highC = high.subtract(new BigDecimal("32"));
		highC = highC.multiply(new BigDecimal("0.556"));
		return highC.setScale(2, RoundingMode.CEILING);
	}
	public void setHigh(BigDecimal high) {
		this.high = high;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}
	
	
	
}

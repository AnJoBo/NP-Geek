package com.techelevator.npgeek.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.model.Weather;

@Component
public class JdbcWeatherDao implements WeatherDao {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcWeatherDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Weather> getParkForecast(String parkCode) {
		List<Weather> parkForecast = new ArrayList<>();
		String sqlSelectParkByParkCode = "SELECT * FROM weather WHERE parkcode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectParkByParkCode, parkCode);
		while(results.next()) {
			parkForecast.add(mapRowToWeather(results));
		}
		return parkForecast;
	}
	
	private Weather mapRowToWeather(SqlRowSet row) {
		Weather weatherInfo = new Weather();
		weatherInfo.setParkCode(row.getString("parkcode"));
		weatherInfo.setForecastDay(row.getInt("fivedayforecastvalue"));
		weatherInfo.setLow(row.getBigDecimal("low"));
		weatherInfo.setHigh(row.getBigDecimal("high"));
		weatherInfo.setForecast(row.getString("forecast"));
		
		return weatherInfo;
	}

}

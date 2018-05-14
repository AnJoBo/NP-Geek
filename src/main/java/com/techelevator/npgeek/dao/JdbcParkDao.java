package com.techelevator.npgeek.dao;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.Survey;

@Component
public class JdbcParkDao implements ParkDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcParkDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Park> getAllParks() {
		List<Park> allParks = new ArrayList<>();
		String sqlSelectAllParks = "SELECT * FROM park";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllParks);
		while(results.next()) {
			allParks.add(mapRowToPark(results));
		}
		return allParks;
	}

	@Override
	public Park getParkByCode(String parkCode) {
		Park park = null;
		String sqlSelectParkByParkCode = "SELECT * FROM park WHERE parkcode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectParkByParkCode, parkCode);
		if(results.next()) {
			park = mapRowToPark(results);
		}
		return park;
	}
	
	@Override
	public Survey saveFavorite(Survey newSurvey) {
		String insertSql = "INSERT into survey_result (parkcode, emailaddress, state, activitylevel) "
				+ "values (?,?,?,?) returning surveyid";
		
		long newId = jdbcTemplate.queryForObject(insertSql, Long.class,
							newSurvey.getParkCode(),
							newSurvey.getEmail(),
							newSurvey.getStateOfResidence(),
							newSurvey.getActivityLevel());
		
		newSurvey.setId(newId);
		
		return newSurvey;
	}
	
	@Override
	public List<Park> getFavoriteParks() {
		List<Park> favs = new ArrayList<>();
		String sqlSelectAllFavParks = "SELECT park.parkname, park.parkcode, COUNT(park.parkcode) "
				+ "FROM park "
				+ "LEFT OUTER JOIN survey_result "
				+ "ON park.parkcode = survey_result.parkcode "
				+ "GROUP BY park.parkcode ORDER BY park.parkcode";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllFavParks);
		while(results.next()) {
			favs.add(mapRowToVotes(results));
		}
		return favs;
	}
	
	private Park mapRowToVotes(SqlRowSet row) {
		Park parkInfo = new Park();
		parkInfo.setVoteCount(row.getInt("count"));
		parkInfo.setParkName(row.getString("parkname"));
		parkInfo.setParkCode(row.getString("parkcode"));
		return parkInfo;

	}
	
	private Park mapRowToPark(SqlRowSet row) {
		Park parkInfo = new Park();
		parkInfo.setParkCode(row.getString("parkcode"));
		parkInfo.setParkName(row.getString("parkname"));
		parkInfo.setState(row.getString("state"));
		parkInfo.setAcreage(row.getInt("acreage"));
		parkInfo.setElevationInFeet(row.getInt("elevationinfeet"));
		parkInfo.setMilesOfTrail(row.getDouble("milesOfTrail"));
		parkInfo.setNumberOfCampsites(row.getInt("numberOfCampsites"));
		parkInfo.setClimate(row.getString("climate"));
		parkInfo.setYearFounded(row.getInt("yearFounded"));
		parkInfo.setAnnualVisitorCount(row.getInt("annualVisitorCount"));
		parkInfo.setInspirationalQuote(row.getString("inspirationalQuote"));
		parkInfo.setInspirationalQuoteSource(row.getString("inspirationalQuoteSource"));
		parkInfo.setParkDescription(row.getString("parkDescription"));
		parkInfo.setEntryFee(row.getInt("entryFee"));
		parkInfo.setNumberOfAnimalSpecies(row.getInt("numberOfAnimalSpecies"));

		return parkInfo;
	}
	
}

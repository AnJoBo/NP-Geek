package com.techelevator.npgeek.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.Survey;

public interface ParkDao {

	public List<Park> getAllParks();
	public Park getParkByCode(String parkCode);
	public Survey saveFavorite(Survey newSurvey);
	public List<Park> getFavoriteParks();
}

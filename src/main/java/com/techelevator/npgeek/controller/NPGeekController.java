package com.techelevator.npgeek.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.npgeek.dao.ParkDao;
import com.techelevator.npgeek.dao.WeatherDao;
import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.Weather;

@Controller 
public class NPGeekController {

	@Autowired
	private ParkDao parkDao;
	@Autowired
	private WeatherDao weatherDao;
	
	@RequestMapping(path="/", method=RequestMethod.GET)
		public String displayParks(ModelMap modelHolder) {
			List<Park> allParks = parkDao.getAllParks();
			modelHolder.put("parks", allParks);
			return "homePage";
	}
	
	@RequestMapping(path="parkDetail/{parkCode}", method=RequestMethod.GET)
	public String showParkDetail(@PathVariable String parkCode, @RequestParam(defaultValue="f") String tempForm, ModelMap modelHolder) {
		Park park = parkDao.getParkByCode(parkCode);
		modelHolder.put("park", park);
		
		List<Weather> parkForecast = weatherDao.getParkForecast(parkCode);
		modelHolder.put("weather", parkForecast);
		
		return "parkDetail";
	}
	
	@RequestMapping(path="parkDetail/{parkCode}", method=RequestMethod.POST)
	public String showRequestedTempFormat(@RequestParam String tempForm, HttpSession session) {
		
		session.setAttribute("tempForm", tempForm);
		
		return "redirect:/parkDetail/{parkCode}";
	}
	
	@RequestMapping(path="/survey", method=RequestMethod.GET)
	public String displaySurvey(ModelMap modelHolder) {
		
		List<Park> allParks = parkDao.getAllParks();
		modelHolder.put("parks", allParks);
		
		return "survey";
	}
	
	@RequestMapping(path="/favoriteParks", method=RequestMethod.GET)
	public String getSurvayedParks(ModelMap modelHolder) {
		
		List<Park> survayedParks = parkDao.getFavoriteParks();
		modelHolder.put("parks", survayedParks);
		
		return "favoriteParks";
	}
	
	@RequestMapping(path="/survey", method=RequestMethod.POST)
	public String saveFavoriteParks(@Valid @ModelAttribute Survey newSurvey,
		BindingResult result, RedirectAttributes flashData){
		parkDao.saveFavorite(newSurvey);
		if(result.hasErrors()) {
			flashData.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "survey", result);
			flashData.addFlashAttribute("survey", newSurvey);
			return "redirect:/survey";
		}
		
		flashData.addFlashAttribute("message", "Thank you for your vote!");
		
		return "redirect:/favoriteParks";
	}
	
}
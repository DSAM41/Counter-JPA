package counter.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import counter.model.Airport;
import counter.service.AirportService;

@RestController
public class AirportController {
	
	@Autowired
	private AirportService airportService;
	
	@GetMapping("airport")
	public List<Airport> showAirport(Model model) {
		return airportService.getAirport();
	}
}

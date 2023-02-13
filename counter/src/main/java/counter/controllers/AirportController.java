package counter.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import counter.model.Airport;
import counter.service.AirportService;

@RestController
public class AirportController {
	
	@Autowired
	private AirportService airportService;
	
	@GetMapping("airport/all")
	public List<Airport> showAirport() {
		return airportService.getAirport();
	}
}

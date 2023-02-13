package counter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import counter.model.Airport;
import counter.repository.AirportRepository;

@Service
public class AirportService {

	@Autowired
	AirportRepository airportRepo;

	// READ
	public List<Airport> getAirport() {
		return airportRepo.findAllByOrderByApcAsc();
	}
}

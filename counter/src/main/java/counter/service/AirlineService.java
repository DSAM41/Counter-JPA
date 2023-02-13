package counter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import counter.model.Airline;
import counter.repository.AirlineRepository;

@Service
public class AirlineService {
	
	@Autowired
	AirlineRepository airlineRepo;
	
	// READ
		public List<Airline> getAirline() {
			return airlineRepo.findByAlc2Not("  ");
		}

}

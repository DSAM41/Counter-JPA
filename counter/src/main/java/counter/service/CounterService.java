package counter.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import counter.model.Counter;
import counter.repository.CounterRepository;

@Service
public class CounterService {

	@Autowired
	CounterRepository counterRepo;

	// READ
	public List<Counter> getCounter() {
		return counterRepo.findAll();
	}

	// DELETE
	public void deleteCounter(Counter model) {
		counterRepo.delete(model);
	}

	// UPDATE
	public Counter updateCounter(Counter model) {
		return counterRepo.save(model);
	}

	
	// CREATE
		public Counter createCounter(Counter model) {
			Optional<Counter> Counter = counterRepo.findById(model.getId());
			if (!Counter.isPresent()) {
		        return counterRepo.save(model);
		    }
		    return null;
		}

	// SEARCH
	public List<Counter> searchCounter(String hopo, String flti, String alc, String counter) {
		List<Counter> Counter = counterRepo.findByIdHopoContainingAndIdFltiContainingAndIdAlcContainingAndCounterContaining(hopo, flti, alc,counter);
		if (Counter.size() != 0) {
			return Counter;
		} 
		return null;
	}

}

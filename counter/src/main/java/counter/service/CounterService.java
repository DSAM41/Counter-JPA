package counter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import counter.model.Counter;
import counter.model.CounterEmbeddable;
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
	public void deleteCounter(String hopo, String flti, String alc) {
		counterRepo.deleteByIdHopoAndIdFltiAndAndIdAlc(hopo, flti, alc);
	}

	// UPDATE
	public void updateCounter(String hopo, String flti, String alc, String counter) {
		List<Counter> Counter = counterRepo.findByIdHopoAndIdFltiAndIdAlc(hopo, flti, alc);
		Counter.get(0).setCounter(counter);
		counterRepo.save(Counter.get(0));
	}

	// CREATE
	public void createCounter(String hopo, String flti, String alc, String counter) {
//		List<Counter> Check_Counter = counterRepo.findByIdHopoAndIdFltiAndIdAlc(hopo, flti, alc);
		Counter Counter = new Counter(new CounterEmbeddable(hopo, flti, alc), counter);
		counterRepo.save(Counter);
//		return Check_Counter.size();
	}

	// SEARCH
	public List<Counter> searchCounter(String hopo, String flti, String alc, String counter) {
		List<Counter> Counter = counterRepo.findByIdHopoContainingAndIdFltiContainingAndIdAlcContainingAndCounterContaining(hopo, flti, alc, counter);
		if (Counter.size() == 0) {
			return null;
		} else {
			return Counter;
		}
	}

}

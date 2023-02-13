package counter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import counter.model.Airline;

@Repository
public interface AirlineRepository extends JpaRepository<Airline, String> {
	
	List<Airline> findByAlc2Not(String alc2);

}

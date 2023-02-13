package counter.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import counter.model.Airport;

@Repository
public interface AirportRepository extends JpaRepository<Airport, String> {

	List<Airport> findAllByOrderByApcAsc();

}
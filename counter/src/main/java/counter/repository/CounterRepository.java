package counter.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import counter.model.Counter;
import counter.model.CounterEmbeddable;

import java.util.List;

@Repository
public interface CounterRepository extends JpaRepository<Counter, CounterEmbeddable> {
	
	List<Counter> findByIdHopoContainingAndIdFltiContainingAndIdAlcContainingAndCounterContaining(String hopo, String flti, String alc, String counter);

//	List<Counter> findByIdHopo(String hopo);
//
//	List<Counter> findByIdFlti(String flti);
//
//	List<Counter> findByIdAlc(String alc);

	List<Counter> findByIdHopoAndIdFltiAndIdAlc(String hopo, String flti, String alc);

//	List<Counter> deleteByIdHopoAndIdFltiAndAndIdAlc(String hopo, String flti, String alc);

//	@Query(value = "SELECT * FROM COUNTER WHERE HOPO LIKE %:hopo% AND FLTI LIKE %:flti% AND ALC2 LIKE %:alc% AND COUNTER LIKE %:counter%", nativeQuery = true)
//	List<Counter> findByDefine(String hopo, String flti, String alc, String counter);
}
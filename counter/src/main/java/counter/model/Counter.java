package counter.model;


import javax.persistence.EmbeddedId;
import javax.persistence.Entity;


@Entity
public class Counter {	
	
	@EmbeddedId
	private CounterEmbeddable id;
	private String counter;
	
	public Counter() {
    }
	
	public Counter(CounterEmbeddable id, String counter) {
		this.id = id;
		this.counter = counter;
	}

	public CounterEmbeddable getId() {
		return id;
	}

	public void setId(CounterEmbeddable id) {
		this.id = id;
	}

	public String getCounter() {
		return counter;
	}

	public void setCounter(String counter) {
		this.counter = counter;
	}
	
}

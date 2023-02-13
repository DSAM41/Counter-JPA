package counter.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CounterEmbeddable implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "HOPO")
	private String hopo;
	@Column(name = "FLTI")
	private String flti;
	@Column(name = "ALC2")
	private String alc;

	public CounterEmbeddable() {

	}

	public CounterEmbeddable(String hopo, String flti, String alc) {
		super();
		this.hopo = hopo;
		this.flti = flti;
		this.alc = alc;
	}

	public String getHopo() {
		return hopo;
	}

	public void setHopo(String hopo) {
		this.hopo = hopo;
	}

	public String getFlti() {
		return flti;
	}

	public void setFlti(String flti) {
		this.flti = flti;
	}

	public String getAlc() {
		return alc;
	}

	public void setAlc(String alc) {
		this.alc = alc;
	}
}
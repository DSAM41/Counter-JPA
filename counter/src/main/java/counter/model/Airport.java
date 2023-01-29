package counter.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Airport {	
	
	@Id
	@Column(name = "APC3")
	private String apc;
	@Column(name = "APFN")
	private String apfn;
	@Column(name = "APSN")
	private String apsn;
	
	public Airport() {
    }

	public Airport(String apc, String apfn, String apsn) {
		super();
		this.apc = apc;
		this.apfn = apfn;
		this.apsn = apsn;
	}

	public String getApc() {
		return apc;
	}

	public void setApc(String apc) {
		this.apc = apc;
	}

	public String getApfn() {
		return apfn;
	}

	public void setApfn(String apfn) {
		this.apfn = apfn;
	}

	public String getApsn() {
		return apsn;
	}

	public void setApsn(String apsn) {
		this.apsn = apsn;
	}
	
	
}
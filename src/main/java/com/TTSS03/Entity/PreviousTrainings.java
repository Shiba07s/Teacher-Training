package com.TTSS03.Entity;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tprevioustrainings")
public class PreviousTrainings {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int slno;
	private String treasuryid;
	private String trainingname;
	private String trainingmode;
	private String resourcetype;
	private String state;
	private String numberofdays;
	private String status="Attended";
	public int getSlno() {
		return slno;
	}
	public void setSlno(int slno) {
		this.slno = slno;
	}
	public String getTrainingname() {
		return trainingname;
	}
	public void setTrainingname(String trainingname) {
		this.trainingname = trainingname;
	}
	public String getTrainingmode() {
		return trainingmode;
	}
	public void setTrainingmode(String trainingmode) {
		this.trainingmode = trainingmode;
	}
	public String getResourcetype() {
		return resourcetype;
	}
	public void setResourcetype(String resourcetype) {
		this.resourcetype = resourcetype;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getNumberofdays() {
		return numberofdays;
	}
	public void setNumberofdays(String numberofdays) {
		this.numberofdays = numberofdays;
	}
	public String getTreasuryid() {
		return treasuryid;
	}
	public void setTreasuryid(String treasuryid) {
		this.treasuryid = treasuryid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}

package com.TTSS03.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tmandal_master")
public class MandalMaster {

    @Id
    private int MID; 
    private String Mname; 
    private String District; 
    private String State; 
    private String CreatedBy; 
    private String CreatedDt; 
    private String ModifiedBy; 
    private String ModifiedDt; 
    private String RecordStatus;
    
	public int getMID() {
		return MID;
	}
	public void setMID(int mID) {
		MID = mID;
	}
	public String getMname() {
		return Mname;
	}
	public void setMname(String mname) {
		Mname = mname;
	}
	public String getDistrict() {
		return District;
	}
	public void setDistrict(String district) {
		District = district;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getCreatedBy() {
		return CreatedBy;
	}
	public void setCreatedBy(String createdBy) {
		CreatedBy = createdBy;
	}
	public String getCreatedDt() {
		return CreatedDt;
	}
	public void setCreatedDt(String createdDt) {
		CreatedDt = createdDt;
	}
	public String getModifiedBy() {
		return ModifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		ModifiedBy = modifiedBy;
	}
	public String getModifiedDt() {
		return ModifiedDt;
	}
	public void setModifiedDt(String modifiedDt) {
		ModifiedDt = modifiedDt;
	}
	public String getRecordStatus() {
		return RecordStatus;
	}
	public void setRecordStatus(String recordStatus) {
		RecordStatus = recordStatus;
	}
	 
    

}

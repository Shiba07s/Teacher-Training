package com.TTSS03.Entity;

import javax.persistence.Entity;
 
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tdistrict_master")
public class DistrictMaster {
	
	 @Id
	    private int DID; 
	    private String DName; 
	    private String State; 
	    private String CreatedBy; 
	    private String CreatedDt; 
	    private String ModifiedBy; 
	    private String ModifiedDt; 
	    private String RecordStatus;
		public int getDID() {
			return DID;
		}
		public void setDID(int dID) {
			DID = dID;
		}
		public String getDName() {
			return DName;
		}
		public void setDName(String dName) {
			DName = dName;
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

package com.TTSS03.Entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bdg_venderlimit")
public class VendorLimit {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	  private long sl;
	    private String budgetedYear;
	    private String trainingName;
	    private String vendorName;
	    @Column(name="approved_rate")

	    private String approvedrate;
	    @Column(name="actual_rate")
	    private String actualrate;
	    private String unit;
	    private String remarks;
	    private String createdBy;
	    private String modifiedBy;
	    
	    private String recordStatus;
		public long getSl() {
			return sl;
		}
		public void setSl(long sl) {
			this.sl = sl;
		}
		public String getBudgetedYear() {
			return budgetedYear;
		}
		public void setBudgetedYear(String budgetedYear) {
			this.budgetedYear = budgetedYear;
		}
		public String getTrainingName() {
			return trainingName;
		}
		public void setTrainingName(String trainingName) {
			this.trainingName = trainingName;
		}
		public String getVendorName() {
			return vendorName;
		}
		public void setVendorName(String vendorName) {
			this.vendorName = vendorName;
		}
		public String getApprovedrate() {
			return approvedrate;
		}
		public void setApprovedrate(String approvedrate) {
			this.approvedrate = approvedrate;
		}
		public String getActualrate() {
			return actualrate;
		}
		public void setActualrate(String actualrate) {
			this.actualrate = actualrate;
		}
		public String getUnit() {
			return unit;
		}
		public void setUnit(String unit) {
			this.unit = unit;
		}
		public String getRemarks() {
			return remarks;
		}
		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}
		public String getCreatedBy() {
			return createdBy;
		}
		public void setCreatedBy(String createdBy) {
			this.createdBy = createdBy;
		}
		public String getModifiedBy() {
			return modifiedBy;
		}
		public void setModifiedBy(String modifiedBy) {
			this.modifiedBy = modifiedBy;
		}
		
		public String getRecordStatus() {
			return recordStatus;
		}
		public void setRecordStatus(String recordStatus) {
			this.recordStatus = recordStatus;
		}
		

}

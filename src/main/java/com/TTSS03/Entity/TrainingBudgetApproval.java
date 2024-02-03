package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bdg_trainingapprovals")
public class TrainingBudgetApproval {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sl")
    private long sl;

    @Column(name = "budgeted_year")
    private Integer budgetedYear;

    @Column(name = "training_name")
    private String trainingName;

    @Column(name = "training_no")
    private String trainingNo;

    @Column(name = "tc_code")
    private String tcCode;

    @Column(name = "budgeted_amt")
    private Double budgetedAmount;

    @Column(name = "approved_amt")
    private Double approvedAmount;

    @Column(name = "remarks")
    private String remarks;
 
    @Column(name = "record_status")
    private String recordStatus;

	public long getSl() {
		return sl;
	}

	public void setSl(long sl) {
		this.sl = sl;
	}

	public Integer getBudgetedYear() {
		return budgetedYear;
	}

	public void setBudgetedYear(Integer budgetedYear) {
		this.budgetedYear = budgetedYear;
	}

	public String getTrainingName() {
		return trainingName;
	}

	public void setTrainingName(String trainingName) {
		this.trainingName = trainingName;
	}

	public String getTrainingNo() {
		return trainingNo;
	}

	public void setTrainingNo(String trainingNo) {
		this.trainingNo = trainingNo;
	}

	public String getTcCode() {
		return tcCode;
	}

	public void setTcCode(String tcCode) {
		this.tcCode = tcCode;
	}

	public Double getBudgetedAmount() {
		return budgetedAmount;
	}

	public void setBudgetedAmount(Double budgetedAmount) {
		this.budgetedAmount = budgetedAmount;
	}

	public Double getApprovedAmount() {
		return approvedAmount;
	}

	public void setApprovedAmount(Double approvedAmount) {
		this.approvedAmount = approvedAmount;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getRecordStatus() {
		return recordStatus;
	}

	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}
    
    


}

package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bdg_traineeslimit")
public class TraineesBudgetLimit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sl")
    private Long sl;

    @Column(name = "budgeted_year")
    private Integer budgetedYear;

    @Column(name = "trainee_role")
    private String traineeRole;

    @Column(name = "expense_type")
    private String expenseType;

    @Column(name = "city_type")
    private String cityType;

    @Column(name = "approved_rate")
    private Double approvedRate;

    @Column(name = "unit")
    private String unit;

    @Column(name = "remarks")
    private String remarks;

    

    @Column(name = "record_status")
    private String recordStatus="Active";



	public Long getSl() {
		return sl;
	}



	public void setSl(Long sl) {
		this.sl = sl;
	}



	public Integer getBudgetedYear() {
		return budgetedYear;
	}



	public void setBudgetedYear(Integer budgetedYear) {
		this.budgetedYear = budgetedYear;
	}



	public String getTraineeRole() {
		return traineeRole;
	}



	public void setTraineeRole(String traineeRole) {
		this.traineeRole = traineeRole;
	}



	public String getExpenseType() {
		return expenseType;
	}



	public void setExpenseType(String expenseType) {
		this.expenseType = expenseType;
	}



	public String getCityType() {
		return cityType;
	}



	public void setCityType(String cityType) {
		this.cityType = cityType;
	}



	public Double getApprovedRate() {
		return approvedRate;
	}



	public void setApprovedRate(Double approvedRate) {
		this.approvedRate = approvedRate;
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



	public String getRecordStatus() {
		return recordStatus;
	}



	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}



}

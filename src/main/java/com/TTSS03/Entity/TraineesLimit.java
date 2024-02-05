package com.TTSS03.Entity;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name = "bdg_traineeslimit")
public class TraineesLimit {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sl")
    private long sl;
 
    @Column(name = "budgeted_year")
    private String budgetedYear;
 
    @Column(name = "trainee_role")
    private String traineeRole;
 
    @Column(name = "expense_type")
    private String expenseType;
 
    @Column(name = "city_type")
    private String cityType;
 
    @Column(name = "approved_rate")
    private String approvedRate;
 
    @Column(name = "unit")
    private String unit;
 
    @Column(name = "remarks")
    private String remarks;
 
    @Column(name = "record_status")
    private String recordStatus="Active";
 
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
	public String getApprovedRate() {
		return approvedRate;
	}
	public void setApprovedRate(String approvedRate) {
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
 
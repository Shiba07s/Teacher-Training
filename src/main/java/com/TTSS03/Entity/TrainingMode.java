package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ttraining_mode")
public class TrainingMode {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mode_code")
	private long trainingModecode;
    @Column(name = "mode_name")
	private String trainingMode;
    @Column(name = "status")
	private String trainingStatus="Active";
	public long getTrainingModecode() {
		return trainingModecode;
	}
	public void setTrainingModecode(long trainingModecode) {
		this.trainingModecode = trainingModecode;
	}
	public String getTrainingMode() {
		return trainingMode;
	}
	public void setTrainingMode(String trainingMode) {
		this.trainingMode = trainingMode;
	}
	public String getTrainingStatus() {
		return trainingStatus;
	}
	public void setTrainingStatus(String trainingStatus) {
		this.trainingStatus = trainingStatus;
	}
    
}

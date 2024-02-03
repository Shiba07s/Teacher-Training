package com.TTSS03.Entity;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tcategorymaster")
public class TrainingCategoryMaster {
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 
	 private long uid;
	 private String trainingcategory;
	 private String status="Active";
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public String getTrainingcategory() {
		return trainingcategory;
	}
	public void setTrainingcategory(String trainingcategory) {
		this.trainingcategory = trainingcategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	 

}

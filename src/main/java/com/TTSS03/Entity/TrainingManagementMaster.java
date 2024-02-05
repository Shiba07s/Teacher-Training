package com.TTSS03.Entity;
 
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name="ttraining_management_master")
public class TrainingManagementMaster {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long management_code;
	private String management_name;
	private String management_short_name;
	private String status="Active";
	public long getManagement_code() {
		return management_code;
	}
	public void setManagement_code(long management_code) {
		this.management_code = management_code;
	}
	public String getManagement_name() {
		return management_name;
	}
	public void setManagement_name(String management_name) {
		this.management_name = management_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getManagement_short_name() {
		return management_short_name;
	}
	public void setManagement_short_name(String management_short_name) {
		this.management_short_name = management_short_name;
	}
}
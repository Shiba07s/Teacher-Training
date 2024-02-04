package com.TTSS03.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tgrademaster")
public class AttendGradeMaster {
	
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long slno;
	private String attendgrade;
	private String status="Active";
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public long getSlno() {
		return slno;
	}
	public void setSlno(long slno) {
		this.slno = slno;
	}
	public String getAttendgrade() {
		return attendgrade;
	}
	public void setAttendgrade(String attendgrade) {
		this.attendgrade = attendgrade;
	}
	
	 
	

}

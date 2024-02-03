package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name="tsession_master")
public class SessionMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name="session_code")
	private String sessionCode;
	@Column(name="session_name")
	private String sessionName;
	@Column(name="from_dt")
	private String fromDate;
	@Column(name="to_dt")
	private String toDate;
	private String status;
	@Column(name="record_status")
	private String recordstatus="Active";
	 
	 
	public String getRecordstatus() {
		return recordstatus;
	}
	public void setRecordstatus(String recordstatus) {
		this.recordstatus = recordstatus;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getSessionCode() {
		return sessionCode;
	}
	public void setSessionCode(String sessionCode) {
		this.sessionCode = sessionCode;
	}
	public String getSessionName() {
		return sessionName;
	}
	public void setSessionName(String sessionName) {
		this.sessionName = sessionName;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}

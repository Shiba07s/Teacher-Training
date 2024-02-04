package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "tbudget_head")
public class HeadMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sl;

	@Column(name = "tc_code")
	private String tccode;

	@Column(name = "tc_name")
	private String tcnames;

	@Column(name = "record_status")
	private String recordstatus = "Active";
 

	public int getSl() {
		return sl;
	}


	public void setSl(int sl) {
		this.sl = sl;
	}


	public String getTccode() {
		return tccode;
	}


	public void setTccode(String tccode) {
		this.tccode = tccode;
	}


	public String getTcnames() {
		return tcnames;
	}


	public void setTcnames(String tcnames) {
		this.tcnames = tcnames;
	}


	public String getRecordstatus() {
		return recordstatus;
	}


	public void setRecordstatus(String recordstatus) {
		this.recordstatus = recordstatus;
	}


	@Override
	public String toString() {
		return "HeadMaster [sl=" + sl + ", tccode=" + tccode + ", tcnames=" + tcnames + ", recordstatus=" + recordstatus + "]";
	}

	
	// Constructors, getters, and setters
}

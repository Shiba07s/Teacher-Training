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
	@Column(name="Sl")
	private int sl;

	@Column(name = "`TC Code`")
	private String tccode;

	@Column(name = "`TC Names`")
	private String tcnames;

	@Column(name = "`Record Status`")
	private String recordstatus = "Active";

	@Column(name = "`Created By`")
	private String createdby;

	@Column(name = "`Modified By`")
	private String modifiedby;

	@Column(name = "`Created Dt`")
	private String createddt;

	@Column(name = "`Modified Dt`")
	private String modifieddt;

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

	public String getCreatedby() {
		return createdby;
	}

	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}

	public String getModifiedby() {
		return modifiedby;
	}

	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}

	public String getCreateddt() {
		return createddt;
	}

	public void setCreateddt(String createddt) {
		this.createddt = createddt;
	}

	public String getModifieddt() {
		return modifieddt;
	}

	public void setModifieddt(String modifieddt) {
		this.modifieddt = modifieddt;
	}

	public String getRecordstatus() {
		return recordstatus;
	}

	public void setRecordstatus(String recordstatus) {
		this.recordstatus = recordstatus;
	}

	@Override
	public String toString() {
		return "HeadMaster [sl=" + sl + ", tccode=" + tccode + ", tcnames=" + tcnames + ", createdby=" + createdby
				+ ", modifiedby=" + modifiedby + ", createddt=" + createddt + ", modifieddt=" + modifieddt
				+ ", recordstatus=" + recordstatus + "]";
	}

	
	// Constructors, getters, and setters
}

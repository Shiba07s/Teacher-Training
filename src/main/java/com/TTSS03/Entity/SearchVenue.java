package com.TTSS03.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tvenuemaster")
public class SearchVenue {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long vid;
	private String vname;
	private String vstate;
	private String vmandal;
	private String vdistrict;
	private String vlocation;
	private String vcapacity;
	private String vaddress;
	private String landmark;
	private String vtype;
	private String vcontactname;
	private String vcontactno;
	private String vcontactmailid;
	private String createdby;
	private String modifiedby;
	private String vstatus="Active";
	private String remarks;
	private String maplocation;
	public long getVid() {
		return vid;
	}
	public void setVid(long vid) {
		this.vid = vid;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVstate() {
		return vstate;
	}
	public void setVstate(String vstate) {
		this.vstate = vstate;
	}
	public String getVmandal() {
		return vmandal;
	}
	public void setVmandal(String vmandal) {
		this.vmandal = vmandal;
	}
	public String getVdistrict() {
		return vdistrict;
	}
	public void setVdistrict(String vdistrict) {
		this.vdistrict = vdistrict;
	}
	public String getVlocation() {
		return vlocation;
	}
	public void setVlocation(String vlocation) {
		this.vlocation = vlocation;
	}
	public String getVcapacity() {
		return vcapacity;
	}
	public void setVcapacity(String vcapacity) {
		this.vcapacity = vcapacity;
	}
	public String getVaddress() {
		return vaddress;
	}
	public void setVaddress(String vaddress) {
		this.vaddress = vaddress;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getVtype() {
		return vtype;
	}
	public void setVtype(String vtype) {
		this.vtype = vtype;
	}
	public String getVcontactname() {
		return vcontactname;
	}
	public void setVcontactname(String vcontactname) {
		this.vcontactname = vcontactname;
	}
	public String getVcontactno() {
		return vcontactno;
	}
	public void setVcontactno(String vcontactno) {
		this.vcontactno = vcontactno;
	}
	public String getVcontactmailid() {
		return vcontactmailid;
	}
	public void setVcontactmailid(String vcontactmailid) {
		this.vcontactmailid = vcontactmailid;
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
	 
	public String getVstatus() {
		return vstatus;
	}
	public void setVstatus(String vstatus) {
		this.vstatus = vstatus;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getMaplocation() {
		return maplocation;
	}
	public void setMaplocation(String maplocation) {
		this.maplocation = maplocation;
	}
	
	
}

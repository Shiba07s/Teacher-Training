package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bdg_vendermaster")
public class VenderMaster {

	@Id
	@Column(name="Sl")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sl;

	@Column(name = "`Vendor Code`")
	private int vendorcode;

	@Column(name = "Vendor")
	private String vendor;

	@Column(name = "Name")
	private String name;

	@Column(name = "Address")
	private String address;

	@Column(name = "`Contract Person`")
	private String contractperson;

	@Column(name = "`email ID`")
	private String emailid;

	@Column(name = "`Contact No`")
	private String contactno;

	@Column(name = "`Created By`")
	private String createdby;

	@Column(name = "`Modified By`")
	private String modifiedby;

	@Column(name = "`Created Dt`")
	private String createddt;

	@Column(name = "`Modified Dt`")
	private String modifieddt;

	@Column(name = "`Record Status`")
	private String recordstatus="Active";

	public int getSl() {
		return sl;
	}

	public void setSl(int sl) {
		this.sl = sl;
	}

	public int getVendorcode() {
		return vendorcode;
	}

	public void setVendorcode(int vendorcode) {
		this.vendorcode = vendorcode;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContractperson() {
		return contractperson;
	}

	public void setContractperson(String contractperson) {
		this.contractperson = contractperson;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailID(String emailid) {
		this.emailid = emailid;
	}

	public String getContactno() {
		return contactno;
	}

	public void setContactno(String contactno) {
		this.contactno = contactno;
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
		return "VenderMaster [sl=" + sl + ", vendorcode=" + vendorcode + ", vendor=" + vendor + ", name=" + name
				+ ", address=" + address + ", contractperson=" + contractperson + ", emailid=" + emailid
				+ ", contactno=" + contactno + ", createdby=" + createdby + ", modifiedby=" + modifiedby
				+ ", createddt=" + createddt + ", modifieddt=" + modifieddt + ", recordstatus=" + recordstatus + "]";
	}

}

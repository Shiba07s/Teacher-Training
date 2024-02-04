package com.TTSS03.utill;

import javax.persistence.Column;

public class NominateTrainingsDto {
	private int slno;
	private String treasuryid;
	private String mobilenumberteacher;
	private String teacher_name;
	private String dob;
	private String ref_planner_id;
	@Column(name="vid")
	private String venue_id;
	private String district_name;
	private String school_name;
	private String school_code;
	private String designation;
	private String status="Waiting For Approval";

	private String appliedtype;
	 	

	private String tname;
	private String tdescription;
	private String tmode;
	@Column(name="startdate")
	private String training_start_dt;
	@Column(name="enddate")
	private String training_end_dt;
	private String tagency;
	private String trainername;
	@Column(name="vname")
	private String venue_name;
	private String vaddress;
	private String maplocation;
	@Column(name="vcontact")
	private String coordinatormobileno;
	@Column(name="tstarttime")
	private String tstarttime;
	@Column(name="tendtime")
	private String tendtime;
//	private String vcapacity;

	private String resourcetype;
	private String remarks;
	private String secondlevelapproval;
	public int getSlno() {
		return slno;
	}
	public void setSlno(int slno) {
		this.slno = slno;
	}
	public String getTreasuryid() {
		return treasuryid;
	}
	public void setTreasuryid(String treasuryid) {
		this.treasuryid = treasuryid;
	}
	public String getMobilenumberteacher() {
		return mobilenumberteacher;
	}
	public void setMobilenumberteacher(String mobilenumberteacher) {
		this.mobilenumberteacher = mobilenumberteacher;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getRef_planner_id() {
		return ref_planner_id;
	}
	public void setRef_planner_id(String ref_planner_id) {
		this.ref_planner_id = ref_planner_id;
	}
	public String getVenue_id() {
		return venue_id;
	}
	public void setVenue_id(String venue_id) {
		this.venue_id = venue_id;
	}
	public String getDistrict_name() {
		return district_name;
	}
	public void setDistrict_name(String district_name) {
		this.district_name = district_name;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getSchool_code() {
		return school_code;
	}
	public void setSchool_code(String school_code) {
		this.school_code = school_code;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAppliedtype() {
		return appliedtype;
	}
	public void setAppliedtype(String appliedtype) {
		this.appliedtype = appliedtype;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTdescription() {
		return tdescription;
	}
	public void setTdescription(String tdescription) {
		this.tdescription = tdescription;
	}
	public String getTmode() {
		return tmode;
	}
	public void setTmode(String tmode) {
		this.tmode = tmode;
	}
	public String getTraining_start_dt() {
		return training_start_dt;
	}
	public void setTraining_start_dt(String training_start_dt) {
		this.training_start_dt = training_start_dt;
	}
	public String getTraining_end_dt() {
		return training_end_dt;
	}
	public void setTraining_end_dt(String training_end_dt) {
		this.training_end_dt = training_end_dt;
	}
	public String getTagency() {
		return tagency;
	}
	public void setTagency(String tagency) {
		this.tagency = tagency;
	}
	public String getTrainername() {
		return trainername;
	}
	public void setTrainername(String trainername) {
		this.trainername = trainername;
	}
	public String getVenue_name() {
		return venue_name;
	}
	public void setVenue_name(String venue_name) {
		this.venue_name = venue_name;
	}
	public String getVaddress() {
		return vaddress;
	}
	public void setVaddress(String vaddress) {
		this.vaddress = vaddress;
	}
	public String getMaplocation() {
		return maplocation;
	}
	public void setMaplocation(String maplocation) {
		this.maplocation = maplocation;
	}
	public String getCoordinatormobileno() {
		return coordinatormobileno;
	}
	public void setCoordinatormobileno(String coordinatormobileno) {
		this.coordinatormobileno = coordinatormobileno;
	}
	public String getTstarttime() {
		return tstarttime;
	}
	public void setTstarttime(String tstarttime) {
		this.tstarttime = tstarttime;
	}
	public String getTendtime() {
		return tendtime;
	}
	public void setTendtime(String tendtime) {
		this.tendtime = tendtime;
	}
	public String getResourcetype() {
		return resourcetype;
	}
	public void setResourcetype(String resourcetype) {
		this.resourcetype = resourcetype;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getSecondlevelapproval() {
		return secondlevelapproval;
	}
	public void setSecondlevelapproval(String secondlevelapproval) {
		this.secondlevelapproval = secondlevelapproval;
	}
	
	
	
}

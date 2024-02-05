package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tteacher_master_update")
public class TreasuryGovt {
	 
	@Id
	private long sl_no;
	@Column(name = "district_name")
	private String districtnamewrk;
	@Column(name = "mandal_name")
	private String mandalnamewrk;
	@Column(name = "school_code")
	private String schcd;
	private String school_name;
	private String treasuryid;
	@Column(name="cfms_id")
	private String cmfs_id;
	@Column(name="aadhar_no")
	private String aadhar;
	@Column(name="email_id")

	private String email;
	@Column(name = "father_name")
	private String fathername;
	private String teacher_name;
	@Column(name = "design")
	private String designation;
	private String teaching_flag;
	private String nature_of_appt;
	private String sch_mgt_name;
	private String gender;
	private String dob;
	@Column(name = "marital_status")
	private String maritalstatus;
	@Column(name = "mobileno_teacher")
	private String mobilenumberteacher;
	private String complex_code;
	private String complex_school_name;
	private String workplace;
	private String disability;
	public long getSl_no() {
		return sl_no;
	}
	public void setSl_no(long sl_no) {
		this.sl_no = sl_no;
	}
	public String getDistrictnamewrk() {
		return districtnamewrk;
	}
	public void setDistrictnamewrk(String districtnamewrk) {
		this.districtnamewrk = districtnamewrk;
	}
	public String getMandalnamewrk() {
		return mandalnamewrk;
	}
	public void setMandalnamewrk(String mandalnamewrk) {
		this.mandalnamewrk = mandalnamewrk;
	}
	public String getSchcd() {
		return schcd;
	}
	public void setSchcd(String schcd) {
		this.schcd = schcd;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getTreasuryid() {
		return treasuryid;
	}
	public void setTreasuryid(String treasuryid) {
		this.treasuryid = treasuryid;
	}
	public String getCmfs_id() {
		return cmfs_id;
	}
	public void setCmfs_id(String cmfs_id) {
		this.cmfs_id = cmfs_id;
	}
	public String getAadhar() {
		return aadhar;
	}
	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getTeaching_flag() {
		return teaching_flag;
	}
	public void setTeaching_flag(String teaching_flag) {
		this.teaching_flag = teaching_flag;
	}
	public String getNature_of_appt() {
		return nature_of_appt;
	}
	public void setNature_of_appt(String nature_of_appt) {
		this.nature_of_appt = nature_of_appt;
	}
	public String getSch_mgt_name() {
		return sch_mgt_name;
	}
	public void setSch_mgt_name(String sch_mgt_name) {
		this.sch_mgt_name = sch_mgt_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getMaritalstatus() {
		return maritalstatus;
	}
	public void setMaritalstatus(String maritalstatus) {
		this.maritalstatus = maritalstatus;
	}
	public String getMobilenumberteacher() {
		return mobilenumberteacher;
	}
	public void setMobilenumberteacher(String mobilenumberteacher) {
		this.mobilenumberteacher = mobilenumberteacher;
	}
	public String getComplex_code() {
		return complex_code;
	}
	public void setComplex_code(String complex_code) {
		this.complex_code = complex_code;
	}
	public String getComplex_school_name() {
		return complex_school_name;
	}
	public void setComplex_school_name(String complex_school_name) {
		this.complex_school_name = complex_school_name;
	}
	public String getWorkplace() {
		return workplace;
	}
	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}
	public String getDisability() {
		return disability;
	}
	public void setDisability(String disability) {
		this.disability = disability;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@Id
//	@Column(name = "sl_no")
//	private long rowid;
//	@Column(name = "district_name")
//	private String districtnamewrk;
//	@Column(name = "mandal_name")
//	private String mandalnamewrk;
//	@Column(name = "school_code")
//	private String schcd;
//	private String school_name;
//	private String treasuryid;
//	private String cmfs_id;
//	private String aadhar;
//	private String email;
//	@Column(name = "father_name")
//	private String fathername;
//	private String teacher_name;
//	@Column(name = "desig")
//	private String designation;
//	private String teaching_flag;
//	private String nature_of_appt;
//	private String sch_mgt_name;
//	private String gender;
//	@Column(name = "DOB")
//	private String dob;
//	@Column(name = "maritalstatus")
//	private String maritalstatus;
//	@Column(name = "mobilenumberteacher")
//	private String mobilenumberteacher;
//	private String complex_code;
//	private String complex_school_name;
//	private String workplace;
//	private String disability;
//	public long getRowid() {
//		return rowid;
//	}
//	public void setRowid(long rowid) {
//		this.rowid = rowid;
//	}
//	public String getDistrictnamewrk() {
//		return districtnamewrk;
//	}
//	public void setDistrictnamewrk(String districtnamewrk) {
//		this.districtnamewrk = districtnamewrk;
//	}
//	public String getMandalnamewrk() {
//		return mandalnamewrk;
//	}
//	public void setMandalnamewrk(String mandalnamewrk) {
//		this.mandalnamewrk = mandalnamewrk;
//	}
//	public String getSchcd() {
//		return schcd;
//	}
//	public void setSchcd(String schcd) {
//		this.schcd = schcd;
//	}
//	public String getSchool_name() {
//		return school_name;
//	}
//	public void setSchool_name(String school_name) {
//		this.school_name = school_name;
//	}
//	public String getTreasuryid() {
//		return treasuryid;
//	}
//	public void setTreasuryid(String treasuryid) {
//		this.treasuryid = treasuryid;
//	}
//	public String getCmfs_id() {
//		return cmfs_id;
//	}
//	public void setCmfs_id(String cmfs_id) {
//		this.cmfs_id = cmfs_id;
//	}
//	public String getAadhar() {
//		return aadhar;
//	}
//	public void setAadhar(String aadhar) {
//		this.aadhar = aadhar;
//	}
//	public String getEmail() {
//		return email;
//	}
//	public void setEmail(String email) {
//		this.email = email;
//	}
//	public String getFathername() {
//		return fathername;
//	}
//	public void setFathername(String fathername) {
//		this.fathername = fathername;
//	}
//	public String getTeacher_name() {
//		return teacher_name;
//	}
//	public void setTeacher_name(String teacher_name) {
//		this.teacher_name = teacher_name;
//	}
//	public String getDesignation() {
//		return designation;
//	}
//	public void setDesignation(String designation) {
//		this.designation = designation;
//	}
//	public String getTeaching_flag() {
//		return teaching_flag;
//	}
//	public void setTeaching_flag(String teaching_flag) {
//		this.teaching_flag = teaching_flag;
//	}
//	public String getNature_of_appt() {
//		return nature_of_appt;
//	}
//	public void setNature_of_appt(String nature_of_appt) {
//		this.nature_of_appt = nature_of_appt;
//	}
//	public String getSch_mgt_name() {
//		return sch_mgt_name;
//	}
//	public void setSch_mgt_name(String sch_mgt_name) {
//		this.sch_mgt_name = sch_mgt_name;
//	}
//	public String getGender() {
//		return gender;
//	}
//	public void setGender(String gender) {
//		this.gender = gender;
//	}
//	public String getDob() {
//		return dob;
//	}
//	public void setDob(String dob) {
//		this.dob = dob;
//	}
//	public String getMaritalstatus() {
//		return maritalstatus;
//	}
//	public void setMaritalstatus(String maritalstatus) {
//		this.maritalstatus = maritalstatus;
//	}
//	public String getMobilenumberteacher() {
//		return mobilenumberteacher;
//	}
//	public void setMobilenumberteacher(String mobilenumberteacher) {
//		this.mobilenumberteacher = mobilenumberteacher;
//	}
//	public String getComplex_code() {
//		return complex_code;
//	}
//	public void setComplex_code(String complex_code) {
//		this.complex_code = complex_code;
//	}
//	public String getComplex_school_name() {
//		return complex_school_name;
//	}
//	public void setComplex_school_name(String complex_school_name) {
//		this.complex_school_name = complex_school_name;
//	}
//	public String getWorkplace() {
//		return workplace;
//	}
//	public void setWorkplace(String workplace) {
//		this.workplace = workplace;
//	}
//	public String getDisability() {
//		return disability;
//	}
//	public void setDisability(String disability) {
//		this.disability = disability;
//	}
	
	

//	@Id
//	private long rowid;
//    private String treasuryid;
//    private String username;
//    private String surname;
//    private String designation;
//    private String workplace;
//    private String fathername;
//    private String dob;
//    private String gender;
//    private String maritalstatus;
//    private String religion;
//    private String mothertongue;
//    private String community;
//    private String aadhar;
//    private String locality;
//    private String disability;
//    private String address_type;
//    private String inserteddate;
//    private String schoolcat;
//    private String nextlevel;
//    private String schcd;
//    private String photopath;
//    private String imagename;
//    private String mobilenumberteacher;
//    private String teacher_email;
//    private String pancard;
//    private String presentschooljoindate;
//    private String percentageofdis;
//    private String photoconfirmation;
//    private String desginationid;
//    private String localitydistrict;
//    private String nonlocalitydistrict;
//    private String permanentaddresspincode;
//    private String permanentaddressdistrict;
//    private String permanentaddresspaddress;
//    private String permanentaddressvillage;
//    private String permanentaddressmandal;
//    private String presentaddresspincode;
//    private String presentaddressdistrict;
//    private String presentaddresspaddress;
//    private String presentaddressvillage;
//    private String presentaddressmandal;
//    private String districtnamewrk;
//    private String mandalnamewrk;
//    private String villagewrk;
//    private String eismaster_status;
//    private String rank;
//    private String roaster_point;
//    private String roaster_category;
//    private String loginid;
//    private String updateddate;
//    private String post_status;
//    private String medium;
//    private String door_num;
//    private String permanent_door_num;
//    private String no_of_dependencies;
//    private String type_disability;
//    private String emp_empgovt;
//    private String status;
//    private String covid_vaccine;
//    private String cfms_id;
//    private String confirm_treasuryid;
//    private String other_state;
//    private String other_district;
//    private String insert_type;
//    private String permanentotheraddress;
//    private String confirm_hm;
//    private String confirm_deo;
//    private String confirm_meo;
//    private String confirm_time_hm;
//    private String confirm_time_meo;
//    private String confirm_time_deo;
//	 

}

package com.TTSS03.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tnongovt_teacher_master")
public class NonGovtMaster {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long sl_no;
	private String district_name;
	private String mandal_name;
	private String school_code;
	private String school_name;
	private String treasuryid;
	private String cfms_id;
	private String aadhar_no;
	private String email_id;
	private String father_name;
	private String teacher_name;
	private String design;
	private String teaching_flag;
	private String nature_of_appt;
	private String sch_mgt_name;
	private String gender;
	private String dob;
	private String marital_status;
	private String mobileno_teacher;
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
	public String getDistrict_name() {
		return district_name;
	}
	public void setDistrict_name(String district_name) {
		this.district_name = district_name;
	}
	public String getMandal_name() {
		return mandal_name;
	}
	public void setMandal_name(String mandal_name) {
		this.mandal_name = mandal_name;
	}
	public String getSchool_code() {
		return school_code;
	}
	public void setSchool_code(String school_code) {
		this.school_code = school_code;
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
	public String getCfms_id() {
		return cfms_id;
	}
	public void setCfms_id(String cfms_id) {
		this.cfms_id = cfms_id;
	}
	public String getAadhar_no() {
		return aadhar_no;
	}
	public void setAadhar_no(String aadhar_no) {
		this.aadhar_no = aadhar_no;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getFather_name() {
		return father_name;
	}
	public void setFather_name(String father_name) {
		this.father_name = father_name;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getDesign() {
		return design;
	}
	public void setDesign(String design) {
		this.design = design;
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
	public String getScl_mgt_name() {
		return sch_mgt_name;
	}
	public void setScl_mgt_name(String scl_mgt_name) {
		this.sch_mgt_name = scl_mgt_name;
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
	public String getSch_mgt_name() {
		return sch_mgt_name;
	}
	public void setSch_mgt_name(String sch_mgt_name) {
		this.sch_mgt_name = sch_mgt_name;
	}
	public String getMarital_status() {
		return marital_status;
	}
	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}
	public String getMobileno_teacher() {
		return mobileno_teacher;
	}
	public void setMobileno_teacher(String mobileno_teacher) {
		this.mobileno_teacher = mobileno_teacher;
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
	
	

}

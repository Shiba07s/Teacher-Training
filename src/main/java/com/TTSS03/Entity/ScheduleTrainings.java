package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="ttransactiontraining")
public class ScheduleTrainings {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sl_no;
	private String ref_planner_id;
	private String tmonth;
	private String tyear;
	private String tname;
	private String tdescription;
	private String venue_id;
	private String venue_name;
	private String training_start_dt;
	private String training_end_dt;
	private String apply_start_dt;
	private String apply_end_dt;
	@Column(name="createdby")
	private String created_by;
	@Column(name="modifiedby")
	private String modified_by;
	private String record_status="Active";
	private String maplocation;
	private String vaddress;
	private String tmode;
	private String tgrade;
	private String state;
	private String district;
	private String mandal;

	private String coordinatorname;
	private String coordinatoremailid;
	private String coordinatormobileno;
	private String tagency;
	private String tmodule;
	private String resourcetype;
	private String tstarttime;
	private String tendtime;
	
	
	
	public String getVenue_name() {
		return venue_name;
	}
	public void setVenue_name(String venue_name) {
		this.venue_name = venue_name;
	}
	public int getSl_no() {
		return sl_no;
	}
	public void setSl_no(int sl_no) {
		this.sl_no = sl_no;
	}
	public String getRef_planner_id() {
		return ref_planner_id;
	}
	public void setRef_planner_id(String ref_planner_id) {
		this.ref_planner_id = ref_planner_id;
	}
	public String getTmonth() {
		return tmonth;
	}
	public void setTmonth(String tmonth) {
		this.tmonth = tmonth;
	}
	public String getTyear() {
		return tyear;
	}
	public void setTyear(String tyear) {
		this.tyear = tyear;
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
	public String getVenue_id() {
		return venue_id;
	}
	public void setVenue_id(String venue_id) {
		this.venue_id = venue_id;
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
	public String getApply_start_dt() {
		return apply_start_dt;
	}
	public void setApply_start_dt(String apply_start_dt) {
		this.apply_start_dt = apply_start_dt;
	}
	public String getApply_end_dt() {
		return apply_end_dt;
	}
	public void setApply_end_dt(String apply_end_dt) {
		this.apply_end_dt = apply_end_dt;
	}
	 
	public String getModified_by() {
		return modified_by;
	}
	public void setModified_by(String modified_by) {
		this.modified_by = modified_by;
	}
	 
	public String getRecord_status() {
		return record_status;
	}
	public void setRecord_status(String record_status) {
		this.record_status = record_status;
	}
	
	public String getTmode() {
		return tmode;
	}
	public void setTmode(String tmode) {
		this.tmode = tmode;
	}
	public String getTgrade() {
		return tgrade;
	}
	public void setTgrade(String tgrade) {
		this.tgrade = tgrade;
	}
	public String getTstate() {
		return state;
	}
	public void setTstate(String tstate) {
		this.state = tstate;
	}
	public String getTdistrict() {
		return district;
	}
	public void setTdistrict(String tdistrict) {
		this.district = tdistrict;
	}
	public String getTmandal() {
		return mandal;
	}
	public void setTmandal(String tmandal) {
		this.mandal = tmandal;
	}
	public String getCoordinatorname() {
		return coordinatorname;
	}
	public void setCoordinatorname(String coordinatorname) {
		this.coordinatorname = coordinatorname;
	}
	public String getCoordinator_email() {
		return coordinatoremailid;
	}
	public void setCoordinator_email(String coordinator_email) {
		this.coordinatoremailid = coordinator_email;
	}
	public String getCoordinator_mobile() {
		return coordinatormobileno;
	}
	public void setCoordinator_mobile(String coordinator_mobile) {
		this.coordinatormobileno = coordinator_mobile;
	}
	public String getTagency() {
		return tagency;
	}
	public void setTagency(String tagency) {
		this.tagency = tagency;
	}
	public String getTmodule() {
		return tmodule;
	}
	public void setTmodule(String tmodule) {
		this.tmodule = tmodule;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getMandal() {
		return mandal;
	}
	public void setMandal(String mandal) {
		this.mandal = mandal;
	}
	public String getCoordinatoremailid() {
		return coordinatoremailid;
	}
	public void setCoordinatoremailid(String coordinatoremailid) {
		this.coordinatoremailid = coordinatoremailid;
	}
	public String getCoordinatormobileno() {
		return coordinatormobileno;
	}
	public void setCoordinatormobileno(String coordinatormobileno) {
		this.coordinatormobileno = coordinatormobileno;
	}
	public String getMaplocation() {
		return maplocation;
	}
	public void setMaplocation(String maplocation) {
		this.maplocation = maplocation;
	}
	public String getVaddress() {
		return vaddress;
	}
	public void setVaddress(String vaddress) {
		this.vaddress = vaddress;
	}
	public String getResourcetype() {
		return resourcetype;
	}
	public void setResourcetype(String resourcetype) {
		this.resourcetype = resourcetype;
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
	
	
}

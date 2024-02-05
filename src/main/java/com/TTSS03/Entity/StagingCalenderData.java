package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "tstaging")
public class StagingCalenderData {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int refplannerid;
	private String tmonth;
	private int tyear;
	private String trainingregstartdt;
	private String trainingregenddt;
	private String tagency;
	private String tname;
	private String tsubject;
	private String tcategory;
	private String tspell;
	private String tdescription;
	private String preferdlocation;
	private String tgrade;
	private String ttargetgroup;
	private int numberofstakeholder;
	private int numberdayneeded;
	private String tmode;
	private int thoursperday;
	private int totalhours;
	private String tstatus;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRefplannerid() {
		return refplannerid;
	}
	public void setRefplannerid(int refplannerid) {
		this.refplannerid = refplannerid;
	}
	public String getTmonth() {
		return tmonth;
	}
	public void setTmonth(String tmonth) {
		this.tmonth = tmonth;
	}
	public int getTyear() {
		return tyear;
	}
	public void setTyear(int tyear) {
		this.tyear = tyear;
	}
	public String getTrainingregstartdt() {
		return trainingregstartdt;
	}
	public void setTrainingregstartdt(String trainingregstartdt) {
		this.trainingregstartdt = trainingregstartdt;
	}
	public String getTrainingregenddt() {
		return trainingregenddt;
	}
	public void setTrainingregenddt(String trainingregenddt) {
		this.trainingregenddt = trainingregenddt;
	}
	public String getTagency() {
		return tagency;
	}
	public void setTagency(String tagency) {
		this.tagency = tagency;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTsubject() {
		return tsubject;
	}
	public void setTsubject(String tsubject) {
		this.tsubject = tsubject;
	}
	public String getTcategory() {
		return tcategory;
	}
	public void setTcategory(String tcategory) {
		this.tcategory = tcategory;
	}
	public String getTspell() {
		return tspell;
	}
	public void setTspell(String tspell) {
		this.tspell = tspell;
	}
	public String getTdescription() {
		return tdescription;
	}
	public void setTdescription(String tdescription) {
		this.tdescription = tdescription;
	}
	public String getPreferdlocation() {
		return preferdlocation;
	}
	public void setPreferdlocation(String preferdlocation) {
		this.preferdlocation = preferdlocation;
	}
	public String getTgrade() {
		return tgrade;
	}
	public void setTgrade(String tgrade) {
		this.tgrade = tgrade;
	}
	public String getTtargetgroup() {
		return ttargetgroup;
	}
	public void setTtargetgroup(String ttargetgroup) {
		this.ttargetgroup = ttargetgroup;
	}
	public int getNumberofstakeholder() {
		return numberofstakeholder;
	}
	public void setNumberofstakeholder(int numberofstakeholder) {
		this.numberofstakeholder = numberofstakeholder;
	}
	public int getNumberdayneeded() {
		return numberdayneeded;
	}
	public void setNumberdayneeded(int numberdayneeded) {
		this.numberdayneeded = numberdayneeded;
	}
	public String getTmode() {
		return tmode;
	}
	public void setTmode(String tmode) {
		this.tmode = tmode;
	}
	public int getThoursperday() {
		return thoursperday;
	}
	public void setThoursperday(int thoursperday) {
		this.thoursperday = thoursperday;
	}
	public int getTotalhours() {
		return totalhours;
	}
	public void setTotalhours(int totalhours) {
		this.totalhours = totalhours;
	}
	public String getTstatus() {
		return tstatus;
	}
	public void setTstatus(String tstatus) {
		this.tstatus = tstatus;
	}
	
	 
 
}

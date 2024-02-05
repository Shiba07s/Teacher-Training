package com.TTSS03.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ttraining_to_management_mapping")
public class MasterMapping {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	 private long slno;

    private long trainingid;
    private String trainingname;
    private String venueid;
    private String venuename;
    
    private String ccflag="No";
    private String cctreasuryid;
    private String ccname;
    private String ccdesignation;
    private String ccdistrict;
    private String ccmandal;
    private String ccemail;
    private String ccmobile;

    // Acc fields
    private String accflag="No";
    private String acctreasuryid;
    private String accname;
    private String accdesignation;
    private String accdistrict;
    private String accmandal;
    private String accemail;
    private String accmobile;

    // Rp fields
    private String rpflag="No";
    private String rptreasuryid;
    private String rpname;
    private String rpdesignation;
    private String rpdistrict;
    private String rpmandal;
    private String rpemail;
    private String rpmobile;

    // Os fields
    private String osflag="No";
    private String ostreasuryid;
    private String osname;
    private String osdesignation;
    private String osdistrict;
    private String osmandal;
    private String osemail;
    private String osmobile;

    // Pp fields
    private String ppflag="No";
    private String pptreasuryid;
    private String ppname;
    private String ppdesignation;
    private String ppdistrict;
    private String ppmandal;
    private String ppemail;
    private String ppmobile;   
    private String status="Ready for Delivery";
    private String remark;
    private String recordstatus="Active";
    
    private String createdby;
	private String modifiedby;
	
	private String applystartdate;
	private String applyenddate;
	private String trainingstartdate;
	private String trainingenddate;
	
	private String tstarttime;
	private String tendtime;
    
    
    
    
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
	public String getApplystartdate() {
		return applystartdate;
	}
	public void setApplystartdate(String applystartdate) {
		this.applystartdate = applystartdate;
	}
	public String getApplyenddate() {
		return applyenddate;
	}
	public void setApplyenddate(String applyenddate) {
		this.applyenddate = applyenddate;
	}
	public String getTrainingstartdate() {
		return trainingstartdate;
	}
	public void setTrainingstartdate(String trainingstartdate) {
		this.trainingstartdate = trainingstartdate;
	}
	public String getTrainingenddate() {
		return trainingenddate;
	}
	public void setTrainingenddate(String trainingenddate) {
		this.trainingenddate = trainingenddate;
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
	public void setSlno(long slno) {
		this.slno = slno;
	}
	public void setTrainingid(long trainingid) {
		this.trainingid = trainingid;
	}
	public String getRecordstatus() {
		return recordstatus;
	}
	public void setRecordstatus(String recordstatus) {
		this.recordstatus = recordstatus;
	}
	public Long getSlno() {
		return slno;
	}
	public void setSlno(Long slno) {
		this.slno = slno;
	}
	public Long getTrainingid() {
		return trainingid;
	}
	public void setTrainingid(Long trainingid) {
		this.trainingid = trainingid;
	}
	public String getTrainingname() {
		return trainingname;
	}
	public void setTrainingname(String trainingname) {
		this.trainingname = trainingname;
	}
	public String getVenueid() {
		return venueid;
	}
	public void setVenueid(String venueid) {
		this.venueid = venueid;
	}
	public String getVenuename() {
		return venuename;
	}
	public void setVenuename(String venuename) {
		this.venuename = venuename;
	}
	public String getCcflag() {
		return ccflag;
	}
	public void setCcflag(String ccflag) {
		this.ccflag = ccflag;
	}
	public String getCctreasuryid() {
		return cctreasuryid;
	}
	public void setCctreasuryid(String cctreasuryid) {
		this.cctreasuryid = cctreasuryid;
	}
	public String getCcname() {
		return ccname;
	}
	public void setCcname(String ccname) {
		this.ccname = ccname;
	}
	public String getCcdesignation() {
		return ccdesignation;
	}
	public void setCcdesignation(String ccdesignation) {
		this.ccdesignation = ccdesignation;
	}
	public String getCcdistrict() {
		return ccdistrict;
	}
	public void setCcdistrict(String ccdistrict) {
		this.ccdistrict = ccdistrict;
	}
	public String getCcmandal() {
		return ccmandal;
	}
	public void setCcmandal(String ccmandal) {
		this.ccmandal = ccmandal;
	}
	public String getCcemail() {
		return ccemail;
	}
	public void setCcemail(String ccemail) {
		this.ccemail = ccemail;
	}
	public String getCcmobile() {
		return ccmobile;
	}
	public void setCcmobile(String ccmobile) {
		this.ccmobile = ccmobile;
	}
	public String getAccflag() {
		return accflag;
	}
	public void setAccflag(String accflag) {
		this.accflag = accflag;
	}
	public String getAcctreasuryid() {
		return acctreasuryid;
	}
	public void setAcctreasuryid(String acctreasuryid) {
		this.acctreasuryid = acctreasuryid;
	}
	public String getAccname() {
		return accname;
	}
	public void setAccname(String accname) {
		this.accname = accname;
	}
	public String getAccdesignation() {
		return accdesignation;
	}
	public void setAccdesignation(String accdesignation) {
		this.accdesignation = accdesignation;
	}
	public String getAccdistrict() {
		return accdistrict;
	}
	public void setAccdistrict(String accdistrict) {
		this.accdistrict = accdistrict;
	}
	public String getAccmandal() {
		return accmandal;
	}
	public void setAccmandal(String accmandal) {
		this.accmandal = accmandal;
	}
	public String getAccemail() {
		return accemail;
	}
	public void setAccemail(String accemail) {
		this.accemail = accemail;
	}
	public String getAccmobile() {
		return accmobile;
	}
	public void setAccmobile(String accmobile) {
		this.accmobile = accmobile;
	}
	public String getRpflag() {
		return rpflag;
	}
	public void setRpflag(String rpflag) {
		this.rpflag = rpflag;
	}
	public String getRptreasuryid() {
		return rptreasuryid;
	}
	public void setRptreasuryid(String rptreasuryid) {
		this.rptreasuryid = rptreasuryid;
	}
	public String getRpname() {
		return rpname;
	}
	public void setRpname(String rpname) {
		this.rpname = rpname;
	}
	public String getRpdesignation() {
		return rpdesignation;
	}
	public void setRpdesignation(String rpdesignation) {
		this.rpdesignation = rpdesignation;
	}
	public String getRpdistrict() {
		return rpdistrict;
	}
	public void setRpdistrict(String rpdistrict) {
		this.rpdistrict = rpdistrict;
	}
	public String getRpmandal() {
		return rpmandal;
	}
	public void setRpmandal(String rpmandal) {
		this.rpmandal = rpmandal;
	}
	public String getRpemail() {
		return rpemail;
	}
	public void setRpemail(String rpemail) {
		this.rpemail = rpemail;
	}
	public String getRpmobile() {
		return rpmobile;
	}
	public void setRpmobile(String rpmobile) {
		this.rpmobile = rpmobile;
	}
	public String getOsflag() {
		return osflag;
	}
	public void setOsflag(String osflag) {
		this.osflag = osflag;
	}
	public String getOstreasuryid() {
		return ostreasuryid;
	}
	public void setOstreasuryid(String ostreasuryid) {
		this.ostreasuryid = ostreasuryid;
	}
	public String getOsname() {
		return osname;
	}
	public void setOsname(String osname) {
		this.osname = osname;
	}
	public String getOsdesignation() {
		return osdesignation;
	}
	public void setOsdesignation(String osdesignation) {
		this.osdesignation = osdesignation;
	}
	public String getOsdistrict() {
		return osdistrict;
	}
	public void setOsdistrict(String osdistrict) {
		this.osdistrict = osdistrict;
	}
	public String getOsmandal() {
		return osmandal;
	}
	public void setOsmandal(String osmandal) {
		this.osmandal = osmandal;
	}
	public String getOsemail() {
		return osemail;
	}
	public void setOsemail(String osemail) {
		this.osemail = osemail;
	}
	public String getOsmobile() {
		return osmobile;
	}
	public void setOsmobile(String osmobile) {
		this.osmobile = osmobile;
	}
	public String getPpflag() {
		return ppflag;
	}
	public void setPpflag(String ppflag) {
		this.ppflag = ppflag;
	}
	public String getPptreasuryid() {
		return pptreasuryid;
	}
	public void setPptreasuryid(String pptreasuryid) {
		this.pptreasuryid = pptreasuryid;
	}
	public String getPpname() {
		return ppname;
	}
	public void setPpname(String ppname) {
		this.ppname = ppname;
	}
	public String getPpdesignation() {
		return ppdesignation;
	}
	public void setPpdesignation(String ppdesignation) {
		this.ppdesignation = ppdesignation;
	}
	public String getPpdistrict() {
		return ppdistrict;
	}
	public void setPpdistrict(String ppdistrict) {
		this.ppdistrict = ppdistrict;
	}
	public String getPpmandal() {
		return ppmandal;
	}
	public void setPpmandal(String ppmandal) {
		this.ppmandal = ppmandal;
	}
	public String getPpemail() {
		return ppemail;
	}
	public void setPpemail(String ppemail) {
		this.ppemail = ppemail;
	}
	public String getPpmobile() {
		return ppmobile;
	}
	public void setPpmobile(String ppmobile) {
		this.ppmobile = ppmobile;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}

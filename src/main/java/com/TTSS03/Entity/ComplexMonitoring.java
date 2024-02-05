/**
 * 
 */
package com.TTSS03.Entity;





import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 
 */
@Entity
@Table(name = "tcomplex_monitoring")
public class ComplexMonitoring {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "slno")
    private int slno;

    @Column(name = "district")
    private String district;

    @Column(name = "mandal")
    private String mandal;

    @Column(name = "complexname")
    private String complexname;

    @Column(name = "complexcode")
    private String complexcode;

    @Column(name = "complexhmname")
    private String complexhmname;

    @Column(name = "complexhmcontactnumber")
    private String complexhmcontactnumber;

    @Column(name = "designation")
    private String designation;

    @Column(name = "name")
    private String name;

    @Column(name = "mobilenumber")
    private String mobilenumber;

    @Column(name = "dateofvisitcomplexmeeting")
    @Temporal(TemporalType.DATE)
    private Date dateofvisitcomplexmeeting;

    @Column(name = "typeofcomplexmeetingattended")
    private String typeofcomplexmeetingattended;

    @Column(name = "noofschoolattachedtocomplex")
    private String noofschoolattachedtocomplex;

    @Column(name = "noofteacherattachedtocomplex")
    private String noofteacherattachedtocomplex;

    @Column(name = "noofteacherattendingmeeting")
    private String noofteacherattendingmeeting;

    @Column(name = "ratefacilitator")
    private String ratefacilitator;

    @Column(name = "mombeforestartingsession")
    private String mombeforestartingsession;

    @Column(name = "physicalagendaitemsavailable")
    private String physicalagendaitemsavailable;

    @Column(name = "digitalagendaitemsavailable")
    private String digitalagendaitemsavailable;

    @Column(name = "rateteacherengagementformeeting")
    private String rateteacherengagementformeeting;

    @Column(name = "rateteacherinactionoriented")
    private String rateteacherinactionoriented;

    @Column(name = "raterelevancetagenda")
    private String raterelevancetagenda;

    @Column(name = "physicalsetting")
    private String physicalsetting;

    @Column(name = "socialsetting")
    private String socialsetting;

    @Column(name = "internetconnectivity")
    private String internetconnectivity;

    @Column(name = "smarttv")
    private String smarttv;

    @Column(name = "ifpb")
    private String ifpb;

    @Column(name = "projector")
    private String projector;

    @Column(name = "anyareasofimprovement")
    private String anyareasofimprovement;

    @Column(name = "remark")
    private String remark;

    @Lob
    @Column(name = "uploadimage")
    private byte[] uploadimage;

	public int getSlno() {
		return slno;
	}

	public void setSlno(int slno) {
		this.slno = slno;
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

	public String getComplexname() {
		return complexname;
	}

	public void setComplexname(String complexname) {
		this.complexname = complexname;
	}

	public String getComplexcode() {
		return complexcode;
	}

	public void setComplexcode(String complexcode) {
		this.complexcode = complexcode;
	}

	public String getComplexhmname() {
		return complexhmname;
	}

	public void setComplexhmname(String complexhmname) {
		this.complexhmname = complexhmname;
	}

	public String getComplexhmcontactnumber() {
		return complexhmcontactnumber;
	}

	public void setComplexhmcontactnumber(String complexhmcontactnumber) {
		this.complexhmcontactnumber = complexhmcontactnumber;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobilenumber() {
		return mobilenumber;
	}

	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}

	public Date getDateofvisitcomplexmeeting() {
		return dateofvisitcomplexmeeting;
	}

	public void setDateofvisitcomplexmeeting(Date dateofvisitcomplexmeeting) {
		this.dateofvisitcomplexmeeting = dateofvisitcomplexmeeting;
	}

	public String getTypeofcomplexmeetingattended() {
		return typeofcomplexmeetingattended;
	}

	public void setTypeofcomplexmeetingattended(String typeofcomplexmeetingattended) {
		this.typeofcomplexmeetingattended = typeofcomplexmeetingattended;
	}

	public String getNoofschoolattachedtocomplex() {
		return noofschoolattachedtocomplex;
	}

	public void setNoofschoolattachedtocomplex(String noofschoolattachedtocomplex) {
		this.noofschoolattachedtocomplex = noofschoolattachedtocomplex;
	}

	public String getNoofteacherattachedtocomplex() {
		return noofteacherattachedtocomplex;
	}

	public void setNoofteacherattachedtocomplex(String noofteacherattachedtocomplex) {
		this.noofteacherattachedtocomplex = noofteacherattachedtocomplex;
	}

	public String getNoofteacherattendingmeeting() {
		return noofteacherattendingmeeting;
	}

	public void setNoofteacherattendingmeeting(String noofteacherattendingmeeting) {
		this.noofteacherattendingmeeting = noofteacherattendingmeeting;
	}

	public String getRatefacilitator() {
		return ratefacilitator;
	}

	public void setRatefacilitator(String ratefacilitator) {
		this.ratefacilitator = ratefacilitator;
	}

	public String getMombeforestartingsession() {
		return mombeforestartingsession;
	}

	public void setMombeforestartingsession(String mombeforestartingsession) {
		this.mombeforestartingsession = mombeforestartingsession;
	}

	public String getPhysicalagendaitemsavailable() {
		return physicalagendaitemsavailable;
	}

	public void setPhysicalagendaitemsavailable(String physicalagendaitemsavailable) {
		this.physicalagendaitemsavailable = physicalagendaitemsavailable;
	}

	public String getDigitalagendaitemsavailable() {
		return digitalagendaitemsavailable;
	}

	public void setDigitalagendaitemsavailable(String digitalagendaitemsavailable) {
		this.digitalagendaitemsavailable = digitalagendaitemsavailable;
	}

	public String getRateteacherengagementformeeting() {
		return rateteacherengagementformeeting;
	}

	public void setRateteacherengagementformeeting(String rateteacherengagementformeeting) {
		this.rateteacherengagementformeeting = rateteacherengagementformeeting;
	}

	public String getRateteacherinactionoriented() {
		return rateteacherinactionoriented;
	}

	public void setRateteacherinactionoriented(String rateteacherinactionoriented) {
		this.rateteacherinactionoriented = rateteacherinactionoriented;
	}

	public String getRaterelevancetagenda() {
		return raterelevancetagenda;
	}

	public void setRaterelevancetagenda(String raterelevancetagenda) {
		this.raterelevancetagenda = raterelevancetagenda;
	}

	public String getPhysicalsetting() {
		return physicalsetting;
	}

	public void setPhysicalsetting(String physicalsetting) {
		this.physicalsetting = physicalsetting;
	}

	public String getSocialsetting() {
		return socialsetting;
	}

	public void setSocialsetting(String socialsetting) {
		this.socialsetting = socialsetting;
	}

	public String getInternetconnectivity() {
		return internetconnectivity;
	}

	public void setInternetconnectivity(String internetconnectivity) {
		this.internetconnectivity = internetconnectivity;
	}

	public String getSmarttv() {
		return smarttv;
	}

	public void setSmarttv(String smarttv) {
		this.smarttv = smarttv;
	}

	public String getIfpb() {
		return ifpb;
	}

	public void setIfpb(String ifpb) {
		this.ifpb = ifpb;
	}

	public String getProjector() {
		return projector;
	}

	public void setProjector(String projector) {
		this.projector = projector;
	}

	public String getAnyareasofimprovement() {
		return anyareasofimprovement;
	}

	public void setAnyareasofimprovement(String anyareasofimprovement) {
		this.anyareasofimprovement = anyareasofimprovement;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	
	}

	public byte[] getUploadimage() {
		return uploadimage;
	}

	public void setUploadimage(byte[] uploadimage) {
		this.uploadimage = uploadimage;
	}

	

}

/**
 * 
 */
package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * 
 */
@Entity
@Table(name = "tdata_tracking")
public class DataTracking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "slno")
    private int slno;

    @Column(name = "enter")
    private String enter;

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

    @Column(name = "typesofcomplexmeeting")
    private String typesofcomplexmeeting;

    @Column(name = "typeofcomplexmeeting")
    private String typeofcomplexmeeting;

    @Column(name = "subjectofcomplexmeeting")
    private String subjectofcomplexmeeting;

    @Column(name = "numberofteacherattached")
    private String numberofteacherattached;

    @Column(name = "numberofteacherattended")
    private String numberofteacherattended;

    @Column(name = "agenda")
    private String agenda;

    @Column(name = "monthlyorientation")
    private String monthlyorientation;

    @Column(name = "agendaitemsavailable")
    private String agendaitemsavailable;

    @Column(name = "remark")
    private String remark;


    @Column(name = "signedattendancesheetimg")
    private String signedattendancesheetimg;

    
    @Column(name = "complexclassroomimg")
    private String complexclassroomimg;

	public int getSlno() {
		return slno;
	}

	public void setSlno(int slno) {
		this.slno = slno;
	}

	public String getEnter() {
		return enter;
	}

	public void setEnter(String enter) {
		this.enter = enter;
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

	public String getTypesofcomplexmeeting() {
		return typesofcomplexmeeting;
	}

	public void setTypesofcomplexmeeting(String typesofcomplexmeeting) {
		this.typesofcomplexmeeting = typesofcomplexmeeting;
	}

	public String getTypeofcomplexmeeting() {
		return typeofcomplexmeeting;
	}

	public void setTypeofcomplexmeeting(String typeofcomplexmeeting) {
		this.typeofcomplexmeeting = typeofcomplexmeeting;
	}

	public String getSubjectofcomplexmeeting() {
		return subjectofcomplexmeeting;
	}

	public void setSubjectofcomplexmeeting(String subjectofcomplexmeeting) {
		this.subjectofcomplexmeeting = subjectofcomplexmeeting;
	}

	public String getNumberofteacherattached() {
		return numberofteacherattached;
	}

	public void setNumberofteacherattached(String numberofteacherattached) {
		this.numberofteacherattached = numberofteacherattached;
	}

	public String getNumberofteacherattended() {
		return numberofteacherattended;
	}

	public void setNumberofteacherattended(String numberofteacherattended) {
		this.numberofteacherattended = numberofteacherattended;
	}

	public String getAgenda() {
		return agenda;
	}

	public void setAgenda(String agenda) {
		this.agenda = agenda;
	}

	public String getMonthlyorientation() {
		return monthlyorientation;
	}

	public void setMonthlyorientation(String monthlyorientation) {
		this.monthlyorientation = monthlyorientation;
	}

	public String getAgendaitemsavailable() {
		return agendaitemsavailable;
	}

	public void setAgendaitemsavailable(String agendaitemsavailable) {
		this.agendaitemsavailable = agendaitemsavailable;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSignedattendancesheetimg() {
		return signedattendancesheetimg;
	}

	public void setSignedattendancesheetimg(String signedattendancesheetimg) {
		this.signedattendancesheetimg = signedattendancesheetimg;
	}

	public String getComplexclassroomimg() {
		return complexclassroomimg;
	}

	public void setComplexclassroomimg(String complexclassroomimg) {
		this.complexclassroomimg = complexclassroomimg;
	}

	
	


}
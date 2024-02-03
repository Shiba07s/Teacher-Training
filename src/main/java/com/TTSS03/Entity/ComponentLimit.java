package com.TTSS03.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bdg_compontresource_limit")
public class ComponentLimit {
	
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long sl;

	    private String budgeted_year;
	    private String resources;
	    private String resource_type;
	    private String city_type;
	    private String approved_rate;
	    private String unit;
	    private String remarks;
	    private String created_by;
	    private String modified_by;
	    private String created_dt;
	    private String modified_dt;
	    private String record_status;
		public Long getSl() {
			return sl;
		}
		public void setSl(Long sl) {
			this.sl = sl;
		}
		public String getBudgeted_year() {
			return budgeted_year;
		}
		public void setBudgeted_year(String budgeted_year) {
			this.budgeted_year = budgeted_year;
		}
		public String getResources() {
			return resources;
		}
		public void setResources(String resources) {
			this.resources = resources;
		}
		public String getResource_type() {
			return resource_type;
		}
		public void setResource_type(String resource_type) {
			this.resource_type = resource_type;
		}
		public String getCity_type() {
			return city_type;
		}
		public void setCity_type(String city_type) {
			this.city_type = city_type;
		}
		public String getApproved_rate() {
			return approved_rate;
		}
		public void setApproved_rate(String approved_rate) {
			this.approved_rate = approved_rate;
		}
		public String getUnit() {
			return unit;
		}
		public void setUnit(String unit) {
			this.unit = unit;
		}
		public String getRemarks() {
			return remarks;
		}
		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}
		public String getCreated_by() {
			return created_by;
		}
		public void setCreated_by(String created_by) {
			this.created_by = created_by;
		}
		public String getModified_by() {
			return modified_by;
		}
		public void setModified_by(String modified_by) {
			this.modified_by = modified_by;
		}
		public String getCreated_dt() {
			return created_dt;
		}
		public void setCreated_dt(String created_dt) {
			this.created_dt = created_dt;
		}
		public String getModified_dt() {
			return modified_dt;
		}
		public void setModified_dt(String modified_dt) {
			this.modified_dt = modified_dt;
		}
		public String getRecord_status() {
			return record_status;
		}
		public void setRecord_status(String record_status) {
			this.record_status = record_status;
		}
			 
	   
}

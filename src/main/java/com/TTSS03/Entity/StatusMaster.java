package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "tstatus_master")
public class StatusMaster {
	
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private long statuscode;
		@Column(name="status_name")
		private String statusname;
		@Column(name="status_record")
		private String status = "Active";
		public long getStatuscode() {
			return statuscode;
		}
		public void setStatuscode(long statuscode) {
			this.statuscode = statuscode;
		}
		 
		public String getStatusname() {
			return statusname;
		}
		public void setStatusname(String statusname) {
			this.statusname = statusname;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		
		

}

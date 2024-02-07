package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ttargetgroupmaster")
public class TargetGroupMaster {
	
	
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long group_id;
	private String targetgroup;
	private String status="Active";
	public long getGroup_id() {
		return group_id;
	}
	public void setGroup_id(long group_id) {
		this.group_id = group_id;
	}
	public String getTargetgroup() {
		return targetgroup;
	}
	public void setTargetgroup(String targetgroup) {
		this.targetgroup = targetgroup;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	 
}

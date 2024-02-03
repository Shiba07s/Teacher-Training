package com.TTSS03.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tspellmaster")
public class SpellMaster {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long spellcode;
	private String spell;
	private String status="Active";
	public long getSpellcode() {
		return spellcode;
	}
	public void setSpellcode(long spellcode) {
		this.spellcode = spellcode;
	}
	public String getSpell() {
		return spell;
	}
	public void setSpell(String spell) {
		this.spell = spell;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}

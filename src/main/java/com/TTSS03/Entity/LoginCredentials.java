package com.TTSS03.Entity;

public class LoginCredentials {
	 
    private String treasuryid;
    private String mobilenumberteacher;
	public String getTreasuryid() {
		return treasuryid;
	}
	public void setTreasuryid(String treasuryid) {
		this.treasuryid = treasuryid;
	}
	public String getMobilenumberteacher() {
		return mobilenumberteacher;
	}
	public void setMobilenumberteacher(String mobilenumberteacher) {
		this.mobilenumberteacher = mobilenumberteacher;
	}
	public LoginCredentials(String treasuryid, String mobilenumberteacher) {
		super();
		this.treasuryid = treasuryid;
		this.mobilenumberteacher = mobilenumberteacher;
	}
	
    
	
	
 
     
}
 
package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.VendorLimit;

public interface VendorLimitService {
	
	VendorLimit findByvendorName(String vendorName);
	
	
	VendorLimit saveOneVendorLimit(VendorLimit vendorLimit);
	
	void updateVendorLimit(long vlId, VendorLimit vendorLimit) ;
	
	void deActivateVendorLimit(long vlId) ;
	
	 VendorLimit getVendorLimit(long vlId);
	 
	 List<VendorLimit> getAllVendorsList();


}

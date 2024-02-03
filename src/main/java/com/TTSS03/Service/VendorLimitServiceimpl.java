package com.TTSS03.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.VendorLimit;
import com.TTSS03.Repository.VendorLimitrepository;

@Service
public class VendorLimitServiceimpl implements VendorLimitService {
	
	@Autowired
	VendorLimitrepository VendorLimitrepo;

	@Override
	public VendorLimit findByvendorName(String vendorName) {
		// TODO Auto-generated method stub
		return VendorLimitrepo.findByVendor(vendorName);
	}

}

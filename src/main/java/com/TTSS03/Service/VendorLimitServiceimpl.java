package com.TTSS03.Service;

import java.util.List;

import javax.transaction.Transactional;

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
	
	
	@Override
	public VendorLimit saveOneVendorLimit(VendorLimit vendorLimit) {
		// TODO Auto-generated method stub
		return VendorLimitrepo.save(vendorLimit);
	}

	@Override
	@Transactional
	public void updateVendorLimit(long vlId, VendorLimit vendorLimit) {
		// TODO Auto-generated method stub
		VendorLimitrepo.updateVendorLimit(vlId, vendorLimit.getVendorName(),
												vendorLimit.getApprovedrate(),
												vendorLimit.getActualrate(),
												vendorLimit.getUnit());
		
	} 
	
//	@Override
//	@Transactional
//	public void updateVendorLimit(long vlId, VendorLimit vendorLimit) {
//		// TODO Auto-generated method stub
//		VendorLimitrepo.updateVendorLimit(vlId, vendorLimit.getVendorName(), vendorLimit.getApprovedrate(), vendorLimit.getActualrate(), vendorLimit.getUnit());
//		
//	}
	

	@Override
	@Transactional

	public void deActivateVendorLimit(long vlId) {
		// TODO Auto-generated method stub
		VendorLimitrepo.deactivateVendorLimit(vlId);
		
	}

	@Override
	public VendorLimit getVendorLimit(long vlId) {
		// TODO Auto-generated method stub
		return VendorLimitrepo.findById(vlId).orElse(null);
	}


	@Override
	public List<VendorLimit> getAllVendorsList() {
		return VendorLimitrepo.findActiveVendorLimit();
	}
	

}

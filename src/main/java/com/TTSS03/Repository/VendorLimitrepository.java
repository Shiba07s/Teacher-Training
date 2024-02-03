package com.TTSS03.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.VendorLimit;

public interface VendorLimitrepository extends JpaRepository< VendorLimit, Long> {
	
	
	 @Query("SELECT vl FROM VendorLimit vl WHERE vl.vendorName = :vendorName")
	    VendorLimit findByVendor(@Param("vendorName") String vendorName);

}

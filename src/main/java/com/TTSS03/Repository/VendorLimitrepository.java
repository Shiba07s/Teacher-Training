package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.VendorLimit;


public interface VendorLimitrepository extends JpaRepository< VendorLimit, Long> {
	
	
	 @Query("SELECT vl FROM VendorLimit vl WHERE vl.vendorName = :vendorName")
	    VendorLimit findByVendor(@Param("vendorName") String vendorName);
	 
//	 @Modifying
//	    @Query("UPDATE VendorLimit t SET t.vendorName = :vendorName, t.approvedrate=: approvedrate, t.actualrate= :actualrate, t.unit= :unit  WHERE t.sl = :vlId")
//	    int updateVendorLimit(@Param("vlId") long vlId, @Param("vendorName") String vendorName,  @Param("approvedrate") String approvedrate,  @Param("actualrate") String actualrate, @Param("unit") String unit);

	 @Modifying
	 @Query("UPDATE VendorLimit t SET t.vendorName = :vendorName, t.approvedrate = :approvedrate, t.actualrate = :actualrate, t.unit = :unit WHERE t.sl = :vlId")
	 int updateVendorLimit(
	         @Param("vlId") long vlId,
	         @Param("vendorName") String vendorName,
	         @Param("approvedrate") String approvedrate,
	         @Param("actualrate") String actualrate,
	         @Param("unit") String unit
	 );

	 
	 
	 @Modifying
	    @Query("UPDATE VendorLimit e SET e.recordStatus = 'Inactive' WHERE e.sl = :vlId")
	    void deactivateVendorLimit(@Param("vlId") long vlId);
	 
	 
	 @Query("SELECT t FROM VendorLimit t WHERE t.recordStatus = 'Active'")
	    List<VendorLimit> findActiveVendorLimit();

	 

}

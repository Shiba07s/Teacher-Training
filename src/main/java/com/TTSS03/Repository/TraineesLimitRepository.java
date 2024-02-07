package com.TTSS03.Repository;
 
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.TraineesLimit;
import com.TTSS03.Entity.VendorLimit;
 
public interface TraineesLimitRepository extends JpaRepository<TraineesLimit, Long> {
	
	 @Query("SELECT t FROM TraineesLimit t WHERE t.recordStatus = 'Active'")
	    List<TraineesLimit> findActiveTraineesLimit();
	 
	 @Modifying
	 @Query("UPDATE TraineesLimit t SET t.budgetedYear = :budgetedYear, t.traineeRole = :traineeRole, t.expenseType = :expenseType, t.unit = :unit,t.approvedRate= :approvedRate WHERE t.sl = :sl")
	 int updateTraineesLimit(
	         @Param("sl") long sl,
	         @Param("budgetedYear") String budgetedYear,
	         @Param("traineeRole") String traineeRole,
	         @Param("expenseType") String expenseType,
	         @Param("approvedRate") String approvedRate,
	         @Param("unit") String unit
	 );

	 
	 
	 @Modifying
	    @Query("UPDATE TraineesLimit e SET e.recordStatus = 'Inactive' WHERE e.sl = :sl")
	    void deactivateTraineesLimit(@Param("sl") long sl);
 
}
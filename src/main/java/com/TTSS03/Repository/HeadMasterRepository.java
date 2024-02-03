package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.HeadMaster;

public interface HeadMasterRepository extends JpaRepository<HeadMaster, Integer> {
	
	@Query(value="SELECT * FROM tbudget_head  WHERE `Record Status` = 'Active'",nativeQuery = true)
    List<HeadMaster> findAllByStatus();

	@Modifying
	@Query("UPDATE HeadMaster c SET c.tccode = :#{#headMaster.tccode}, " +
	       "c.tcnames = :#{#headMaster.tcnames} " +  // Removed comma here
	       "WHERE c.sl = :sl")
	int update(@Param("sl") int sl, @Param("headMaster") HeadMaster headMaster);

}

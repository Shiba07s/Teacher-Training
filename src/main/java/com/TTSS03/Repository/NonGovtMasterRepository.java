package com.TTSS03.Repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.NonGovtMaster;

public interface NonGovtMasterRepository extends JpaRepository<NonGovtMaster, Long> {
	
	@Query("SELECT ss FROM NonGovtMaster ss WHERE ss.cfms_id = :cfms_id")
	NonGovtMaster findByCfmsId(@Param("cfms_id") String cfms_id);
	
	
	@Query("SELECT t FROM NonGovtMaster t WHERE t.cfms_id = :cfms_id AND t.mobileno_teacher = :mobileno_teacher")
	NonGovtMaster findBycfmsIdAndMobileNumber(@Param("cfms_id") String cfms_id,
			@Param("mobileno_teacher") String mobileno_teacher);

}

package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.MandalMaster;

public interface MandalMasterRepository extends JpaRepository<MandalMaster, Integer> {
	
	 @Query("SELECT DISTINCT t.Mname FROM MandalMaster t WHERE t.District = :district")
	  List<String> findMandalNamesByDistrict(@Param("district") String district);
}

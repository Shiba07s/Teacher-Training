package com.TTSS03.Repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.AppliedTrainingsFromTrainee;

public interface AppliedTrainingsFromTraineeRepository extends JpaRepository<AppliedTrainingsFromTrainee, Integer> {
	
	 @Query("SELECT a FROM AppliedTrainingsFromTrainee a WHERE a.treasuryid = :treasuryid")
	    List<AppliedTrainingsFromTrainee> findByTreasuryId(@Param("treasuryid") String treasuryid);

	 @Query("SELECT a FROM AppliedTrainingsFromTrainee a WHERE a.treasuryid = :treasuryid AND a.ref_planner_id = :ref_planner_id")
	 List<AppliedTrainingsFromTrainee> findByTreasuryIdAndPlannerId(
	            @Param("treasuryid") String treasuryid,
	            @Param("ref_planner_id") String ref_planner_id
	    );
	 
}

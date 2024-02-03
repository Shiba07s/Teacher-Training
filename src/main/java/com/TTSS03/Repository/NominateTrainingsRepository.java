package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.NominateTrainings;

public interface NominateTrainingsRepository extends JpaRepository<NominateTrainings, Integer> {

	List<NominateTrainings> findByAppliedtype(String appliedType);
	
	@Modifying
	@Query("UPDATE NominateTrainings v SET v.status = 'approved' WHERE v.treasuryid = :treasuryId  AND v.ref_planner_id = :refPlannerId")
	void updateStatusByTreasuryId(@Param("treasuryId") String treasuryId, @Param("refPlannerId") String refPlannerId);

//	
//	Optional<NominateTrainings> findByTreasuryIdAndPlannerId(String treasuryId, String plannerId);
//
//	List<NominateTrainings> findByTreasuryIdAndRefPlannerId(String treasuryid, String ref_planner_id);

}

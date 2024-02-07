package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.PreviousTrainings;

public interface PreviousTrainingRepository extends JpaRepository<PreviousTrainings, Integer> {
	

	@Query("SELECT sv FROM PreviousTrainings sv WHERE sv.treasuryid = :treasuryid")
	List<PreviousTrainings> findByTreasuryId(@Param ("treasuryid")String treasuryId);

}

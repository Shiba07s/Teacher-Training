package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.TrainingMode;

public interface TrainingModeRepository extends JpaRepository<TrainingMode, Long> {
	
	
	
	 @Modifying
	    @Query("UPDATE TrainingMode t SET t.trainingMode = :trainingMode WHERE t.trainingModecode = :trainingModecode")
	    int updateTrainingMode(@Param("trainingModecode") long trainingModecode, @Param("trainingMode") String trainingMode);

	
	
	 @Modifying
	    @Query("UPDATE TrainingMode e SET e.trainingStatus = 'Inactive' WHERE e.trainingModecode = :trainingModecode")
	    void deactivateTrainingMode(@Param("trainingModecode") long trainingModecode);
	
	
	 @Query("SELECT t FROM TrainingMode t WHERE t.trainingStatus = 'Active'")
	    List<TrainingMode> findActiveTrainingMode();

}


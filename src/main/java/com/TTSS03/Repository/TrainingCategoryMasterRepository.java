package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.TrainingCategoryMaster;

public interface TrainingCategoryMasterRepository extends JpaRepository<TrainingCategoryMaster, Long> {
	 @Modifying
	    @Query("UPDATE TrainingCategoryMaster t SET t.trainingcategory = :trainingcategory WHERE t.uid = :uid")
	    int updateTrainingCategory(@Param("uid") long uid, @Param("trainingcategory") String trainingcategory);
   
	 
	 
	 @Modifying
	    @Query("UPDATE TrainingCategoryMaster e SET e.status = 'Inactive' WHERE e.uid = :uid")
	    void deactivateTrainingCategory(@Param("uid") long uid);
	 
	 
	 @Query("SELECT t FROM TrainingCategoryMaster t WHERE t.status = 'Active'")
	    List<TrainingCategoryMaster> findActiveCategiry();
	    
}




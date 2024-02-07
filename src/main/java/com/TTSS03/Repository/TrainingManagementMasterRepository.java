package com.TTSS03.Repository;
 
import java.util.List;
 
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
 
import com.TTSS03.Entity.TrainingManagementMaster;
 
public interface TrainingManagementMasterRepository extends JpaRepository<TrainingManagementMaster, Long> {

	 @Modifying
	    @Query("UPDATE TrainingManagementMaster t SET t.management_name = :management_name WHERE t.management_code = :management_code")
	    int updateTrainingManagement(@Param("management_code") long management_code, @Param("management_name") String management_name);
 
	 
	 @Modifying
	    @Query("UPDATE TrainingManagementMaster e SET e.status = 'Inactive' WHERE e.management_code = :management_code")
	    void deactivateTrainingManagement(@Param("management_code") long management_code);

	 @Query("SELECT t FROM TrainingManagementMaster t WHERE t.status = 'Active'")
	    List<TrainingManagementMaster> findActiveTrainingManagement();
 
}
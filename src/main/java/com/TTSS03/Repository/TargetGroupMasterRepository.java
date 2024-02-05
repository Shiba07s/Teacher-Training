package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.TTSS03.Entity.TargetGroupMaster;

public interface TargetGroupMasterRepository extends JpaRepository<TargetGroupMaster, Long> {
	
	 @Query("SELECT t FROM TargetGroupMaster t WHERE t.status = 'Active'")
	    List<TargetGroupMaster> findActiveGroup();
	 

	 @Modifying
	    @Query("UPDATE TargetGroupMaster t SET t.targetgroup = :targetgroup WHERE t.group_id = :groupId")
	    int updateTrainingGroup(@Param("groupId") long groupId, @Param("targetgroup") String targetgroup);
 
	
	
	 @Modifying
	    @Query("UPDATE TargetGroupMaster e SET e.status = 'Inactive' WHERE e.group_id = :groupId")
	    void deactivateTrainingGroup(@Param("groupId") long groupId);
	
		 
//		 @Modifying
//		    @Query("UPDATE TargetGroupMaster e SET e.status = 'Inactive' WHERE e.group_id = :groupId")
//		    void deactivateGroup(@Param("groupId") long groupId);

}

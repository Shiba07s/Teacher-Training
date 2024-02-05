package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.AttendGradeMaster;
import com.TTSS03.Entity.TargetGroupMaster;

public interface AttendGradeMasterRepository extends JpaRepository<AttendGradeMaster, Long> {
	
//	 @Query("SELECT t FROM AttendGradeMaster t WHERE t.status != 'Inactive'")
//	List<AttendGradeMaster> findByStatus();
//	 
//	 @Modifying
//	    @Query("UPDATE AttendGradeMaster e SET e.status = 'Inactive' WHERE e.slno = :id")
//	    void deactivateGrade(@Param("id") long id);
//	 
	 @Query("SELECT t FROM AttendGradeMaster t WHERE t.status = 'Active'")
	    List<AttendGradeMaster> findActiveStatus();
	 

	 @Modifying
	    @Query("UPDATE AttendGradeMaster t SET t.attendgrade = :attendgrade WHERE t.slno = :gradeId")
	    int updateTrainingGrade(@Param("gradeId") long gradeId, @Param("attendgrade") String attendgrade);

	
	
	 @Modifying
	    @Query("UPDATE AttendGradeMaster e SET e.status = 'Inactive' WHERE e.slno = :gradeId")
	    void deactivateTrainingGrade(@Param("gradeId") long gradeId);
}

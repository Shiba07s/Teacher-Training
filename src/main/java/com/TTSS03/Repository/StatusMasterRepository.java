package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.StatusMaster;

public interface StatusMasterRepository extends JpaRepository<StatusMaster, Long> {
	
	 @Modifying
	    @Query("UPDATE StatusMaster t SET t.statusname = :statusname WHERE t.statuscode = :statuscode")
	    int updateTrainingSpell(@Param("statuscode") long statuscode, @Param("statusname") String statusname);

	
	
	 @Modifying
	    @Query("UPDATE StatusMaster e SET e.status = 'Inactive' WHERE e.statuscode = :statuscode")
	    void deactivateTrainingSpell(@Param("statuscode") long statuscode);
	
	
	 @Query("SELECT t FROM StatusMaster t WHERE t.status = 'Active'")
	    List<StatusMaster> findActiveStatusName();

}

package com.TTSS03.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.SessionMaster;

public interface SessionMasterRepository extends JpaRepository<SessionMaster, Long> {
	

//    @Modifying
//    @Query("UPDATE SessionMaster a SET " +
//            "a.sessionCode = :sessionCode, " +
//            "a.sessionCode = :sessionName, " +
//            "a.fromDate = :fromDate, " +
//            "a.toDate = :toDate, " +
//            "a.tstatus = :tstatus " +
//            "WHERE a.refplannerid = :refplannerid")
//	  int updateActualDataa(
//	            @Param("sessionCode") String sessionCode,
//	            @Param("sessionName") String sessionName,
//	            @Param("fromDate") String fromDate,
//	            @Param("toDate") String toDate,
//	            @Param("tstatus") String tstatus);
//
//	Optional<SessionMaster> findBySessionName(String sessionName);
//  int updateActualDataa(String sessionCode, String sessionName, String fromDate, String toDate, String status,
//			String sessionName2);
	

//    @Modifying
//    @Query("UPDATE SessionMaster a SET " +
//            "a.sessionName = :sessionName, " +
//            "a.sessionCode = :sessionCode, " +
//            "a.fromDate = :fromDate, " +
//            "a.toDate = :toDate, " +
//            "a.status = :status " +
//            "WHERE a.id = :id")
//    int updateTrainingSession(
//            @Param("sessionName") String sessionName,
//            @Param("fromDate") String fromDate,
//            @Param("toDate") String toDate,
//            @Param("status") String status,
//            @Param("sessionCode") String sessionCode,
//            @Param("id") long id
//    );
//    
	
  @Modifying
  @Query("UPDATE SessionMaster a SET " +
          "a.sessionName = :sessionName, " +
          "a.sessionCode = :sessionCode, " +
          "a.fromDate = :fromDate, " +
          "a.toDate = :toDate, " +
          "a.status = :status " +
          "WHERE a.id = :id")
      int updateSession(@Param("id") long id ,@Param("sessionCode") String sessionCode,@Param("sessionName") String sessionName,  @Param("fromDate") String fromDate, @Param("toDate") String toDate,@Param("status") String status );

    //SessionMaster findBySessionName(String sessionName);
    
//    @Modifying
//    @Query("UPDATE SpellMaster t SET t.spell = :spell WHERE t.spellcode = :spellcode")
//    int updateTrainingSpell(@Param("spellcode") long spellcode, @Param("spell") String spell);



 @Modifying
    @Query("UPDATE SessionMaster e SET e.recordstatus = 'Inactive' WHERE e.id = :id")
    void deactivateTrainingSession(@Param("id") long id);


 @Query("SELECT t FROM SessionMaster t WHERE t.recordstatus = 'Active'")
    List<SessionMaster> findActiveSession();
 
 @Query("SELECT s FROM SessionMaster s WHERE s.status = 'Current' AND s.recordstatus= 'Active'")
 List<SessionMaster> findByStatusCurrent();
}



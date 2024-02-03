package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.ActualData;

public interface ActualDataRepository extends JpaRepository<ActualData, Integer> {
	
	
	
	    @Modifying
	    @Query("UPDATE ActualData a SET " +
	            "a.tmonth = :tmonth, " +
	            "a.tyear = :tyear, " +
	            "a.trainingregstartdt = :trainingregstartdt, " +
	            "a.trainingregenddt = :trainingregenddt, " +
	            "a.tagency = :tagency, " +
	            "a.tname = :tname, " +
	            "a.tsubject = :tsubject, " +
	            "a.tcategory = :tcategory, " +
	            "a.ttargetgroup = :ttargetgroup, " +
	            "a.preferdlocation = :preferdlocation, " +
	            "a.tdescription = :tdescription, " +
	            "a.tgrade = :tgrade, " +
	            "a.numberofstakeholder = :numberofstakeholder, " +
	            "a.numberdayneeded = :numberdayneeded, " +
	            "a.tmode = :tmode, " +
	            "a.thoursperday = :thoursperday, " +
	            "a.totalhours = :totalhours, " +
	            "a.tstatus = :tstatus " +
	            "WHERE a.refplannerid = :refplannerid")
	    int updateActualData(
	            @Param("refplannerid") int refplannerid,
	            @Param("tmonth") String tmonth,
	            @Param("tyear") String tyear,
	            @Param("trainingregstartdt") String trainingregstartdt,
	            @Param("trainingregenddt") String trainingregenddt,
	            @Param("tagency") String tagency,
	            @Param("tname") String tname,
	            @Param("tsubject") String tsubject,
	            @Param("tcategory") String tcategory,
	            @Param("ttargetgroup") String ttargetgroup,
	            @Param("preferdlocation") String preferdlocation,
	            @Param("tdescription") String tdescription,
	            @Param("tgrade") String tgradess,
	            @Param("numberofstakeholder") String numberofstakeholder,
	            @Param("numberdayneeded") String numberdayneeded,
	            @Param("tmode") String tmode,
	            @Param("thoursperday") String thoursperday,
	            @Param("totalhours") String totalhours,
	            @Param("tstatus") String tstatus);
	    
	    
	    @Modifying
	    @Query("UPDATE ActualData e SET e.tstatus = 'Inactive' WHERE e.refplannerid = :refplannerid")
	    void deactivateTraining(@Param("refplannerid") String refplannerid);
	    

	    @Query("SELECT t FROM ActualData t WHERE t.tstatus != 'Inactive'")
	    List<ActualData> findActiveData();
	    
	    @Query("SELECT t FROM ActualData t WHERE t.tyear= :tyear and t.tmonth=:tmonth")
	    List<ActualData> findActualDatabyYearAndMonth(@Param("tyear")String tyear,@Param("tmonth")String tmonth);
	    		  
	}
	

	

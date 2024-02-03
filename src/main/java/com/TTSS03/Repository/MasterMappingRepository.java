package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.MasterMapping;


public interface MasterMappingRepository extends JpaRepository<MasterMapping, Long> {

	
	@Modifying
    @Query(value = "?1", nativeQuery = true)
    void saveOrUpdateEntityWithQuery(String query);
	
	
	@Query("SELECT ss FROM MasterMapping ss WHERE ss.trainingid = :trainingid and ss.venueid=:venueid")
	List<MasterMapping> findByTrainingId(@Param("trainingid") long trainingid,@Param("venueid")String venueid);
	
	 
	 @Modifying
	    @Query("UPDATE MasterMapping e SET e.recordstatus = 'Inactive' WHERE e.slno = :mappingcode")
	    void deactivateTrainingMasterMapping(@Param("mappingcode") long mappingcode);
	 
	 
	 @Query("SELECT t FROM MasterMapping t WHERE t.recordstatus = 'Active'")
	    List<MasterMapping> findActiveMappingData();
	 
	 @Modifying
	 @Query("UPDATE MasterMapping t SET t.trainingid = :trainingid, t.trainingname = :trainingname, t.venueid = :venueid, t.venuename = :venuename, "
	         + "t.ccflag = :ccflag, t.cctreasuryid = :cctreasuryid, t.ccname = :ccname, t.ccdesignation = :ccdesignation, t.ccdistrict = :ccdistrict, t.ccmandal = :ccmandal, t.ccemail = :ccemail, t.ccmobile = :ccmobile, "
	         + "t.accflag = :accflag, t.acctreasuryid = :acctreasuryid, t.accname = :accname, t.accdesignation = :accdesignation, t.accdistrict = :accdistrict, t.accmandal = :accmandal, t.accemail = :accemail, t.accmobile = :accmobile, "
	         + "t.rpflag = :rpflag, t.rptreasuryid = :rptreasuryid, t.rpname = :rpname, t.rpdesignation = :rpdesignation, t.rpdistrict = :rpdistrict, t.rpmandal = :rpmandal, t.rpemail = :rpemail, t.rpmobile = :rpmobile, "
	         + "t.osflag = :osflag, t.ostreasuryid = :ostreasuryid, t.osname = :osname, t.osdesignation = :osdesignation, t.osdistrict = :osdistrict, t.osmandal = :osmandal, t.osemail = :osemail, t.osmobile = :osmobile, "
	         + "t.ppflag = :ppflag, t.pptreasuryid = :pptreasuryid, t.ppname = :ppname, t.ppdesignation = :ppdesignation, t.ppdistrict = :ppdistrict, t.ppmandal = :ppmandal, t.ppemail = :ppemail, t.ppmobile = :ppmobile, t.status = :status "
	         + "WHERE t.slno = :mappingcode")
	 int updateMapping(@Param("mappingcode") long mappingcode, @Param("trainingid") long trainingid, @Param("trainingname") String trainingname, @Param("venueid") String venueid, @Param("venuename") String venuename,
	                   @Param("ccflag") String ccflag, @Param("cctreasuryid") String cctreasuryid, @Param("ccname") String ccname, @Param("ccdesignation") String ccdesignation, @Param("ccdistrict") String ccdistrict, @Param("ccmandal") String ccmandal, @Param("ccemail") String ccemail, @Param("ccmobile") String ccmobile,
	                   @Param("accflag") String accflag, @Param("acctreasuryid") String acctreasuryid, @Param("accname") String accname, @Param("accdesignation") String accdesignation, @Param("accdistrict") String accdistrict, @Param("accmandal") String accmandal, @Param("accemail") String accemail, @Param("accmobile") String accmobile,
	                   @Param("rpflag") String rpflag, @Param("rptreasuryid") String rptreasuryid, @Param("rpname") String rpname, @Param("rpdesignation") String rpdesignation, @Param("rpdistrict") String rpdistrict, @Param("rpmandal") String rpmandal, @Param("rpemail") String rpemail, @Param("rpmobile") String rpmobile,
	                   @Param("osflag") String osflag, @Param("ostreasuryid") String ostreasuryid, @Param("osname") String osname, @Param("osdesignation") String osdesignation, @Param("osdistrict") String osdistrict, @Param("osmandal") String osmandal, @Param("osemail") String osemail, @Param("osmobile") String osmobile,
	                   @Param("ppflag") String ppflag, @Param("pptreasuryid") String pptreasuryid, @Param("ppname") String ppname, @Param("ppdesignation") String ppdesignation, @Param("ppdistrict") String ppdistrict, @Param("ppmandal") String ppmandal, @Param("ppemail") String ppemail, @Param("ppmobile") String ppmobile,
	                   @Param("status") String status);

	 
	 @Query("SELECT sv FROM MasterMapping sv WHERE sv.slno = :mappingcode")
		List<MasterMapping> findByMappingId(@Param("mappingcode") long mappingcode);
	 
//	 @Modifying
//	    @Query("UPDATE MasterMapping t SET t.trainingid = :trainingid , t.trainingname=:trainingname,t.venueid=:venueid ,t.venuename=:venuename,"
//	    		+ "t.ccflag=:ccflag,t.cctreasuryid=:cctreasuryid,t.ccname=:ccname,t.ccdesignation=:ccdesignation,t.ccdistrict=:ccdistrict,t.ccmandal=:ccmandal,t.ccemail=:ccemail,t.ccmobile=:ccmobile,"
//	    		+ "t.accflag=:accflag,t.acctreasuryid=:acctreasuryid,t.accname=:accname,t.accdesignation=:accdesignation,t.accdistrict=:accdistrict,t.accmandal=:accmandal,t.accemail=:accemail,t.accmobile=:accmobile,"
//	    		+ "t.rpflag=:rpflag,t.rptreasuryid=:rptreasuryid,t.rpname=:rpname,t.rpdesignation=:rpdesignation,t.rpdistrict=:rpdistrict,t.rpmandal=:rpmandal,t.rpemail=:rpemail,t.rpmobile=:rpmobile,"
//	    		+ "t.osflag=:osflag,t.ostreasuryid=:ostreasuryid,t.osname=:osname,t.osdesignation=:osdesignation,t.osdistrict=:osdistrict,t.osmandal=:osmandal,t.osemail=:osemail,t.osmobile=:osmobile,"
//	    		+ "t.ppflag=:ppflag,t.pptreasuryid=:pptreasuryid,t.ppname=:ppname,t.ppdesignation=:ppdesignation,t.ppdistrict=:ppdistrict,t.ppmandal=:ppmandal,t.ppemail=:ppemail,t.ppmobile=:ppmobile  WHERE t.slno = :mappingcode")
////	    		+ "t.maplocation=:maplocation WHERE t.vid = :vid")
//	    int updateMapping(@Param("mappingcode") long mappingcode, @Param("trainingid") long trainingid,@Param("trainingname") String trainingname, @Param("venueid") String venueid,@Param("venuename") String venuename,
//	    		@Param("ccflag") String ccflag,@Param("cctreasuryid") String cctreasuryid,@Param("ccname") String ccname,@Param("ccdesignation") String ccdesignation,@Param("ccdistrict") String ccdistrict,@Param("ccmandal") String ccmandal,@Param("ccemail") String ccemail,@Param("ccmobile") String ccmobile,
//	    		@Param("accflag") String accflag,@Param("acctreasuryid") String acctreasuryid,@Param("accname") String accname,@Param("accdesignation") String accdesignation,@Param("accdistrict") String accdistrict,@Param("accmandal") String accmandal,@Param("accemail") String accemail,@Param("accmobile") String accmobile,
//	    		@Param("rpflag") String rpflag,@Param("rptreasuryid") String rptreasuryid,@Param("rpname") String rpname,@Param("rpdesignation") String rpdesignation,@Param("rpdistrict") String rpdistrict,@Param("rpmandal") String rpmandal,@Param("rpemail") String rpemail,@Param("rpmobile") String rpmobile,
//	    		@Param("osflag") String osflag,@Param("ostreasuryid") String ostreasuryid,@Param("osname") String osname,@Param("osdesignation") String osdesignation,@Param("osdistrict") String osdistrict,@Param("osmandal") String osmandal,@Param("osemail") String osemail,@Param("osmobile") String osmobile,
//	    		@Param("ppflag") String ppflag,@Param("pptreasuryid") String pptreasuryid,@Param("ppname") String ppname,@Param("ppdesignation") String ppdesignation,@Param("ppdistrict") String ppdistrict,@Param("ppmandal") String ppmandal,@Param("ppemail") String ppemail,@Param("ppmobile") String ppmobile,
//	    		 @Param("status") String status);
	 

	}
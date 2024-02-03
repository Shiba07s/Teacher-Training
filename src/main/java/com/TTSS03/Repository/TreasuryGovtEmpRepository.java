package com.TTSS03.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.TreasuryGovt;

public interface TreasuryGovtEmpRepository extends JpaRepository<TreasuryGovt, Long> {

	@Query("SELECT ss FROM TreasuryGovt ss WHERE ss.treasuryid = :treasuryid")
	List<TreasuryGovt> findByTreasuryId(@Param("treasuryid") String treasuryid);

	@Query("SELECT t FROM TreasuryGovt t WHERE t.treasuryid = :treasuryid AND t.mobilenumberteacher = :mobilenumberteacher")
	Optional<TreasuryGovt> findByTreasuryIdAndMobileNumber(@Param("treasuryid") String treasuryid,
			@Param("mobilenumberteacher") String mobilenumberteacher);

	@Query("SELECT DISTINCT t.districtnamewrk FROM TreasuryGovt t")
	List<String> findDistinctDistrictnamewrk();
	
	  @Query("SELECT DISTINCT t.mandalnamewrk FROM TreasuryGovt t WHERE t.districtnamewrk = :district")
	    List<Object[]> findDistinctMandalNamesByDistrict(String district);
	    

	    @Query(value = "SELECT tm.treasuryid, tm.mobileno_teacher, tm.teacher_name, tm.design, tm.dob, tm.district_name, tm.school_name, tm.school_code " +
	                   "FROM tteacher_master_update tm " +
	                   "WHERE tm.district_name = :district " +
	                   "AND tm.mandal_name = :mandal " +
	                   "AND NOT EXISTS (" +
	                   "    SELECT 1 " +
	                   "    FROM mytrainings my " +
	                   "    WHERE tm.treasuryid = my.treasuryid " +
	                   "    AND my.ref_planner_id = :refPlannerId)", nativeQuery = true)
	    List<Object[]> findTeacherDetails(@Param("district") String district,
	                                      @Param("mandal") String mandal,
	                                      @Param("refPlannerId") String refPlannerId);
	    
	    @Query("SELECT ss FROM TreasuryGovt ss WHERE ss.districtnamewrk = :districtnamewrk and ss.mandalnamewrk=:mandalnamewrk")
		List<TreasuryGovt> findByDistrictMandal(@Param("districtnamewrk") String districtnamewrk,@Param("mandalnamewrk") String mandalnamewrk);
	    
	    
	    
	    
	}
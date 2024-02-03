package com.TTSS03.Repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.DistrictMaster;

public interface DistrictMasterRepository extends JpaRepository<DistrictMaster, Integer> {
	
	@Query("SELECT DISTINCT t.DName FROM DistrictMaster t")
	List<String> findDistinctDistrict();
	
	@Query(value = "SELECT tt.treasuryid, tt.mobilenumberteacher, tt.username, tt.surname, tt.designation, tt.dob, tt.districtnamewrk, tt.schcd " +
	        "FROM ttreasurymaster tt " +
	        "WHERE tt.districtnamewrk = :district AND tt.mandalnamewrk = :mandal", nativeQuery = true)
	List<Object[]> findTeachersByDistrictAndMandal(@Param("district") String district, @Param("mandal") String mandal);

}

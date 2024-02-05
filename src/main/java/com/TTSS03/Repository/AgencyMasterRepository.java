package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.TTSS03.Entity.AgencyMaster;

public interface AgencyMasterRepository extends JpaRepository<AgencyMaster, Integer> {
	
	@Modifying
	@Query("UPDATE AgencyMaster c SET c.agency = :agency WHERE c.slno = :slno")
	int updateAgency(int slno, String agency);

	@Query("SELECT c FROM AgencyMaster c WHERE c.record_status = 'Active'")
	List<AgencyMaster> findByStatus();

	@Modifying
	@Query("UPDATE AgencyMaster c SET c.record_status = 'Inctive' WHERE c.slno = :slno")
	void deactivateAgency(int slno);

}

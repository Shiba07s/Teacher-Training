package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.TTSS03.Entity.VenderMaster;

public interface VenderMasterRepository extends JpaRepository<VenderMaster, Integer> {

	@Query(value = "SELECT * FROM bdg_vendermaster where `Record Status` ='Active'", nativeQuery = true)
	List<VenderMaster> findAllActiveVendors();

	@Modifying
	@Query("UPDATE VenderMaster v SET " + "v.vendorcode = :#{#venderMaster.vendorcode}, "
			+ "v.vendor = :#{#venderMaster.vendor}, " + "v.name = :#{#venderMaster.name}, "
			+ "v.address = :#{#venderMaster.address}, " + "v.contractperson = :#{#venderMaster.contractperson}, "
			+ "v.emailid = :#{#venderMaster.emailid}, " + "v.contactno = :#{#venderMaster.contactno} "
			+ "WHERE v.sl = :sl")
	int updateVender(@Param("sl") int sl, @Param("venderMaster") VenderMaster venderMaster);

	@Modifying
	@Query("UPDATE VenderMaster v SET v.recordstatus = 'Inactive' WHERE v.sl = :sl")
	void deactivate(@Param("sl") int sl);


}

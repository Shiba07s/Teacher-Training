package com.TTSS03.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.ComponentLimit;

public interface ComponentLimitRepository extends JpaRepository<ComponentLimit, Long> {

	@Query("SELECT r.resources, r.approved_rate,r.unit FROM ComponentLimit r WHERE r.resources IN (:resourceNames)")
	List<Object[]> findResourcesAndRatesByNames(@Param("resourceNames") List<String> resourceNames);

	@Query("SELECT c FROM ComponentLimit c WHERE c.record_status = 'Active'")
	List<ComponentLimit> findAllActiveComponents();

	@Transactional
	@Modifying
	@Query("UPDATE ComponentLimit c SET c.budgeted_year = :#{#componentLimit.budgeted_year}, "
			+ "c.resources = :#{#componentLimit.resources}, " + "c.approved_rate = :#{#componentLimit.approved_rate}, "
			+ "c.unit = :#{#componentLimit.unit} "
			+ "WHERE c.sl = :sl")
	int updateComponentLimit(@Param("sl") long sl, @Param("componentLimit") ComponentLimit componentLimit);

}

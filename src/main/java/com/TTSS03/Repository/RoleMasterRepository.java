package com.TTSS03.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.RoleMaster;

public interface RoleMasterRepository extends JpaRepository<RoleMaster, Integer> {
	
	@Query("SELECT rm FROM RoleMaster rm WHERE rm.role_name = :role_name")
	RoleMaster findByRoleName(@Param("role_name") String role_name);}

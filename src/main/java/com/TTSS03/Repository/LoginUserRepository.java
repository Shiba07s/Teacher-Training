package com.TTSS03.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.LoginUser;


public interface LoginUserRepository extends JpaRepository<LoginUser, Integer> {
	
	@Query("SELECT lu FROM LoginUser lu WHERE lu.user_name = :user_name AND lu.user_password = :user_password AND lu.role_id = :role_id")
	LoginUser findByUserNameAndUserPasswordAndRoleId(
	    @Param("user_name") String user_name,
	    @Param("user_password") String user_password,
	    @Param("role_id") int role_id
	);


}

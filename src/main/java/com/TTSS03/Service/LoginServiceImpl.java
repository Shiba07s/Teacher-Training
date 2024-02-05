package com.TTSS03.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.LoginUser;
import com.TTSS03.Entity.RoleMaster;
import com.TTSS03.Repository.LoginUserRepository;
import com.TTSS03.Repository.RoleMasterRepository;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	RoleMasterRepository RoleMasterRepo;
	
	@Autowired
	LoginUserRepository LoginUserRepo;

	@Override
	public boolean checkUser(String user_name, String user_password, String role_name) {
		
		RoleMaster role = RoleMasterRepo.findByRoleName(role_name);
		
		if (role != null) {
			
            LoginUser user = LoginUserRepo.findByUserNameAndUserPasswordAndRoleId(user_name, user_password,role.getRole_id());
 
            return user != null;
        }
 
        return false; 
    }
	}



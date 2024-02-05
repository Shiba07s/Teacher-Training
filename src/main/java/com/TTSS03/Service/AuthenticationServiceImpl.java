package com.TTSS03.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.AdminLogin;
import com.TTSS03.Entity.TreasuryGovt;
import com.TTSS03.Repository.TreasuryGovtEmpRepository;

@Service
public class AuthenticationServiceImpl implements AuthenticationService {
	@Autowired
	private TreasuryGovtEmpRepository treasuryGovtRepo;
	public Optional<TreasuryGovt> findByTreasuryIdAndMobileNumber(String treasuryid, String mobilenumberteacher) {
        return treasuryGovtRepo.findByTreasuryIdAndMobileNumber(treasuryid, mobilenumberteacher);
    }

 
	  private static final AdminLogin USER_1 = new AdminLogin("admin01", "admin01");
	    private static final AdminLogin USER_2 = new AdminLogin("admin02", "admin02");
	    private static final AdminLogin USER_3 = new AdminLogin("admin03", "admin03");
 
	    public boolean isValidUser(String username, String password) {
	        return USER_1.getUsername().equals(username) && USER_1.getPassword().equals(password) ||
	               USER_2.getUsername().equals(username) && USER_2.getPassword().equals(password) ||
	               USER_3.getUsername().equals(username) && USER_3.getPassword().equals(password);
	    }
 
}
package com.TTSS03.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Service.LoginService;
import com.TTSS03.utill.LoginRequest;

@RestController
@RequestMapping("/api")
public class LoginController {

    @Autowired
    private LoginService loginService;
	

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody LoginRequest loginRequest) {
    	

    		String role_name = loginRequest.getUser_name();
    		String user_name = loginRequest.getUser_password();
    		String user_password = loginRequest.getRole_name();
        boolean isAuthenticated = loginService.checkUser(user_name, user_password, role_name);
        if (isAuthenticated) {
            return ResponseEntity.ok("Authentication successful As : " +role_name);
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Authentication failed");
        }
    }
}

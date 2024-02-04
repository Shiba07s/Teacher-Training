package com.TTSS03.Service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.Test;
import com.TTSS03.Repository.TestRepository;

@Service
public class TestServiceImpl implements TestService {
	
	@Autowired
	TestRepository testRepository;

	@Override
	public Test saveoneRecord(Test test) {
	return testRepository.save(test);
	}

}

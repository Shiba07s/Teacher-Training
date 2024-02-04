package com.TTSS03.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.NonGovtMaster;
import com.TTSS03.Repository.NonGovtMasterRepository;

@Service
public class NonGovtMasterServiceImpl implements NonGovtMasterService {
	
	@Autowired
	NonGovtMasterRepository NonGovtMasterRepo;

	@Override
	public NonGovtMaster findCfmsId(String cfms_id) {
		// TODO Auto-generated method stub
		return NonGovtMasterRepo.findByCfmsId(cfms_id);
		
	}

	

}

/**
 * 
 */
package com.TTSS03.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.AllPreviousTrainings;
import com.TTSS03.Repository.AllPreviousTrainingsRepository;

/**
 * 
 */
@Service
public class AllPreviousTrainingsServiceImpl implements AllPreviousTrainingsService {
	
	
	@Autowired
	private AllPreviousTrainingsRepository AllPreviousTrainingsRepo;

	@Override
	public List<AllPreviousTrainings> allPrevioustrainings() {
		// TODO Auto-generated method stub
		return AllPreviousTrainingsRepo.findAll();
	}

}

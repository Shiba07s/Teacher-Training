package com.TTSS03.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.TTSS03.Entity.AttendGradeMaster;
import com.TTSS03.Repository.AttendGradeMasterRepository;


@Service
public class AttendGradeMasterServiceImpl implements AttendGradeService {
	
	
	@Autowired
	AttendGradeMasterRepository attendGradeMasterRepo;

	@Override
	public List<AttendGradeMaster> getAllGrade() {
		return attendGradeMasterRepo.findActiveStatus();
	}

	@Override
	public AttendGradeMaster createNewGrade(AttendGradeMaster attendGradeMaster) {
		return attendGradeMasterRepo.save(attendGradeMaster);
	}
	
	@Override
	@Transactional
	public void updateTrainingGrade(long gradeId , String attendgrade) {
		attendGradeMasterRepo.updateTrainingGrade(gradeId, attendgrade);
		
	}
 
	@Override
	@Transactional
	public void deActivateTrainingGrade(long gradeId) {
		attendGradeMasterRepo.deactivateTrainingGrade(gradeId);
		
	}

	@Override
	public AttendGradeMaster getGrade(long slno) {
		// TODO Auto-generated method stub
		return attendGradeMasterRepo.findById(slno).orElse(null);
	}

	
	

}

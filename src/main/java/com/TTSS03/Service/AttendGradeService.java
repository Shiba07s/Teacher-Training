package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.AttendGradeMaster;

public interface AttendGradeService {
	
	List<AttendGradeMaster>getAllGrade();
	
	AttendGradeMaster createNewGrade(AttendGradeMaster attendGradeMaster);
	
	 void deActivateTrainingGrade(long gradeId) ;
	 void updateTrainingGrade(long gradeId , String attendgrade);

	AttendGradeMaster getGrade(long slno);

}

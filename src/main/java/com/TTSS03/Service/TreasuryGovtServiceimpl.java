package com.TTSS03.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.TreasuryGovt;
import com.TTSS03.Repository.TreasuryGovtEmpRepository;

@Service
public class TreasuryGovtServiceimpl implements TreasuryGovtService {
	
	@Autowired
	TreasuryGovtEmpRepository treasuryGovtEmpRepository;

	@Override
	public List<TreasuryGovt> getByTreasuryId(String treasuryid) {
		// TODO Auto-generated method stub
		return treasuryGovtEmpRepository.findByTreasuryId(treasuryid);
	}

	@Override
	public List<String> getDistrictName() {
		return treasuryGovtEmpRepository.findDistinctDistrictnamewrk();
	}
	
	  public List<Object[]> getDistinctMandalNamesByDistrict(String districtnamewrk) {
	        return treasuryGovtEmpRepository.findDistinctMandalNamesByDistrict(districtnamewrk);
	    }
	  
	  public List<TreasuryGovt> getTeacherDetails(String district, String mandal, String refPlannerId) {
	        List<Object[]> result = treasuryGovtEmpRepository.findTeacherDetails(district, mandal, refPlannerId);
	        return mapToObject(result);
	    }

	    private List<TreasuryGovt> mapToObject(List<Object[]> result) {
	        List<TreasuryGovt> teacherDetailsList = new ArrayList<>();

	        for (Object[] row : result) {
	        	TreasuryGovt teacherMaster = new TreasuryGovt();
	            teacherMaster.setTreasuryid((String) row[0]);
	            teacherMaster.setMobilenumberteacher((String) row[1]);
	            teacherMaster.setTeacher_name((String) row[2]);
	            teacherMaster.setDesignation((String) row[3]);
	            teacherMaster.setDob((String) row[4]);
	            teacherMaster.setDistrictnamewrk((String) row[5]);
	            teacherMaster.setSchool_name((String) row[6]);
	            teacherMaster.setSchcd((String) row[7]);
	            teacherDetailsList.add(teacherMaster);
	        }

	        return teacherDetailsList;
	    }
	    
	    @Override
		public List<TreasuryGovt> getTeacherDetailsbyDistrictAndMandal(String districtnamewrk, String mandalnamewrk) {
			// TODO Auto-generated method stub
			return treasuryGovtEmpRepository.findByDistrictMandal(districtnamewrk, mandalnamewrk);
		}

}

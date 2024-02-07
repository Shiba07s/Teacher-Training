package com.TTSS03.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.TeacherMaster;
import com.TTSS03.Entity.TreasuryGovt;
import com.TTSS03.Repository.TeacherMasterRepository;

@Service
public class TeacherMasterServiceImpl implements TeacherMasterService {
	
	@Autowired
	private TeacherMasterRepository teacherMasterRepository;
	
	//get district
	@Override
	public List<String> getDistrictNameList() {
		return teacherMasterRepository.findDistinctDistrict();
	}
	  public List<String> getMandalNamesByDistrict(String district) {
	        return teacherMasterRepository.findMandalNamesByDistrict(district);
	    }

	  @Override
		public List<Map<String, Object>> getDistrictMandalTeacher(String district, String mandal) {
			List<Object[]> result = teacherMasterRepository.findTeachersByDistrictAndMandal(district,mandal);
			return result.stream().map(row -> {
				Map<String, Object> rowData = new HashMap<>();
				rowData.put("TreasuryId", row[0]);
				rowData.put("MobileNumber", row[1]);
				rowData.put("FullName", row[2]);
				rowData.put("Designation", row[3]);
				rowData.put("DOB", row[4]);
				rowData.put("District", row[5]);
				rowData.put("SchoolName", row[6]);
				rowData.put("SchoolUdiseCode", row[7]);
				
				return rowData;
			}).collect(Collectors.toList());
			
		}


	

	@Override
	public List<TeacherMaster> getByTreasuryId(String treasuryid) {
		return teacherMasterRepository.findByTreasuryId(treasuryid);
	}

	@Override
	public List<String> getDistrictName() {
		return teacherMasterRepository.findDistinctDistrictnamewrk();
	}
	
	  public List<Object[]> getDistinctMandalNamesByDistrict(String districtnamewrk) {
	        return teacherMasterRepository.findDistinctMandalNamesByDistrict(districtnamewrk);
	    }


}

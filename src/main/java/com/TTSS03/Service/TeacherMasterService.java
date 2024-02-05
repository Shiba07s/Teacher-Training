package com.TTSS03.Service;

import java.util.List;
import java.util.Map;

import com.TTSS03.Entity.TeacherMaster;

public interface TeacherMasterService {
	
	List<String> getDistrictNameList();
	
	List<String> getMandalNamesByDistrict(String district);
	
	List<Map<String, Object>> getDistrictMandalTeacher(String district, String mandal);

	List<TeacherMaster> getByTreasuryId(String treasuryid);

	List<String> getDistrictName();

	List<Object[]> getDistinctMandalNamesByDistrict(String districtnamewrk);

}

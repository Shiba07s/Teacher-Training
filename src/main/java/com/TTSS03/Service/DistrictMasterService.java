package com.TTSS03.Service;

import java.util.List;
import java.util.Map;

public interface DistrictMasterService {
	
	List<String> getDistrictNameList();
	
	List<String> getMandalNamesByDistrict(String district);
	
	List<Map<String, Object>> getDistrictMandalTeacher(String district, String mandal);

}

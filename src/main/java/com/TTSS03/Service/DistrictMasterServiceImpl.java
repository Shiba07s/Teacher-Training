package com.TTSS03.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Repository.DistrictMasterRepository;
import com.TTSS03.Repository.MandalMasterRepository;

@Service
public class DistrictMasterServiceImpl implements DistrictMasterService {
	
	@Autowired
	private DistrictMasterRepository districtMasterRepository;
	
	@Autowired
	private MandalMasterRepository mandalMasterRepository;
	
	@Override
	public List<String> getDistrictNameList() {
		return districtMasterRepository.findDistinctDistrict();
	}
    public List<String> getMandalNamesByDistrict(String district) {
        return mandalMasterRepository.findMandalNamesByDistrict(district);
    }

	@Override
	public List<Map<String, Object>> getDistrictMandalTeacher(String district, String mandal) {
		List<Object[]> result = districtMasterRepository.findTeachersByDistrictAndMandal(district,mandal);
		return result.stream().map(row -> {
			Map<String, Object> rowData = new HashMap<>();
			rowData.put("TreasuryId", row[0]);
			rowData.put("MobileNumber", row[1]);
			rowData.put("FullName", row[2] + " " + row[3]);
			rowData.put("Designation", row[4]);
			rowData.put("DOB", row[5]);
			rowData.put("District", row[6]);
			rowData.put("SchoolUdiseCode", row[7]);
			return rowData;
		}).collect(Collectors.toList());
		
	}


}

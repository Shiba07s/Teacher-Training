package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.TreasuryGovt;

public interface TreasuryGovtService {
	
	List<TreasuryGovt>getByTreasuryId(String treasuryid);
	
	List<String> getDistrictName();
	 List<Object[]> getDistinctMandalNamesByDistrict(String districtnamewrk);
	 
	 List<TreasuryGovt> getTeacherDetails(String district, String mandal, String refPlannerId);
	 
	 List<TreasuryGovt> getTeacherDetailsbyDistrictAndMandal(String districtnamewrk, String mandalnamewrk);

}

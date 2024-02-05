package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.MasterMapping;

public interface MasterMappingService {

	
	
	List<MasterMapping> saveOne (List<MasterMapping> mastermapping);
	
    void saveOrUpdateEntity(MasterMapping masterMapping, String type);
    
    List<MasterMapping>findAllMappedtrainingsBhyId(long trainingid,String venueid);
    
    List<MasterMapping> getAllMappingList();
    
    void deActivateTrainingMappingData(long mappingcode);
    
    void updateMapping(long mappingcode, MasterMapping masterMapping);
    
    List<MasterMapping> findMappingDataUsingId(long mappingid);

}

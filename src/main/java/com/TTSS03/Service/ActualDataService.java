package com.TTSS03.Service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.TTSS03.Entity.ActualData;

public interface ActualDataService {
	
	
	ActualData saveOneData(ActualData actualData);
	
	List<ActualData>getAll();
//	ActualData getDataById(int refplannerid);
	List<ActualData>getDataById(String refplannerid);
	
	List<ActualData> findByYearAndMonth(String tyear, String tmonth);
	
	ActualData updateOne(String refplannerid,ActualData actualData);
	
	public void deactivateTraining(String refplannerid);
	
	
	
	//void uploadAndStoreFile(MultipartFile file) throws IOException;

	//void save(MultipartFile file);
//	 void save(MultipartFile file);
//	 ByteArrayInputStream load();
//	 List<ActualData> getAllTutorials();
	//void processExcelFile(MultipartFile file) throws IOException ;
	
	

}

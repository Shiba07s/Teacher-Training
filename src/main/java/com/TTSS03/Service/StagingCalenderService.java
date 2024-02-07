package com.TTSS03.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.TTSS03.Entity.StagingCalenderData;

public interface StagingCalenderService {
	
	void processExcelFile(MultipartFile file) throws IOException;
	
	 void uploadAndStoreFile(MultipartFile file) throws IOException;

}

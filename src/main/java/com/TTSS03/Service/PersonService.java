package com.TTSS03.Service;

import org.springframework.web.multipart.MultipartFile;

public interface PersonService {
	
	public void saveDataFromExcel(MultipartFile file);

}

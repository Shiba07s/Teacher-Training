package com.TTSS03.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.TTSS03.Service.PersonService;



@RestController
@RequestMapping("/api/excel")
public class ExcelController {
	
	@Autowired
	private PersonService excelService;

    @PostMapping("/upload")
    public void uploadExcelFile(@RequestParam("file") MultipartFile file) {
        excelService.saveDataFromExcel(file);
    }
}
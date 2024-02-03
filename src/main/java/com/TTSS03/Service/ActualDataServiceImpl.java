package com.TTSS03.Service;

import java.io.ByteArrayInputStream;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

//import com.opencsv.CSVReader;
//import com.opencsv.exceptions.CsvValidationException;
// 

 

import com.TTSS03.Entity.ActualData;
import com.TTSS03.Repository.ActualDataRepository;
import com.TTSS03.utill.ExcelHelper;

 
@Service
public class ActualDataServiceImpl implements ActualDataService {
	
	@Autowired
	ActualDataRepository actualDataRepo;

	@Override
	public ActualData saveOneData(ActualData actualData) {
		return actualDataRepo.save(actualData);
	}
	@Override
	public ActualData getDataById(int refplannerid) {
		// TODO Auto-generated method stub
		return actualDataRepo.findById(refplannerid).get();
	}

	@Override
	public List<ActualData> getAll() {
		return actualDataRepo.findActiveData();
	}
	
	@Override
	public List<ActualData> findByYearAndMonth(String tyear, String tmonth) {
		// TODO Auto-generated method stub
		return actualDataRepo.findActualDatabyYearAndMonth(tyear, tmonth);
	}

	@Override
	@Transactional
    public ActualData updateOne(int refplannerid, ActualData actualData) {
        int updatedRows = actualDataRepo.updateActualData(
                refplannerid,
                actualData.getTmonth(),
                actualData.getTyear(),
                actualData.getTrainingregstartdt(),
                actualData.getTrainingregenddt(),
                actualData.getTagency(),
                actualData.getTname(),
                actualData.getTsubject(),
                actualData.getTcategory(),
                actualData.getTtargetgroup(),
                actualData.getPreferdlocation(),
                actualData.getTdescription(),
                actualData.getTgrade(),
                actualData.getNumberofstakeholder(),
                actualData.getNumberdayneeded(),
                actualData.getTmode(),
                actualData.getThoursperday(),
                actualData.getTotalhours(),
                actualData.getTstatus()
        );

        if (updatedRows > 0) {
            // Fetch and return the updated ActualData
             Optional<ActualData> findById = actualDataRepo.findById(refplannerid);
            return findById.orElse(null);
        } else {
            // Handle update failure, return null or throw an exception
            return null;
        }
    }

	@Override
	@Transactional
	public void deactivateTraining(String refplannerid) {
		// TODO Auto-generated method stub
		actualDataRepo.deactivateTraining(refplannerid);
	}
	
//	   public void processExcelFile(MultipartFile file) throws IOException {
//	        List<ActualData> entities = ExcelHelper.readExcel(file.getInputStream());
//	        // Save entities to the database
//	        actualDataRepo.saveAll(entities);
//	    }
	
//	 public void save(MultipartFile file) {
//		    try {
//		      List<ActualData> tutorials = ExcelHelper.excelToTutorials(file.getInputStream());
//		      actualDataRepo.saveAll(tutorials);
//		    } catch (IOException e) {
//		      throw new RuntimeException("fail to store excel data: " + e.getMessage());
//		    }
//		  }
//
//		  public ByteArrayInputStream load() {
//		    List<ActualData> tutorials = actualDataRepo.findAll();
//
//		    ByteArrayInputStream in = ExcelHelper.tutorialsToExcel(tutorials);
//		    return in;
//		  }
//
//		  public List<ActualData> getAllTutorials() {
//		    return actualDataRepo.findAll();
//		  }
		}
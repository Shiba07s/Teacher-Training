package com.TTSS03.Service;

import java.io.IOException;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.TTSS03.Entity.ActualData;
import com.TTSS03.Entity.StagingCalenderData;
import com.TTSS03.Repository.ActualDataRepository;
import com.TTSS03.Repository.SessionMasterRepository;
import com.TTSS03.Repository.StagingCalenderRepository;
import com.TTSS03.utill.ExcelHelper;


@Service
public class StagingCalenderServiceImpl implements StagingCalenderService {
	
	@Autowired
	private StagingCalenderRepository stagingCalenderRepository;
	
	@Autowired
	private ActualDataRepository actualDataRepository;
	
	
	  public void processExcelFile(MultipartFile file) throws IOException {
	        List<StagingCalenderData> entities = ExcelHelper.readExcel(file.getInputStream());
	        // Save entities to the database
	        stagingCalenderRepository.saveAll(entities);
	    }
	  
		

	  
	  public void uploadAndStoreFile(MultipartFile file) throws IOException {
	        String originalFilename = file.getOriginalFilename();
	//originalFilename.endsWith(".xls") 
	        if (originalFilename != null) {
	            if (originalFilename.endsWith(".xlsx")) {
	                uploadAndStoreExcel(file.getInputStream());
	            } else {
	                throw new IllegalArgumentException("Unsupported file format. Supported formats are .xls, .xlsx, and .csv.");
	            }
	        } else {
	            throw new IllegalArgumentException("Invalid file.");
	        }
	    }
	//1- upload the file in .xlsx format
	    private void uploadAndStoreExcel(InputStream fileInputStream) throws IOException {
	        List<StagingCalenderData> planners = parseExcel(fileInputStream);
	        stagingCalenderRepository.saveAll(planners);
	        
	        List<ActualData> otherTableData = convertToActualTableData(planners);
	        actualDataRepository.saveAll(otherTableData);
	    }
	    private List<ActualData> convertToActualTableData(List<StagingCalenderData> planners) {
	        List<ActualData> otherTableData = new ArrayList<>();
	        for (StagingCalenderData planner : planners) {
	        	  ActualData otherTableEntry = new ActualData();
	              otherTableEntry.setRefplannerid(String.valueOf(planner.getRefplannerid()));
	              otherTableEntry.setTmonth(planner.getTmonth());
	              otherTableEntry.setTyear(String.valueOf(planner.getTyear()));  
	              otherTableEntry.setTrainingregstartdt(planner.getTrainingregstartdt());
	              otherTableEntry.setTrainingregenddt(planner.getTrainingregenddt());
	              otherTableEntry.setTagency(planner.getTagency());
	              otherTableEntry.setTname(planner.getTname());
	              otherTableEntry.setTsubject(planner.getTsubject());
	              otherTableEntry.setTcategory(planner.getTcategory());
	              otherTableEntry.setTspell(planner.getTspell());
	              otherTableEntry.setTdescription(planner.getTdescription());
	              otherTableEntry.setPreferdlocation(planner.getPreferdlocation());
	              otherTableEntry.setTgrade(planner.getTgrade());
	              otherTableEntry.setTtargetgroup(planner.getTtargetgroup());
	              otherTableEntry.setNumberofstakeholder(String.valueOf(planner.getNumberofstakeholder()));
	              otherTableEntry.setNumberdayneeded(String.valueOf(planner.getNumberdayneeded()));
	              otherTableEntry.setTmode(planner.getTmode());
	              otherTableEntry.setThoursperday(String.valueOf(planner.getThoursperday()));
	              otherTableEntry.setTotalhours(String.valueOf(planner.getTotalhours()));
	              otherTableEntry.setTstatus(planner.getTstatus());

	              otherTableData.add(otherTableEntry);	        }
	        return otherTableData;
	    }

	    private List<StagingCalenderData> parseExcel(InputStream fileInputStream) throws IOException {
	        List<StagingCalenderData> planners = new ArrayList<>();
	        try (InputStream is = fileInputStream) {
	            Workbook workbook = new XSSFWorkbook(is);

	            Sheet sheet = workbook.getSheetAt(0);  

	            for (Row row : sheet) {
	                if (row.getRowNum() == 0) {
	                    continue;
	                }

	                StagingCalenderData planner = new StagingCalenderData();
	                Cell cell0 = row.getCell(0);
	                if (cell0.getCellType() == CellType.NUMERIC) {
	                    planner.setRefplannerid((int) cell0.getNumericCellValue());
	                } else {
	                    planner.setRefplannerid(0);
	                }
	 

	                Cell cell1 = row.getCell(1);
	                if (cell1.getCellType() == CellType.STRING) {
	                    planner.setTmonth(cell1.getStringCellValue());
	                } else {
	                    planner.setTmonth("N/A");
	                }

	                Cell cell2 = row.getCell(2);
	                if (cell2.getCellType() == CellType.NUMERIC) {
	                	planner.setTyear((int) cell2.getNumericCellValue()); 
	                } else {
	                    planner.setTyear(0);
	                }

	                Cell cell3 = row.getCell(3);
	                if (cell3.getCellType() == CellType.STRING) {
	                    planner.setTrainingregstartdt(cell3.getStringCellValue());
	                } else {
	                    planner.setTrainingregstartdt( "N/A");
	                }
	                Cell cell4 = row.getCell(4);
	                if (cell4.getCellType() == CellType.STRING) {
	                	planner.setTrainingregenddt(cell4.getStringCellValue());
	                } else {
	                	planner.setTrainingregenddt("N/A");
	                }
	                Cell cell5 = row.getCell(5);
	                if (cell5.getCellType() == CellType.STRING) {
	                	planner.setTagency(cell5.getStringCellValue());
	                } else {
	                	planner.setTagency( "N/A");
	                }
	                Cell cell6 = row.getCell(6);
	                if (cell6.getCellType() == CellType.STRING) {
	                	planner.setTname(cell6.getStringCellValue());
	                } else {
	                	planner.setTname( "N/A");
	                }
	                Cell cell7 = row.getCell(7);
	                if (cell7.getCellType() == CellType.STRING) {
	                	planner.setTsubject(cell7.getStringCellValue());
	                } else {
	                	planner.setTsubject( "N/A");
	                }
	                Cell cell8= row.getCell(8);
	                if (cell8.getCellType() == CellType.STRING) {
	                	planner.setTcategory(cell8.getStringCellValue());
	                } else {
	                	planner.setTcategory( "N/A");
	                }
	                Cell cell9= row.getCell(9);
	                if (cell9.getCellType() == CellType.STRING) {
	                	planner.setTspell(cell9.getStringCellValue());
	                } else {
	                	planner.setTspell( "N/A");
	                }
	                Cell cell10= row.getCell(10);
	                if (cell10.getCellType() == CellType.STRING) {
	                	planner.setTdescription(cell10.getStringCellValue());
	                } else {
	                	planner.setTdescription( "N/A");
	                }
	                Cell cell11= row.getCell(11);
	                if (cell11.getCellType() == CellType.STRING) {
	                	planner.setPreferdlocation(cell11.getStringCellValue());
	                } else {
	                	planner.setPreferdlocation( "N/A");
	                }


	                Cell cell12= row.getCell(12);
	                if (cell12.getCellType() == CellType.STRING) {
	                	planner.setTgrade(cell12.getStringCellValue());
	                } else {
	                	planner.setTgrade("N/A");
	                }
	                Cell cell13= row.getCell(13);
	                if (cell13.getCellType() == CellType.STRING) {
	                	planner.setTtargetgroup(cell13.getStringCellValue());
	                } else {
	                	planner.setTtargetgroup("N/A");
	                }
	                Cell cell14= row.getCell(14);
	                if (cell14.getCellType() == CellType.NUMERIC) {
	                	planner.setNumberofstakeholder((int) cell14.getNumericCellValue());
	                } else {
	                	planner.setNumberofstakeholder(0);
	                }
	                
	                Cell cell15= row.getCell(15);
	                if (cell15.getCellType() == CellType.NUMERIC) {
	                	planner.setNumberdayneeded((int) cell15.getNumericCellValue());
	                } else {
	                	planner.setNumberdayneeded(0);
	                }
	             
	                Cell cell16= row.getCell(16);
	                if (cell16.getCellType() == CellType.NUMERIC) {
	                	planner.setThoursperday((int) cell16.getNumericCellValue());
	                } else {
	                	planner.setThoursperday(0);
	                }
	                Cell cell17= row.getCell(17);
	                if (cell17.getCellType() == CellType.NUMERIC) {
	                	planner.setTotalhours((int) cell17.getNumericCellValue());
	                } else {
	                	planner.setTotalhours(0);
	                }
	                Cell cell18= row.getCell(18);
	                if (cell18.getCellType() == CellType.STRING) {
	                	planner.setTmode(cell18.getStringCellValue());
	                } else {
	                	planner.setTmode("N/A");
	                }
	                Cell cell19= row.getCell(19);
	                if (cell19.getCellType() == CellType.STRING) {
	                	planner.setTstatus(cell19.getStringCellValue());
	                } else {
	                	planner.setTstatus("N/A");
	                }
	                
	                planners.add(planner);
	            }

	            workbook.close();
	            return planners;
	        }
	    }
	    
//	  public List<StagingCalenderData> parseExcelFile(InputStream fileInputStream) throws IOException {
//	        List<StagingCalenderData> planners = new ArrayList<>();
//	        try (Workbook workbook = new XSSFWorkbook(fileInputStream)) {
//	            Sheet sheet = workbook.getSheetAt(0);
//
//	            for (Row row : sheet) {
//	                if (row.getRowNum() == 0) {
//	                    continue;
//	                }
//
//	                StagingCalenderData planner = createPlannerFromRow(row);
//	                planners.add(planner);
//	            }
//	        }
//	        return planners;
//	    }
//
//	    private StagingCalenderData createPlannerFromRow(Row row) {
//	    	StagingCalenderData planner = new StagingCalenderData();
//
//	        planner.setRefplannerid(getCellValueAsInt(row.getCell(0), 0));
//	        planner.setTmonth(getCellValueAsString(row.getCell(1), "N/A"));
//	        planner.setTyear(getCellValueAsString(row.getCell(2), "N/A"));
//	        planner.setTrainingregstartdt(getCellValueAsString(row.getCell(3), "N/A"));
//	        planner.setTrainingregenddt(getCellValueAsString(row.getCell(4), "N/A"));
//	        planner.setTagency(getCellValueAsString(row.getCell(5), "N/A"));
//	        planner.setTname(getCellValueAsString(row.getCell(6), "N/A"));
//	        planner.setTsubject(getCellValueAsString(row.getCell(7), "N/A"));
//	        planner.setTcategory(getCellValueAsString(row.getCell(8), "N/A"));
//	        planner.setTspell(getCellValueAsString(row.getCell(9), "N/A"));
//	        planner.setTdescription(getCellValueAsString(row.getCell(10), "N/A"));
//	        planner.setPreferdlocation(getCellValueAsString(row.getCell(11), "N/A"));
//	        planner.setTgrade(getCellValueAsString(row.getCell(12), "N/A"));
//	        planner.setTtargetgroup(getCellValueAsString(row.getCell(13), "N/A"));
//	        planner.setNumberofstakeholder(getCellValueAsString(row.getCell(14), "N/A"));
//	        planner.setNumberdayneeded(getCellValueAsString(row.getCell(15), "N/A"));
//	        planner.setTmode(getCellValueAsString(row.getCell(16), "N/A"));
//	        planner.setThoursperday(getCellValueAsString(row.getCell(17), "N/A"));
//	        planner.setTotalhours(getCellValueAsString(row.getCell(18), "N/A"));
//	        planner.setTstatus(getCellValueAsString(row.getCell(19), "N/A"));
//
//	        return planner;
//	    }
//
//	    private String getCellValueAsString(Cell cell, String defaultValue) {
//	        return (cell != null && cell.getCellType() == CellType.STRING) ? cell.getStringCellValue() : defaultValue;
//	    }
//
//	    private int getCellValueAsInt(Cell cell, int defaultValue) {
//	        return (cell != null && cell.getCellType() == CellType.NUMERIC) ? (int) cell.getNumericCellValue() : defaultValue;
//	    }
//	
}

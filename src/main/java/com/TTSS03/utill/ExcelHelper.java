package com.TTSS03.utill;


import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;


import com.TTSS03.Entity.StagingCalenderData;

public class ExcelHelper {
	
	
	public static List<StagingCalenderData> readExcel(InputStream is) throws IOException {
        Workbook workbook = WorkbookFactory.create(is);
        Sheet sheet = workbook.getSheetAt(0); // Assuming data is in the first sheet

        Iterator<Row> rows = sheet.iterator();
        List<StagingCalenderData > entities = new ArrayList<>();

        while (rows.hasNext()) {
            Row currentRow = rows.next();
            Iterator<Cell> cellsInRow = currentRow.iterator();

            StagingCalenderData entity = new StagingCalenderData();

            // Set entity fields based on Excel columns
            entity.setRefplannerid(getIntegerCellValue(cellsInRow.next()));
            entity.setTmonth(getCellValue(cellsInRow.next()));
            entity.setTyear(getIntegerCellValue(cellsInRow.next()));
            entity.setTrainingregstartdt(getCellValue(cellsInRow.next()));
            entity.setTrainingregenddt(getCellValue(cellsInRow.next()));
            entity.setTagency(getCellValue(cellsInRow.next()));
            entity.setTname(getCellValue(cellsInRow.next()));
            entity.setTsubject(getCellValue(cellsInRow.next()));
            entity.setTcategory(getCellValue(cellsInRow.next()));
            entity.setTspell(getCellValue(cellsInRow.next()));
            entity.setTdescription(getCellValue(cellsInRow.next()));
            entity.setPreferdlocation(getCellValue(cellsInRow.next()));
            entity.setTgrade(getCellValue(cellsInRow.next()));
            entity.setTtargetgroup(getCellValue(cellsInRow.next()));
            entity.setNumberofstakeholder(getIntegerCellValue(cellsInRow.next()));
            entity.setNumberdayneeded(getIntegerCellValue(cellsInRow.next()));
            entity.setThoursperday(getIntegerCellValue(cellsInRow.next()));
            entity.setTotalhours(getIntegerCellValue(cellsInRow.next()));
            entity.setTmode(getCellValue(cellsInRow.next()));
            entity.setTstatus(getCellValue(cellsInRow.next()));

            entities.add(entity);
        }

        workbook.close();
        return entities;
    }

    private static int getIntegerCellValue(Cell next) {
		// TODO Auto-generated method stub
		return 0;
	}

	private static String getCellValue(Cell cell) {
        if (cell == null) {
            return null;
        }

        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue().trim();
            case NUMERIC:
                return String.valueOf(cell.getNumericCellValue());
            default:
                return null;
        }
    }
	
	
	
	
	
	
	
	
	
	
	
	
//  public static String TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
//  static String[] HEADERs = { "refplannerid", "tmonth", "tyear", "trainingregstartdt","trainingregenddt", "tagency","tname","tsubject","tcategory","tspell","tdescription","preferdlocation","tgrade","ttargetgroup","numberofstakeholder","numberdayneeded","thoursperday","totalhours","tmode","tstatus"};
//  static String SHEET = "Tutorials";
//
//  public static boolean hasExcelFormat(MultipartFile file) {
//
//    if (!TYPE.equals(file.getContentType())) {
//      return false;
//    }
//
//    return true;
//  }
//
//  public static ByteArrayInputStream tutorialsToExcel(List<ActualData> tutorials) {
//
//    try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream();) {
//      Sheet sheet = workbook.createSheet(SHEET);
//
//      // Header
//      Row headerRow = sheet.createRow(0);
//
//      for (int col = 0; col < HEADERs.length; col++) {
//        Cell cell = headerRow.createCell(col);
//        cell.setCellValue(HEADERs[col]);
//      }
//
//      int rowIdx = 1;
//      for (ActualData tutorial : tutorials) {
//        Row row = sheet.createRow(rowIdx++);
//
//        row.createCell(0).setCellValue(tutorial.getRefplannerid());
//        row.createCell(1).setCellValue(tutorial.getTmonth());
//        row.createCell(2).setCellValue(tutorial.getTyear());
//        row.createCell(3).setCellValue(tutorial.getTrainingregstartdt());
//        row.createCell(4).setCellValue(tutorial.getTrainingregenddt());
//        row.createCell(5).setCellValue(tutorial.getTagency());
//        row.createCell(6).setCellValue(tutorial.getTname());
//        row.createCell(7).setCellValue(tutorial.getTsubject());
//        row.createCell(8).setCellValue(tutorial.getTcategory());
//        row.createCell(9).setCellValue(tutorial.getTspell());
//        row.createCell(10).setCellValue(tutorial.getTdescription());
//        row.createCell(11).setCellValue(tutorial.getPreferdlocation());
//        row.createCell(12).setCellValue(tutorial.getTgrade());
//        row.createCell(13).setCellValue(tutorial.getTtargetgroup());
//        row.createCell(14).setCellValue(tutorial.getNumberofstakeholder());
//        row.createCell(15).setCellValue(tutorial.getNumberdayneeded());
//        row.createCell(16).setCellValue(tutorial.getThoursperday());
//        row.createCell(17).setCellValue(tutorial.getTotalhours());
//        row.createCell(18).setCellValue(tutorial.getTmode());
//        row.createCell(19).setCellValue(tutorial.getTstatus());
//      }
//
//      workbook.write(out);
//      return new ByteArrayInputStream(out.toByteArray());
//    } catch (IOException e) {
//      throw new RuntimeException("fail to import data to Excel file: " + e.getMessage());
//    }
//  }
//
//  public static List<ActualData> excelToTutorials(InputStream is) {
//    try {
//      Workbook workbook = new XSSFWorkbook(is);
//
//      Sheet sheet = workbook.getSheet(SHEET);
//      Iterator<Row> rows = sheet.iterator();
//
//      List<ActualData> tutorials = new ArrayList<ActualData>();
//
//      int rowNumber = 0;
//      while (rows.hasNext()) {
//        Row currentRow = rows.next();
//
//        // skip header
//        if (rowNumber == 0) {
//          rowNumber++;
//          continue;
//        }
//
//        Iterator<Cell> cellsInRow = currentRow.iterator();
//
//        ActualData tutorial = new ActualData();
//
//        int cellIdx = 0;
//        while (cellsInRow.hasNext()) {
//          Cell currentCell = cellsInRow.next();
//
//          switch (cellIdx) {
//          case 0:
//        	  tutorial.setRefplannerid(currentCell.getStringCellValue());
//            break;
//
//          case 1:
//            tutorial.setTmonth(currentCell.getStringCellValue());
//            break;
//
//          case 2:
//            tutorial.setTyear(currentCell.getStringCellValue());
//            break;
//
//          case 3:
//        	  tutorial.setTrainingregstartdt(currentCell.getStringCellValue());
//            break;
//          case 4:
//        	  tutorial.setTrainingregenddt(currentCell.getStringCellValue());     
//        	  break;
//          case 5:
//        	  tutorial.setTagency(currentCell.getStringCellValue());
//        	  break;
//          case 6:
//        	  tutorial.setTname(currentCell.getStringCellValue());
//        	  break;
//          case 7:
//        	  tutorial.setTsubject(currentCell.getStringCellValue());
//        	  break;
//          case 8:
//        	  tutorial.setTcategory(currentCell.getStringCellValue());
//        	  break;
//          case 9:
//        	  tutorial.setTspell(currentCell.getStringCellValue());
//        	  break;
//          case 10:
//        	  tutorial.setTdescription(currentCell.getStringCellValue());
//        	  break;
//          case 11:
//        	  tutorial.setPreferdlocation(currentCell.getStringCellValue());
//        	  break;
//          case 12:
//        	  tutorial.setTgrade(currentCell.getStringCellValue());
//        	  break;
//          case 13:
//        	  tutorial.setTtargetgroup(currentCell.getStringCellValue());
//        	  break;
//          case 14:
//        	  tutorial.setNumberofstakeholder(currentCell.getStringCellValue());
//        	  break;
//          case 15:
//        	  tutorial.setNumberdayneeded(currentCell.getStringCellValue());
//        	  break;
//          case 16:
//        	  tutorial.setThoursperday(currentCell.getStringCellValue());
//        	  break;
//          case 17:
//        	  tutorial.setTotalhours(currentCell.getStringCellValue());
//        	  break;
//          case 18:
//        	  tutorial.setTmode(currentCell.getStringCellValue());
//        	  break;
//          case 19:
//        	  tutorial.setTstatus(currentCell.getStringCellValue());
//        	  break;
//       
//          default:
//            break;
//          }
//
//          cellIdx++;
//        }
//
//        tutorials.add(tutorial);
//      }
//
//      workbook.close();
//
//      return tutorials;
//    } catch (IOException e) {
//      throw new RuntimeException("fail to parse Excel file: " + e.getMessage());
//    }
//  }
}
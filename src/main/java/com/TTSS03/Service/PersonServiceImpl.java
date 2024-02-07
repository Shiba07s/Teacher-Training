package com.TTSS03.Service;


import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.TTSS03.Entity.Person;
import com.TTSS03.Repository.PersonRepository; 

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

@Service
public class PersonServiceImpl implements PersonService {
	
	@Autowired
	PersonRepository PersonRepo;

	@Override
	public void saveDataFromExcel(MultipartFile file) {
		// TODO Auto-generated method stub
		 try (InputStream inputStream = file.getInputStream()) {
	            Workbook workbook = new XSSFWorkbook(inputStream);

	            Sheet sheet = workbook.getSheetAt(0); // Assuming data is in the first sheet

	            Iterator<Row> iterator = sheet.iterator();

	            // Skip the header row
	            if (iterator.hasNext()) {
	                iterator.next();
	            }

	            while (iterator.hasNext()) {
	                Row currentRow = iterator.next();
	                Iterator<Cell> cellIterator = currentRow.iterator();

	                Cell refplanneridCell = cellIterator.next();
	                Cell tmonthCell = cellIterator.next();
	                Cell tyearCell = cellIterator.next();
	                Cell trainingregstartdtCell = cellIterator.next();
	                Cell trainingregenddtCell = cellIterator.next();
	                Cell tagencyCell = cellIterator.next();
	                Cell tnameCell = cellIterator.next();
	                Cell tsubjectCell = cellIterator.next();
	                Cell tcategoryCell = cellIterator.next();
	                Cell tspellCell = cellIterator.next();
	                Cell tdescriptionCell = cellIterator.next();
	                Cell preferdlocationCell = cellIterator.next();
	                Cell tgradeCell = cellIterator.next();
	                Cell ttargetgroupCell = cellIterator.next();
	                Cell numberofstakeholderCell = cellIterator.next();
	                Cell numberdayneededCell = cellIterator.next();
	                Cell tmodeCell = cellIterator.next();
	                Cell thoursperdayCell = cellIterator.next();
	                Cell totalhoursCell = cellIterator.next();
	                Cell tstatusCell = cellIterator.next();

	                String refplannerid = getCellValueAsString(refplanneridCell);
	                String tmonth = getCellValueAsString(tmonthCell);
	                String tyear = getCellValueAsString(tyearCell);
	                String trainingregstartdt = getCellValueAsString(trainingregstartdtCell);
	                String trainingregenddt = getCellValueAsString(trainingregenddtCell);
	                String tagency = getCellValueAsString(tagencyCell);
	                String tname = getCellValueAsString(tnameCell);
	                String tsubject = getCellValueAsString(tsubjectCell);
	                String tcategory = getCellValueAsString(tcategoryCell);
	                String tspell = getCellValueAsString(tspellCell);
	                String tdescription = getCellValueAsString(tdescriptionCell);
	                String preferdlocation = getCellValueAsString(preferdlocationCell);
	                String tgrade = getCellValueAsString(tgradeCell);
	                String ttargetgroup = getCellValueAsString(ttargetgroupCell);
	                String numberofstakeholder = getCellValueAsString(numberofstakeholderCell);
	                String numberdayneeded = getCellValueAsString(numberdayneededCell);
	                String tmode = getCellValueAsString(tmodeCell);
	                String thoursperday = getCellValueAsString(thoursperdayCell);
	                String totalhours = getCellValueAsString(totalhoursCell);
	                String tstatus = getCellValueAsString(tstatusCell);
	               

	                Person person = new Person();
	                person.setRefplannerid(refplannerid);
	                person.setTmonth(tmonth);
	                person.setTyear(tyear);
	                person.setTrainingregstartdt(trainingregstartdt);
	                person.setTrainingregenddt(trainingregenddt);
	                person.setTagency(tagency);
	                person.setTname(tname);
	                person.setTsubject(tsubject);
	                person.setTcategory(tcategory);
	                person.setTspell(tspell);
	                person.setTdescription(tdescription);
	                person.setPreferdlocation(preferdlocation);
	                person.setTgrade(tgrade);
	                person.setTtargetgroup(ttargetgroup);
	                person.setNumberofstakeholder(numberofstakeholder);
	                person.setNumberdayneeded(numberdayneeded);
	                person.setTmode(tmode);
	                person.setThoursperday(thoursperday);
	                person.setTotalhours(totalhours);
	                person.setTstatus(tstatus);
	                

	                // Save the person to the database
	                PersonRepo.save(person);
	            }

	            workbook.close();
	        } catch (IOException e) {
	            e.printStackTrace(); // Handle the exception based on your application's needs
	        }
	    }
	private String getCellValueAsString(Cell cell) {
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                // Handle numeric values, you can format or parse them as needed
                return String.valueOf(cell.getNumericCellValue());
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                // Handle formula cells if needed
                return cell.getCellFormula();
            default:
                return "";
        }
    }
}
	


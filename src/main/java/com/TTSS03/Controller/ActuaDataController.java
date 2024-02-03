package com.TTSS03.Controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import com.TTSS03.Entity.ActualData;
import com.TTSS03.Service.ActualDataService;
import com.TTSS03.utill.ExcelHelper;
import com.TTSS03.utill.ResponseMessage;
import org.springframework.http.MediaType;

@RestController
@RequestMapping("/api")
public class ActuaDataController {
	
	@Autowired
	ActualDataService actualDataService;
	
	
	@GetMapping("/getdata")
	public ResponseEntity<List<ActualData>> getallplanedtrainings(){
		List<ActualData> all = actualDataService.getAll();
		return ResponseEntity.ok(all);
		
	}
	
	@GetMapping("/getdatabyid/{refplannerid}")
	public ActualData getTrainingById(@PathVariable(value="refplannerid") int refplannerid){
		return actualDataService.getDataById(refplannerid);
	}
	
	@PostMapping("/savedata")
	public ResponseEntity<ActualData>createNewRecord(@RequestBody ActualData actualData){
		ActualData saveOneData = actualDataService.saveOneData(actualData);
		
		return ResponseEntity.ok(saveOneData);
	}
	
	@PutMapping("/edit/{refplannerid}")
	public ResponseEntity<ActualData>updateOneRecord(@PathVariable int refplannerid,@RequestBody ActualData actualData){
		
		ActualData updateOne = actualDataService.updateOne(refplannerid, actualData);
		
		return ResponseEntity.ok(updateOne);
	}
	
	 @PostMapping("/deactivate/{refplannerid}")
	    public void deactivateTraining(@PathVariable String refplannerid) {
		 actualDataService.deactivateTraining(refplannerid);
	    }
	 
	 
//	 @PostMapping("/upload")
//	    public ResponseEntity<String> uploadExcelFile(@RequestParam("file") MultipartFile file) {
//	        try {
//	            actualDataService.processExcelFile(file);
//	            return ResponseEntity.ok("File uploaded successfully");
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	            return ResponseEntity.badRequest().body("Failed to process the Excel file");
//	        }
//	    }
//	 
//	 @PostMapping("/upload")
//	  public ResponseEntity<ResponseMessage> uploadFile(@RequestParam("file") MultipartFile file) {
//	    String message = "";
//
//	    if (ExcelHelper.hasExcelFormat(file)) {
//	      try {
//	        actualDataService.save(file);
//
//	        message = "Uploaded the file successfully: " + file.getOriginalFilename();
//	        return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
//	      } catch (Exception e) {
//	        message = "Could not upload the file: " + file.getOriginalFilename() + "!";
//	        return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
//	      }
//	    }
//
//	    message = "Please upload an excel file!";
//	    return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ResponseMessage(message));
//	  }

//	  @GetMapping("/tutorials")
//	  public ResponseEntity<List<ActualData>> getAllTutorials() {
//	    try {
//	      List<ActualData> tutorials = actualDataService.getAllTutorials();
//
//	      if (tutorials.isEmpty()) {
//	        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//	      }
//
//	      return new ResponseEntity<>(tutorials, HttpStatus.OK);
//	    } catch (Exception e) {
//	      return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
//	    }
//	  }
//
//	  @GetMapping("/download")
//	  public ResponseEntity<Resource> getFile() {
//	    String filename = "tutorials.xlsx";
//	    InputStreamResource file = new InputStreamResource(actualDataService.load());
//
//	    return ResponseEntity.ok()
//	        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + filename)
//	        .contentType(MediaType.parseMediaType("application/vnd.ms-excel"))
//	        .body(file);
//	  }

}

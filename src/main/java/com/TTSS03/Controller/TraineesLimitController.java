package com.TTSS03.Controller;
 
import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
 
import com.TTSS03.Entity.TraineesLimit;
import com.TTSS03.Service.TraineesLimitService;
 
@RestController
@RequestMapping("/api")
public class TraineesLimitController {
	@Autowired
	private TraineesLimitService traineesLimitService;
	@GetMapping("/traineeLimit")
	public ResponseEntity<List<TraineesLimit>> getAllTraineeData(){
		List<TraineesLimit> allData = traineesLimitService.getAllData();
		return new ResponseEntity<List<TraineesLimit>>(allData,HttpStatus.OK);
	}
 
}


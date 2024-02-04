  package com.TTSS03.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Repository.MandalMasterRepository;
import com.TTSS03.Service.DistrictMasterService;

@RestController
@RequestMapping("/api")
public class DistrictMasterController {
	
	@Autowired
	private DistrictMasterService districtMasterService;
 
	@GetMapping("/search/district")
	public ResponseEntity<List<String>> getAllDistrictName(){
		List<String> districtName = districtMasterService.getDistrictNameList();
		return new ResponseEntity<List<String>>(districtName,HttpStatus.OK);
	}
	
	 @GetMapping("/mandal")
	    public List<String> getMandalNamesByDistrict(@RequestParam String district) {
	        return districtMasterService.getMandalNamesByDistrict(district);
	    }
	 @GetMapping("/search/nomination")
		public ResponseEntity<List<Map<String, Object>>> getDistrictMandalteacherList(@RequestParam String district, @RequestParam String mandal) {
			List<Map<String, Object>> mandalDistrictTeacher = districtMasterService.getDistrictMandalTeacher(district,mandal);
			return ResponseEntity.ok(mandalDistrictTeacher);
		}
}

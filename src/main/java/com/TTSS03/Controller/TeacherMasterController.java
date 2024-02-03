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

import com.TTSS03.Entity.TeacherMaster;
import com.TTSS03.Entity.TreasuryGovt;
import com.TTSS03.Service.TeacherMasterService;

@RestController
@RequestMapping("/api")
public class TeacherMasterController {
	
	@Autowired
	private TeacherMasterService teacherMasterService;
	
	//get district 
	@GetMapping("/search/districts")
	public ResponseEntity<List<String>> getAllDistrictNameList(){
		List<String> districtName = teacherMasterService.getDistrictNameList();
		return new ResponseEntity<List<String>>(districtName,HttpStatus.OK);
	}
	// get mandal on respective district
	@GetMapping("/mandalsa")
    public List<String> getMandalNamesByDistrict(@RequestParam String district) {
        return teacherMasterService.getMandalNamesByDistrict(district);
    }
	
	@GetMapping("/search/nominations")
	public ResponseEntity<List<Map<String, Object>>> getDistrictMandalteacherList(@RequestParam String district, @RequestParam String mandal) {
		List<Map<String, Object>> mandalDistrictTeacher = teacherMasterService.getDistrictMandalTeacher(district,mandal);
		return ResponseEntity.ok(mandalDistrictTeacher);
	}
	
	@GetMapping("/findteacher")
	public ResponseEntity<List<TeacherMaster>>findteacherByTreasuryId(@RequestParam String treasuryid){
		List<TeacherMaster> byTreasuryId = teacherMasterService.getByTreasuryId(treasuryid);
		return ResponseEntity.ok(byTreasuryId);
	}
	
	@GetMapping("/district")
	public ResponseEntity<List<String>> getAllDistrictName(){
		List<String> districtName = teacherMasterService.getDistrictName();
		return new ResponseEntity<List<String>>(districtName,HttpStatus.OK);
	}
	
	 @GetMapping("/mandals")
	    public List<Object[]> getDistinctMandalNames(@RequestParam String district) {
	        return teacherMasterService.getDistinctMandalNamesByDistrict(district);
	    }

}

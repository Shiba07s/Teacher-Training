package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.TreasuryGovt;
import com.TTSS03.Service.TreasuryGovtService;
@RestController
@RequestMapping("/api")
public class TreasuryGovtEmpController {
	
	@Autowired
	TreasuryGovtService treasuryGovtService;
	
	@GetMapping("/findteachers")
	public ResponseEntity<List<TreasuryGovt>>findteacherByTreasuryId(@RequestParam String treasuryid){
		List<TreasuryGovt> byTreasuryId = treasuryGovtService.getByTreasuryId(treasuryid);
		
		return ResponseEntity.ok(byTreasuryId);
	}
	
	@GetMapping("/districtss")
	public ResponseEntity<List<String>> getAllDistrictName(){
		List<String> districtName = treasuryGovtService.getDistrictName();
		return new ResponseEntity<List<String>>(districtName,HttpStatus.OK);
	}
	
	 @GetMapping("/mandalss")
	    public List<Object[]> getDistinctMandalNames(@RequestParam String district) {
	        return treasuryGovtService.getDistinctMandalNamesByDistrict(district);
	    }
	    
	    @GetMapping("/details")
	    public ResponseEntity<List<TreasuryGovt>> getTeachers(
	            @RequestParam("district") String district,
	            @RequestParam("mandal") String mandal,
	            @RequestParam("refPlannerId") String refPlannerId) {

	        List<TreasuryGovt> teachers = treasuryGovtService.getTeacherDetails(district, mandal, refPlannerId);
	        return new ResponseEntity<>(teachers, HttpStatus.OK);
	    }
	    
	    @GetMapping("/district/mandal/teachers")
	    public ResponseEntity<List<TreasuryGovt>> getTeachersByDistrictAndMandal(
	            @RequestParam("districtnamewrk") String districtnamewrk,
	            @RequestParam("mandalnamewrk") String mandalnamewrk){
	    	
	    	List<TreasuryGovt> teacherDetailsbyDistrictAndMandal = treasuryGovtService.getTeacherDetailsbyDistrictAndMandal(mandalnamewrk, districtnamewrk);
	    	return ResponseEntity.ok(teacherDetailsbyDistrictAndMandal);
	    }

}

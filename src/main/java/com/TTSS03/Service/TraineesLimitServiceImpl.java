package com.TTSS03.Service;
 
import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.TTSS03.Entity.TraineesLimit;
import com.TTSS03.Repository.TraineesLimitRepository;
 
@Service
public class TraineesLimitServiceImpl implements TraineesLimitService {
	@Autowired
	private TraineesLimitRepository traineesLimitRepository;
 
	 public List<TraineesLimit> getAllData() {
	        return traineesLimitRepository.findAll();
	    }
 


 
}
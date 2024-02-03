package com.TTSS03.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.SearchSchedule;
import com.TTSS03.Repository.SearchScheduleRepository;

@Service
public class SearchScheduleServiceImpl implements SearchScheduleService {
	
	
	@Autowired
	SearchScheduleRepository SearchScheduleRepo;

	@Override
	 public List<SearchSchedule> findByReferencrId(String ref_planner_id) {
		List<SearchSchedule> findByRefId = SearchScheduleRepo.findByRefId(ref_planner_id);
		return findByRefId;
	}

	@Override
	public SearchSchedule saveone(SearchSchedule searchSchedule) {
		// TODO Auto-generated method stub
		return SearchScheduleRepo.save(searchSchedule);
	}

}

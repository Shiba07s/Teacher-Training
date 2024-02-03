package com.TTSS03.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.SearchVenue;
import com.TTSS03.Repository.SearchVenueRepository;

@Service
public class SearchVenueServiceimpl implements SearchVenueService {
	
	@Autowired
	private SearchVenueRepository SearchVenueRepo;

	@Override
	public List<SearchVenue> findByVenueid(long vid) {
		List<SearchVenue> venue = SearchVenueRepo.findByVId(vid);
		return venue;	
		}

	@Override
	public List<SearchVenue> findAllVenue(SearchVenue searchVenue) {
		List<SearchVenue> allVenue = SearchVenueRepo.findActiveVenue();
		return allVenue;
	}

	

	@Override
	@Transactional
	public void updatevenue(long vid, SearchVenue Searchvenue) {
		// TODO Auto-generated method stub
		SearchVenueRepo.updateVenue(vid, Searchvenue.getVname(), Searchvenue.getVstate(), Searchvenue.getVmandal(), Searchvenue.getVdistrict(), Searchvenue.getVlocation(), Searchvenue.getVcapacity(), Searchvenue.getVaddress(), Searchvenue.getLandmark(), Searchvenue.getVtype(), Searchvenue.getVcontactname(), Searchvenue.getVcontactno(), Searchvenue.getVcontactmailid(), Searchvenue.getMaplocation());
		
	}

	@Override
	@Transactional

	public void deActivatevenue(long vid) {
		// TODO Auto-generated method stub
		SearchVenueRepo.deactivatevenue(vid);
		
	}

	@Override
	public SearchVenue saveOnevenue(SearchVenue Searchvenue) {
		// TODO Auto-generated method stub
		return SearchVenueRepo.save(Searchvenue);
	}

	@Override
	public SearchVenue getVenueById(long vid) {
		// TODO Auto-generated method stub
		return SearchVenueRepo.findById(vid).orElse(null);
	}
	 
	
	 



}

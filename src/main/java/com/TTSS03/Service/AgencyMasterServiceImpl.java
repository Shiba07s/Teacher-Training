package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.AgencyMaster;
import com.TTSS03.Repository.AgencyMasterRepository;

@Service
public class AgencyMasterServiceImpl implements AgencyMasterService{
	
	@Autowired
	AgencyMasterRepository AgencyMasterRepo;

	@Override
	public List<AgencyMaster> getAllAgency() {
		// TODO Auto-generated method stub
		return AgencyMasterRepo.findAll();
	}
	
	@Override
	public List<AgencyMaster> getAllAgencyy() {
		// TODO Auto-generated method stub
		return AgencyMasterRepo.findByStatus();
	}

	@Override
	public AgencyMaster saveAgency(AgencyMaster agencyMaster) {
		// TODO Auto-generated method stub
		return AgencyMasterRepo.save(agencyMaster);

	}

	@Override
	public AgencyMaster findAgency(int slno) {
		// TODO Auto-generated method stub
		return AgencyMasterRepo.findById(slno).orElse(null);
	}

	@Transactional
	@Override
	public AgencyMaster updateAgency(int slno, String agency) {
		int result = AgencyMasterRepo.updateAgency(slno, agency);
		if (result > 0) {
			// Assuming you need to fetch the updated entity from the repository
			return AgencyMasterRepo.findById(slno)
					.orElseThrow(() -> new EntityNotFoundException("ComponentMaster with sl " + slno + " not found"));
		}
		// Handle the case when the update operation fails
		throw new RuntimeException("Failed to update ComponentMaster with sl " + slno);
	}

	@Transactional
	@Override
	public void deActivateTrainingCategory(int slno) {
		// TODO Auto-generated method stub
		Optional<AgencyMaster> agencyMasterOptional = AgencyMasterRepo.findById(slno);

		if (agencyMasterOptional.isPresent()) {
			AgencyMasterRepo.deactivateAgency(slno);
		} else {
			throw new EntityNotFoundException("Agency Master with sl " + slno + " not found");
		}

	}

}

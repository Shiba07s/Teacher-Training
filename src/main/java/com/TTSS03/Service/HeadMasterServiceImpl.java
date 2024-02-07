package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.HeadMaster;
import com.TTSS03.Repository.HeadMasterRepository;

@Service
public class HeadMasterServiceImpl implements HeadMasterService {

	@Autowired
	private HeadMasterRepository headMasterRepository;

	@Override
	public HeadMaster saveOne(HeadMaster headMaster) {
		try {
			if (headMaster.getTccode() == null || headMaster.getTccode().isEmpty()) {
				// Generate a random code for 'is' field
				String lastGeneratedCode = getLastGeneratedCode();
				System.out.println(lastGeneratedCode);
				String nextCode = String.valueOf(Integer.parseInt(lastGeneratedCode) + 1);
				headMaster.setTccode(nextCode);
			}
			return headMasterRepository.save(headMaster);
		} catch (Exception e) {
			throw new RuntimeException("Failed to save HeadMaster: " + e.getMessage());
		}
	}
	
	public String getLastGeneratedCode() {
		Optional<HeadMaster> lastEntityOptional = headMasterRepository.findEntityByHighestTcCode();
		System.out.println(lastEntityOptional);
		if (lastEntityOptional.isPresent()) {
			return lastEntityOptional.get().getTccode();
		} else {
			return "0000"; // Default value if no entity is found
		}
	}

	@Override
	@Transactional
	public HeadMaster update(int sl, HeadMaster headMaster) {
		Optional<HeadMaster> existingHeadMasterOptional = headMasterRepository.findById(sl);
		if (existingHeadMasterOptional.isPresent()) {
			int result = headMasterRepository.update(sl, headMaster);
			try {
				if (result > 0) {
					System.out.println(22+""+headMasterRepository.findById(sl));
					// Assuming you need to fetch the updated entity from the repository
					return getById(sl).orElseThrow(
							() -> new EntityNotFoundException("Head Master with sl " + sl + " not found"));
				} else
					throw new EntityNotFoundException("Head Master with sl " + sl + " not found");
			} catch (Exception e) {
				throw new RuntimeException("Failed to update Head Master: " + e.getMessage());
			}
		} else {
			throw new EntityNotFoundException("Head Master with sl " + sl + " not found");
		}
	}

	@Override
	public Optional<HeadMaster> getById(int sl) {
		return headMasterRepository.findById(sl);
	}

	@Override
	@Transactional
	public void delete(int sl) {
		Optional<HeadMaster> headMasterOptional = headMasterRepository.findById(sl);
		if (headMasterOptional.isPresent()) {
			HeadMaster headMaster = headMasterOptional.get();
			headMaster.setRecordstatus("Inactive");
			try {
				headMasterRepository.save(headMaster);
			} catch (Exception e) {
				throw new RuntimeException("Failed to set record status to 'Inactive' for HeadMaster with sl " + sl
						+ ": " + e.getMessage());
			}
		} else {
			throw new EntityNotFoundException("HeadMaster with sl " + sl + " not found");
		}
	}

	@Override
	public List<HeadMaster> getAll() {
		return headMasterRepository.findAllByStatus();
	}
}

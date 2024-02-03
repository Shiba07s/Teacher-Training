package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.TTSS03.Entity.VenderMaster;
import com.TTSS03.Repository.VenderMasterRepository;

@Service
public class VenderMasterServiceImpl implements VenderMasterService {

	@Autowired
	private VenderMasterRepository vmRepo;

	@Override
	public VenderMaster saveOne(VenderMaster venderMaster) {
		try {
			return vmRepo.save(venderMaster);
		} catch (Exception e) {
			// Handle exception
			throw new RuntimeException("Failed to save VenderMaster: " + e.getMessage());
		}
	}

	@Override
	@Transactional
	public VenderMaster update(int sl, VenderMaster venderMaster) {
		Optional<VenderMaster> existingVenderMasterOptional = vmRepo.findById(sl);
		if (existingVenderMasterOptional.isPresent()) {
			int result = vmRepo.updateVender(sl, venderMaster);
			try {
				if (result > 0) {
					// Assuming you need to fetch the updated entity from the repository
					return vmRepo.findById(sl)
							.orElseThrow(() -> new EntityNotFoundException("Vendor Master with sl " + sl + " not found"));
				} else
					throw new EntityNotFoundException("Vendor Master with sl " + sl + " not found");
			} catch (Exception e) {
				throw new RuntimeException("Failed to update Vendor Master: " + e.getMessage());
			}
		} else {
			throw new EntityNotFoundException("Vendor Master with sl " + sl + " not found");
		}
	}

	@Override
	public Optional<VenderMaster> getById(int sl) {
		return vmRepo.findById(sl);
	}

	@Override
	@Transactional
	public void delete(int sl) {
		Optional<VenderMaster> vendorOptional = vmRepo.findById(sl);
		if (vendorOptional.isPresent()) {
			vmRepo.deactivate(sl);
		} else {
			throw new RuntimeException("VenderMaster with sl " + sl + " not found");
		}
	}

	@Override
	@Transactional
	public List<VenderMaster> getAll() {
		return vmRepo.findAllActiveVendors();
	}

}

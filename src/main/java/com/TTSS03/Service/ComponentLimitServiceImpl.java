package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.ComponentLimit;
import com.TTSS03.Repository.ComponentLimitRepository;

@Service
public class ComponentLimitServiceImpl implements ComponentLimitService {
	
	@Autowired
	ComponentLimitRepository ComponentLimitRepo;

	@Override
	public List<Object[]> getResourcesAndRatesByNames(List<String> resourceNames) {
		// TODO Auto-generated method stub
		return ComponentLimitRepo.findResourcesAndRatesByNames(resourceNames);
	}

	@Override
	public ComponentLimit saveOne(ComponentLimit componentLimit) {
		// TODO Auto-generated method stub
		return ComponentLimitRepo.save(componentLimit);
	}

	@Override
	public Optional<ComponentLimit> getById(long sl) {
		Optional<ComponentLimit> componentLimitOptional = ComponentLimitRepo.findById(sl);

		if (componentLimitOptional.isPresent()) {
			return componentLimitOptional;
		} else {
			throw new EntityNotFoundException("Component Limit with sl " + sl + " not found");
		}
	}

	@Override
	public List<ComponentLimit> getAllByStatus() {
		// TODO Auto-generated method stub
		System.out.println("hiiii");
		return ComponentLimitRepo.findAllActiveComponents();
	}

	@Override
	@Transactional
	public ComponentLimit update(long sl, ComponentLimit componentLimit) {
		// TODO Auto-generated method stub
		Optional<ComponentLimit> componentLimitOptional = ComponentLimitRepo.findById(sl);
		if (componentLimitOptional.isPresent()) {
			int result = ComponentLimitRepo.updateComponentLimit(sl, componentLimit);
			try {
				if (result > 0) {
					// Assuming you need to fetch the updated entity from the repository
					return ComponentLimitRepo.findById(sl).orElseThrow(
							() -> new EntityNotFoundException("ComponentLimit with sl " + sl + " not found"));
				} else
					throw new EntityNotFoundException("ComponentLimit with sl " + sl + " not found");
			} catch (Exception e) {
				throw new RuntimeException("Failed to update ComponentLimit: " + e.getMessage());
			}
		} else {
			throw new EntityNotFoundException("ComponentLimit with sl " + sl + " not found");
		}
	}

	@Override
	@Transactional
	@Modifying
	public void delete(long sl) {
		Optional<ComponentLimit> componentLimitOptional = ComponentLimitRepo.findById(sl);

		if (componentLimitOptional.isPresent()) {
			ComponentLimit componentLimit = componentLimitOptional.get();
			componentLimit.setRecord_status("Inactive");
			ComponentLimitRepo.save(componentLimit);
		} else {
			throw new EntityNotFoundException("ComponentLimit with sl " + sl + " not found");
		}
		
	}

	@Override
	public List<ComponentLimit> getAll() {
		// TODO Auto-generated method stub
		
		return ComponentLimitRepo.findAll();
	}

}

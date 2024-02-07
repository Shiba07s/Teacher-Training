package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.ComponentMaster;
import com.TTSS03.Repository.ComponentMasterRepository;
@Service
public class ComponentMasterServiceImpl implements ComponentMasterService {
	
	@Autowired
	ComponentMasterRepository ComponentMasterRepo;
	

	@Override
	public List<ComponentMaster> findAll() {
		// TODO Auto-generated method stub
		return ComponentMasterRepo.findAll();
	}


//	@Override
//	public List<ComponentMaster> findAll() {
//		// TODO Auto-generated method stub
//		return ComponentMasterRepo.findAll();
//	}

	@Override
	public ComponentMaster saveone(ComponentMaster componentMaster) {
		// TODO Auto-generated method stub
		try {
			if (componentMaster.getResourceCode() == null || componentMaster.getResourceCode().isEmpty()) {
				// Generate a random code for 'is' field
				String lastGeneratedCode = getLastGeneratedCode();
				System.out.println(lastGeneratedCode);
				String nextCode = String.valueOf(Integer.parseInt(lastGeneratedCode) + 1);
				componentMaster.setResourceCode(nextCode);
			}
			return ComponentMasterRepo.save(componentMaster);
		} catch (Exception e) {
			throw new RuntimeException("Failed to save Component Master: " + e.getMessage());
		}
	}
	
	public String getLastGeneratedCode() {
		Optional<ComponentMaster> lastEntityOptional = ComponentMasterRepo.findEntityByHighestResourceCode();
		if (lastEntityOptional.isPresent()) {
			return lastEntityOptional.get().getResourceCode();
		} else {
			return "0000"; // Default value if no entity is found
		}
	}

	@Transactional
	@Override
	public ComponentMaster update(long sl, ComponentMaster componentMaster) {
		Optional<ComponentMaster> componentMasterOptional = ComponentMasterRepo.findById(sl);
		if (componentMasterOptional.isPresent()) {
			int result = ComponentMasterRepo.updateComponent(sl, componentMaster);
			try {
				if (result > 0) {
					// Assuming you need to fetch the updated entity from the repository
					return ComponentMasterRepo.findById(sl).orElseThrow(
							() -> new EntityNotFoundException("ComponentMaster with sl " + sl + " not found"));
				} else
					throw new EntityNotFoundException("ComponentMaster with sl " + sl + " not found");
			} catch (Exception e) {
				throw new RuntimeException("Failed to update ComponentMaster: " + e.getMessage());
			}
		} else {
			throw new EntityNotFoundException("ComponentMaster with sl " + sl + " not found");
		}
	}

	@Override
	public Optional<ComponentMaster> getbyid(long sl) {
		Optional<ComponentMaster> componentMasterOptional = ComponentMasterRepo.findById(sl);

		if (componentMasterOptional.isPresent()) {
			return componentMasterOptional;
		} else {
			throw new EntityNotFoundException("ComponentMaster with sl " + sl + " not found");
		}
	}

	@Override
	public void delete(long sl) {
		Optional<ComponentMaster> componentMasterOptional = ComponentMasterRepo.findById(sl);

		if (componentMasterOptional.isPresent()) {
			ComponentMaster componentMaster = componentMasterOptional.get();
			componentMaster.setRecordStatus("Inactive");
			ComponentMasterRepo.save(componentMaster);
		} else {
			throw new EntityNotFoundException("ComponentMaster with sl " + sl + " not found");
		}
	}

	@Override
	public List<ComponentMaster> getAll() {
		return ComponentMasterRepo.findAllActiveComponents();
	}



//
//	@Override
//	public List<ComponentMaster> findAll() {
//		// TODO Auto-generated method stub
//		return ComponentMasterRepo.findAll();
//	}
//
//
////	@Override
////	public List<ComponentMaster> findAll() {
////		// TODO Auto-generated method stub
////		return ComponentMasterRepo.findAll();
////	}
//
//	@Override
//	public ComponentMaster saveone(ComponentMaster componentMaster) {
//		// TODO Auto-generated method stub
//		return ComponentMasterRepo.save(componentMaster);
//	}
//
//	@Transactional
//	@Override
//	public ComponentMaster update(long sl, ComponentMaster componentMaster) {
//		Optional<ComponentMaster> componentMasterOptional = ComponentMasterRepo.findById(sl);
//		if (componentMasterOptional.isPresent()) {
//			int result = ComponentMasterRepo.updateComponent(sl, componentMaster);
//			try {
//				if (result > 0) {
//					// Assuming you need to fetch the updated entity from the repository
//					return ComponentMasterRepo.findById(sl).orElseThrow(
//							() -> new EntityNotFoundException("ComponentMaster with sl " + sl + " not found"));
//				} else
//					throw new EntityNotFoundException("ComponentMaster with sl " + sl + " not found");
//			} catch (Exception e) {
//				throw new RuntimeException("Failed to update ComponentMaster: " + e.getMessage());
//			}
//		} else {
//			throw new EntityNotFoundException("ComponentMaster with sl " + sl + " not found");
//		}
//	}
//
//	@Override
//	public Optional<ComponentMaster> getbyid(long sl) {
//		Optional<ComponentMaster> componentMasterOptional = ComponentMasterRepo.findById(sl);
//
//		if (componentMasterOptional.isPresent()) {
//			return componentMasterOptional;
//		} else {
//			throw new EntityNotFoundException("ComponentMaster with sl " + sl + " not found");
//		}
//	}
//
//	@Override
//	public void delete(long sl) {
//		Optional<ComponentMaster> componentMasterOptional = ComponentMasterRepo.findById(sl);
//
//		if (componentMasterOptional.isPresent()) {
//			ComponentMaster componentMaster = componentMasterOptional.get();
//			componentMaster.setRecordStatus("Inactive");
//			ComponentMasterRepo.save(componentMaster);
//		} else {
//			throw new EntityNotFoundException("ComponentMaster with sl " + sl + " not found");
//		}
//	}
//
//	@Override
//	public List<ComponentMaster> getAll() {
//		return ComponentMasterRepo.findAllActiveComponents();
//	}

}

package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import com.TTSS03.Entity.ComponentMaster;

public interface ComponentMasterService {
	
	List<ComponentMaster> findAll();
	
	ComponentMaster saveone(ComponentMaster componentMaster);

	ComponentMaster update(long sl, ComponentMaster componentMaster );

	Optional<ComponentMaster> getbyid(long sl);

	void delete(long sl);

	List<ComponentMaster> getAll();

}

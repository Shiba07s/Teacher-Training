package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import com.TTSS03.Entity.ComponentLimit;

public interface ComponentLimitService {
	
    public List<Object[]> getResourcesAndRatesByNames(List<String> resourceNames);

	public ComponentLimit saveOne(ComponentLimit componentLimit);

	public Optional<ComponentLimit> getById(long sl);

	public List<ComponentLimit> getAll();
	
	public List<ComponentLimit> getAllByStatus();

	public ComponentLimit update(long sl, ComponentLimit componentLimit);

	public void delete(long sl);


}

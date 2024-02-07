package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import com.TTSS03.Entity.VenderMaster;

public interface VenderMasterService {

	VenderMaster saveOne(VenderMaster VenderMaster);

	VenderMaster update(int sl, VenderMaster VenderMaster);

	Optional<VenderMaster> getById(int sl);

	void delete(int sl);

	List<VenderMaster> getAll();

}

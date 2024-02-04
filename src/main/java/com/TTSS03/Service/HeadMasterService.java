package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import com.TTSS03.Entity.HeadMaster;

public interface HeadMasterService {

	HeadMaster saveOne(HeadMaster HeadMaster);

	HeadMaster update(int sl, HeadMaster HeadMaster);

	Optional<HeadMaster> getById(int sl);

	void delete(int sl);

	List<HeadMaster> getAll();
}

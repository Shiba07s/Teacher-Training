package com.TTSS03.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.SpellMaster;
import com.TTSS03.Repository.SpellMasterRepository;

@Service
public class SpellMasterServiceimpl implements SpellMasterService {
	
	@Autowired
	SpellMasterRepository SpellMasterRepo;

	@Override
	public List<SpellMaster> getAllSpell() {
		// TODO Auto-generated method stub
		return SpellMasterRepo.findActiveSpell();
	}

	@Override
	public SpellMaster saveOneSpell(SpellMaster spellMaster) {
		// TODO Auto-generated method stub
		return SpellMasterRepo.save(spellMaster);
	}

	@Override
	@Transactional
	public void updateTrainingSpell(long spellcode, String spell) {
		// TODO Auto-generated method stub
		SpellMasterRepo.updateTrainingSpell(spellcode, spell);
		
	}

	@Override
	@Transactional

	public void deActivateTrainingSpell(long spellcode) {
		// TODO Auto-generated method stub
		SpellMasterRepo.deactivateTrainingSpell(spellcode);
		
	}

	@Override
	public SpellMaster getSpell(long spellcode) {
		// TODO Auto-generated method stub
		return SpellMasterRepo.findById(spellcode).orElse(null);
	}
	

}

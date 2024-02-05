package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.SpellMaster;

public interface SpellMasterService {
	
	
	List<SpellMaster>getAllSpell();
	
	SpellMaster saveOneSpell (SpellMaster spellMaster);
	
	 void updateTrainingSpell(long spellcode,String spell);
	    
	    void deActivateTrainingSpell(long spellcode);

		SpellMaster getSpell(long spellcode);

}

package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.SpellMaster;

public interface SpellMasterRepository extends JpaRepository<SpellMaster, Long> {
	
	
	
	 @Modifying
	    @Query("UPDATE SpellMaster t SET t.spell = :spell WHERE t.spellcode = :spellcode")
	    int updateTrainingSpell(@Param("spellcode") long spellcode, @Param("spell") String spell);

	 
	 
	 @Modifying
	    @Query("UPDATE SpellMaster e SET e.status = 'Inactive' WHERE e.spellcode = :spellcode")
	    void deactivateTrainingSpell(@Param("spellcode") long spellcode);
	 
	 
	 @Query("SELECT t FROM SpellMaster t WHERE t.status = 'Active'")
	    List<SpellMaster> findActiveSpell();

}

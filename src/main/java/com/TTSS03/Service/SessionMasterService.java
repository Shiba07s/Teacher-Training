package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.SessionMaster;

public interface SessionMasterService {
	
	SessionMaster createSession(SessionMaster sessionMaster);
	
	List<SessionMaster> getAllSession();
	//SessionMaster updateSessionBySessionName(String sessionNameToUpdate, SessionMaster updatedSession);
	
	//void updateTrainingSession(long id,String sessionCode, String sessionName, String fromDate,String toDate,String status);
	void deActivateTrainingSession(long id);
	void updateSession(long id, SessionMaster sessionMaster) ;

	//SessionMaster findCurrentSession();
	List<SessionMaster> getSessionsWithStatusCurrent();

	SessionMaster findByid(long id);
	
	 

}

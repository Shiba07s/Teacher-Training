package com.TTSS03.Service;

import java.util.List;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.ActualData;
import com.TTSS03.Entity.SearchVenue;
import com.TTSS03.Entity.SessionMaster;
import com.TTSS03.Repository.SessionMasterRepository;


@Service
public class SessionMasterServiceImpl implements SessionMasterService {
	
	@Autowired
	private SessionMasterRepository sessionMasterRepository;

	@Override
	public SessionMaster createSession(SessionMaster sessionMaster) {
		return sessionMasterRepository.save(sessionMaster);
		
	}

	@Override
	public List<SessionMaster> getAllSession() {
		return sessionMasterRepository.findActiveSession();
	}
//	@Transactional
//    public SessionMaster updateSessionBySessionName(String sessionName, SessionMaster sessionMaster) {
//        // Retrieve the existing session by sessionName
//        SessionMaster existingSession = sessionMasterRepository.findBySessionName(sessionName);
//
//        if (existingSession != null) {
//            // Update the properties of the existing session with the new values
//            existingSession.setSessionCode(sessionMaster.getSessionCode());
//            existingSession.setFromDate(sessionMaster.getFromDate());
//            existingSession.setToDate(sessionMaster.getToDate());
//            existingSession.setStatus(sessionMaster.getStatus());
//
//            // Save the updated session
//            return sessionMasterRepository.save(existingSession);
//        }
//
//        // Handle the case where the session with the specified sessionName is not found
//        return null;
//    }
//	
//	@Override
//	@Transactional
//	public void updateTrainingSession(long id,String sessionCode, String sessionName, String fromDate,String toDate,String status) {
//		sessionMasterRepository.updateTrainingSession(status,sessionCode, sessionName,fromDate,toDate,id);
//		
//	}
 
	
	@Override
	@Transactional
	public void updateSession(long id, SessionMaster sessionMaster) {
		// TODO Auto-generated method stub
		sessionMasterRepository.updateSession(id, sessionMaster.getSessionCode(), sessionMaster.getSessionName(), sessionMaster.getFromDate(), sessionMaster.getToDate(), sessionMaster.getStatus());
		
	}
	@Override
	@Transactional
 
	public void deActivateTrainingSession(long id) {
		sessionMasterRepository.deactivateTrainingSession(id);
		
	}
	
	 public List<SessionMaster> getSessionsWithStatusCurrent() {
	        return sessionMasterRepository.findByStatusCurrent();
	    }

	@Override
	public SessionMaster findByid(long id) {
		// TODO Auto-generated method stub
		return sessionMasterRepository.findById(id).orElse(null);
	}

	 
}

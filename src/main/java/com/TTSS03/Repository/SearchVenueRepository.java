package com.TTSS03.Repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.SearchVenue;

public interface SearchVenueRepository extends JpaRepository<SearchVenue, Long> {

	
	@Query("SELECT sv FROM SearchVenue sv WHERE sv.vid = :vid")
	List<SearchVenue> findByVId(@Param("vid") long vid);
	
	@Query("SELECT sv FROM SearchVenue sv WHERE sv.vid = :vid")
	List<SearchVenue> findByVId1(@Param("vid") long vid);
	
	
	@Modifying
    @Query("UPDATE SearchVenue t SET t.vname = :vname , t.vstate=:vstate,t.vmandal=:vmandal ,"
    		+ "t.vdistrict=:vdistrict,t.vlocation=:vlocation,t.vcapacity=:vcapacity,t.vaddress=:vaddress,"
    		+ "t.landmark=:landmark,t.vtype=:vtype,t.vcontactname=:vcontactname,t.vcontactno=:vcontactno,"
    		+ "t.vcontactmailid=:vcontactmailid,t.maplocation=:maplocation WHERE t.vid = :vid")
    int updateVenue(@Param("vid") long vid, @Param("vname") String vname,@Param("vstate") String vstate,
    		@Param("vmandal") String vmandal,@Param("vdistrict") String vdistrict,@Param("vlocation") String vlocation,
    		@Param("vcapacity") String vcapacity,@Param("vaddress") String vaddress,@Param("landmark") String landmark,
    		@Param("vtype") String vtype,@Param("vcontactname") String vcontactname,@Param("vcontactno") String vcontactno,
    		@Param("vcontactmailid") String vcontactmailid,@Param("maplocation") String maplocation);

 
 
 @Modifying
    @Query("UPDATE SearchVenue e SET e.vstatus = 'Inactive' WHERE e.vid = :vid")
    void deactivatevenue(@Param("vid") long vid);
 
 
 @Query("SELECT t FROM SearchVenue t WHERE t.vstatus = 'Active'")
    List<SearchVenue> findActiveVenue();


}

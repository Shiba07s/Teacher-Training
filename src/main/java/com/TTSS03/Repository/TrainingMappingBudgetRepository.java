package com.TTSS03.Repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.SearchVenue;
import com.TTSS03.Entity.TrainingMappingBudget;

public interface TrainingMappingBudgetRepository extends JpaRepository<TrainingMappingBudget, Long> {
	
//	@Query("SELECT m FROM TrainingMappingBudget m WHERE  m.trainingid = :trainingid AND m.venueid= :venueid")
//    List<TrainingMappingBudget> findByTrainingIdAndVenueId(@Param("trainingid") String trainingid, @Param("venueid") String venueid);

	@Query("SELECT m FROM TrainingMappingBudget m WHERE  m.trainingid = :trainingid AND m.venueid= :venueid")
	List<TrainingMappingBudget> findByTrainingIdAndVenueId(String trainingid, String venueid);
	
	@Modifying
	@Query("UPDATE TrainingMappingBudget t SET t.budgetedyear = :budgetedyear, t.trainingname = :trainingname, t.tccode = :tccode, t.tcname = :tcname, "
	        + "t.estimatedbudget = :estimatedbudget, t.sanctionedbudget = :sanctionedbudget, t.additionalbudget = :additionalbudget, "
	        + "t.approvedbudget = :approvedbudget, t.traineerole = :traineerole, t.frequency = :frequency, t.unit = :unit, t.amount = :amount, "
	        + "t.recordstatus = 'approved' " // Set recordstatus to 'approved'
	        + "WHERE t.trainingid = :trainingid and t.venueid = :venueid ")
	int updateTrainingMappingBudget(
	        @Param("trainingid") String trainingid, @Param("venueid") String venueid,
	        @Param("budgetedyear") String budgetedyear, @Param("trainingname") String trainingname,
	        @Param("tccode") String tccode, @Param("tcname") String tcname,
	        @Param("estimatedbudget") String estimatedbudget, @Param("sanctionedbudget") String sanctionedbudget,
	        @Param("additionalbudget") String additionalbudget, @Param("approvedbudget") String approvedbudget,
	        @Param("traineerole") String traineerole, @Param("frequency") String frequency,
	        @Param("unit") String unit, @Param("amount") String amount);
	
	

	
//	@Modifying
//	@Query("UPDATE TrainingMappingBudget t SET t.budgetedyear = :budgetedyear, t.trainingname = :trainingname, t.tccode = :tccode, t.tcname = :tcname, "
//	        + "t.estimatedbudget = :estimatedbudget, t.sanctionedbudget = :sanctionedbudget, t.additionalbudget = :additionalbudget, "
//	        + "t.approvedbudget = :approvedbudget, t.traineerole = :traineerole, t.frequency = :frequency, t.unit = :unit, t.amount = :amount "
//	        + "WHERE t.trainingid = :trainingid and t.venueid = :venueid ")
//	int updateTrainingMappingBudget(
//	        @Param("trainingid") String trainingid, @Param("venueid") String venueid,
//	        @Param("budgetedyear") String budgetedyear, @Param("trainingname") String trainingname,
//	        @Param("tccode") String tccode, @Param("tcname") String tcname,
//	        @Param("estimatedbudget") String estimatedbudget, @Param("sanctionedbudget") String sanctionedbudget,
//	        @Param("additionalbudget") String additionalbudget, @Param("approvedbudget") String approvedbudget,
//	        @Param("traineerole") String traineerole, @Param("frequency") String frequency,
//	        @Param("unit") String unit, @Param("amount") String amount);
// 

	
	@Modifying
	@Query("UPDATE TrainingMappingBudget t SET t.recordstatus = 'approved' where t.trainingid=:trainingid and t.venueid=:venueid")
	int updaterecordstatus(@Param("trainingid")String trainingid,@Param("venueid")String venueid);
	
//	@Modifying
//	@Query("UPDATE TrainingMappingBudget t SET t.recordstatus = 'delivered', t.additionalbudget= :additionalbudget, t.approvedbudget= :approvedbudget where t.trainingid=:trainingid and t.venueid=:venueid")
//	int updaterecordstatusSecondlevel(@Param("trainingid")String trainingid,@Param("venueid")String venueid,@Param("additionalbudget")String additionalbudget,@Param("approvedbudget")String approvedbudget);

	

	    @Modifying
	    @Query("UPDATE TrainingMappingBudget t SET t.recordstatus = 'delivered', t.additionalbudget = :additionalbudget, t.approvedbudget = :approvedbudget where t.trainingid = :trainingid and t.venueid = :venueid")
	    int updaterecordstatusSecondlevel(@Param("trainingid") String trainingid, @Param("venueid") String venueid, @Param("additionalbudget") String additionalbudget, @Param("approvedbudget") String approvedbudget);

	@Query("SELECT sv FROM TrainingMappingBudget sv WHERE sv.sl = :mid")
	List<TrainingMappingBudget> findByMId(@Param("mid") long mid);
	
	@Transactional
	@Modifying
	@Query("UPDATE TrainingMappingBudget t SET t.recordstatus='waiting for next approval', t.sl = :sl, t.budgetedyear = :budgetedyear, t.trainingname = :trainingname, t.tccode = :tccode, t.tcname = :tcname, "
	        + "t.estimatedbudget = :estimatedbudget, t.sanctionedbudget = :sanctionedbudget, t.additionalbudget = :additionalbudget, "
	        + "t.approvedbudget = :approvedbudget, t.traineerole = :traineerole, t.frequency = :frequency, t.unit = :unit, t.amount = :amount  "
	        + "WHERE t.sl = :mid ")
	int updateTrainingMappingBudgetById(
	        @Param("sl") long sl, @Param("budgetedyear") String budgetedyear,
	        @Param("trainingname") String trainingname, @Param("tccode") String tccode,
	        @Param("tcname") String tcname, @Param("estimatedbudget") String estimatedbudget,
	        @Param("sanctionedbudget") String sanctionedbudget, @Param("additionalbudget") String additionalbudget,
	        @Param("approvedbudget") String approvedbudget, @Param("traineerole") String traineerole,
	        @Param("frequency") String frequency, @Param("unit") String unit,
	        @Param("amount") String amount, @Param("mid") long mid);


	  @Query(value = "SELECT DISTINCT ts.trainingname, ts.trainingid, ts.venueid, tt.venue_name, tt.training_start_dt, tt.training_end_dt " +
	            "FROM bdg_component_budgettransaction ts, ttransactiontraining tt " +
	            "WHERE ts.trainingid = tt.ref_planner_id AND ts.venueid = tt.venue_id", nativeQuery = true)
	    List<TrainingMappingBudget> findDistinctTrainingTransactions();

	



}

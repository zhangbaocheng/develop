package com.nanjingsubway.passenger_buy_ticket.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nanjingsubway.passenger_buy_ticket.model.PassengerAccount;
import com.nanjingsubway.passenger_buy_ticket.model.PassengerBuyTicket;
import com.nanjingsubway.passenger_buy_ticket.model.PassengerEvaluation;

public interface BuyTicketDao {
	int buyTicket(Map<String, Object> paramMap);
	PassengerAccount selectAccountMoneyByPassenger(@Param("passengerId") Integer passengerId);
	int insertAccountByPassenger(@Param("passengerId") Integer passengerId);
	int recharge(@Param("rechargeMoney") Float rechargeMoney,@Param("passengerId")Integer passengerId);
	int buyTicketReduceMoney(@Param("price")Float price, @Param("passengetId")Integer passengetId);
	List<PassengerBuyTicket> buyTicketHistory(@Param("passengerId")Integer passengerId);
	
	int evaluation(Map<String, Object> paramMap);
	
	PassengerBuyTicket queryBuyTicketById(@Param("buyTicketId") Integer buyTicketId);
	
	int updateBuyTicketEvaluation(Map<String, Object> paramMap);
	
	PassengerEvaluation showEvaluationContent(@Param("buyTicketId") String buyTicketId);
	
	int buyAgain(@Param("passengerBuyTicket")PassengerBuyTicket passengerBuyTicket);
}

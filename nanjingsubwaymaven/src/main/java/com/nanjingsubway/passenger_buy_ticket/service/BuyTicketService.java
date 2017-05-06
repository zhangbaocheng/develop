package com.nanjingsubway.passenger_buy_ticket.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.nanjingsubway.passenger_buy_ticket.dao.BuyTicketDao;
import com.nanjingsubway.passenger_buy_ticket.model.PassengerAccount;
import com.nanjingsubway.passenger_buy_ticket.model.PassengerBuyTicket;
import com.nanjingsubway.passenger_buy_ticket.model.PassengerEvaluation;
import com.nanjingsubway.utils.NanjingSubwayUtils;

@Service
public class BuyTicketService {
	@Autowired
	private BuyTicketDao buyTicketDao;
	
	@Transactional
	public int buyTicket(PassengerBuyTicket buyTicket){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("buyDate", new Date());
		paramMap.put("endPlace", buyTicket.getEndPlace());
		paramMap.put("isUsed", "n");
		paramMap.put("linesPassBy", buyTicket.getLinesPassBy());
		paramMap.put("passengerId", buyTicket.getPassengerId());
		paramMap.put("price", buyTicket.getPrice());
		paramMap.put("sitesNumberPassBy", buyTicket.getSitesNumberPassBy());
		paramMap.put("startPlace", buyTicket.getStartPlace());
		paramMap.put("startTime", buyTicket.getStartTime());
		int result = buyTicketDao.buyTicket(paramMap);
		result = buyTicketDao.buyTicketReduceMoney(Float.valueOf(buyTicket.getPrice()), buyTicket.getPassengerId());
		return result;
	}
	
	public PassengerAccount selectAccountMoneyByPassenger(Integer passengerId){
		
		PassengerAccount passengerAccount = buyTicketDao.selectAccountMoneyByPassenger(passengerId);
		if(StringUtils.isEmpty(passengerAccount)){
			buyTicketDao.insertAccountByPassenger(passengerId);
			passengerAccount = new PassengerAccount();
		}
		
		return passengerAccount;
	}
	
	public String recharge(String rechargeMoney,Integer passengerId){
		Float rechargeMoneyf = Float.parseFloat(rechargeMoney);
		return ""+buyTicketDao.recharge(rechargeMoneyf,passengerId);
	}
	
	public List<PassengerBuyTicket> buyTicketHistory(Integer passengerId){
		List<PassengerBuyTicket> buyTickets = buyTicketDao.buyTicketHistory(passengerId);
		return buyTickets;
	}
	
	@Transactional
	public int evaluation(PassengerEvaluation passengerEvaluation){
		Map<String, Object> evaluationMap = NanjingSubwayUtils.convertObjToMap(passengerEvaluation);
		buyTicketDao.evaluation(evaluationMap);
		PassengerBuyTicket passengerBuyTicket = buyTicketDao.queryBuyTicketById(passengerEvaluation.getBuyTicketId());
		passengerBuyTicket.setIsEvaluation("y");
		int result = buyTicketDao.updateBuyTicketEvaluation(NanjingSubwayUtils.convertObjToMap(passengerBuyTicket));
		return result;
	}
	
	public PassengerEvaluation showEvaluationContent(String buyTicketId){
		return buyTicketDao.showEvaluationContent(buyTicketId);
	}
	
	public int buyAgain(PassengerBuyTicket passengerBuyTicket){
		return buyTicketDao.buyAgain(passengerBuyTicket);
	}
}

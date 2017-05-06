package com.nanjingsubway.passenger_buy_ticket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nanjingsubway.passenger.model.Passenger;
import com.nanjingsubway.passenger_buy_ticket.model.PassengerAccount;
import com.nanjingsubway.passenger_buy_ticket.model.PassengerBuyTicket;
import com.nanjingsubway.passenger_buy_ticket.model.PassengerEvaluation;
import com.nanjingsubway.passenger_buy_ticket.service.BuyTicketService;

@Controller
@RequestMapping("buyTicket")
public class BuyTicketController {
	@Autowired
	private BuyTicketService buyticketService;
	
	@RequestMapping("buy")
	@ResponseBody
	public String buyTicket(PassengerBuyTicket buyTicket,HttpServletRequest request){
		HttpSession session = request.getSession();
		Passenger loginpassenger= (Passenger) session.getAttribute("loginUser");
		if(StringUtils.isEmpty(loginpassenger)){
			return "no login";
		}
			
		PassengerAccount passengerAccount = buyticketService.selectAccountMoneyByPassenger(loginpassenger.getPassengerId());
		if(StringUtils.isEmpty(passengerAccount.getPassengerAccountMoney())){
			return "money not enough";
		}
		else{
			Float userMoney = Float.parseFloat(passengerAccount.getPassengerAccountMoney());
			float price = Float.valueOf(buyTicket.getPrice());
			if(userMoney < price){
				return "money not enough";
			}
		}
		
		
		buyTicket.setPassengerId(loginpassenger.getPassengerId());
		int result = buyticketService.buyTicket(buyTicket);
		return ""+result;
	}
	
	@RequestMapping("recharge")
	@ResponseBody
	public String recharge(String rechargeMoney,HttpServletRequest request){
		Passenger passenger = (Passenger) request.getSession().getAttribute("loginUser");
		
		buyticketService.recharge(rechargeMoney,passenger.getPassengerId());
		return "success";
	}
	
	@RequestMapping("buyTicketHistory")
	@ResponseBody
	public List<PassengerBuyTicket> buyTicketHistory(HttpServletRequest request){
		Passenger passenger = (Passenger) request.getSession().getAttribute("loginUser");
		List<PassengerBuyTicket> passengerBuyTickets = buyticketService.buyTicketHistory(passenger.getPassengerId());
		return passengerBuyTickets;
	}
	
	@RequestMapping("isLogin")
	@ResponseBody
	public String isLogin(HttpServletRequest request){
		Passenger passenger= (Passenger) request.getSession().getAttribute("loginUser");
		if(StringUtils.isEmpty(passenger)){
			return "no user";
		}
		else{
			return "success";
		}
	}
	
	@RequestMapping("evaluation")
	@ResponseBody
	public String evaluation(HttpServletRequest request,PassengerEvaluation passengerEvaluation){
		Passenger passenger = (Passenger) request.getSession().getAttribute("loginUser");
		passengerEvaluation.setPassengerId(passenger.getPassengerId());
		int result = buyticketService.evaluation(passengerEvaluation);
		if(result > 0){
			return "success";
		}
		else{
			return "error";
		}
	}
	
}

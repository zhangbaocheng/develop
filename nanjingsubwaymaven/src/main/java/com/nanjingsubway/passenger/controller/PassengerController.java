package com.nanjingsubway.passenger.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nanjingsubway.passenger.model.Passenger;
import com.nanjingsubway.passenger.service.PassengerService;

@Controller
@RequestMapping("passenger")
public class PassengerController {
	@Autowired
	PassengerService passengerService = null;
	
	@RequestMapping("selectAll")
	public String selectPassengerAll(){
		List<Passenger> passengers = passengerService.selectPassengerAll();
		System.out.println(passengers);
		return "index";
	}
	
	@RequestMapping("loginByName")
	@ResponseBody
	public String loginByName(Passenger passenger,Model model,HttpServletRequest request,HttpServletResponse response){
		Passenger passengerResult = passengerService.selectByName(passenger.getName());
		
		HttpSession session = request.getSession();
		String sessionId = session.getId();
		Cookie cookie = new Cookie("JSESSIONID", sessionId);
		cookie.setMaxAge(60*60*24*7);//设置session的有效期为一星期
//		cookie.setMaxAge(2);
		response.addCookie(cookie);
		
		if (StringUtils.isEmpty(passengerResult)) {
			return "no user";
		}
		else if(passenger.getPassword().equals(passengerResult.getPassword())){
			session.setAttribute("loginUser", passengerResult);
			return "success";
		}
		else{
			return "password error";
		}
	}
	
	@RequestMapping("register")
	@ResponseBody
	public String register(Passenger passenger){
		Passenger passengerResult = passengerService.selectByName(passenger.getName());
		if (!StringUtils.isEmpty(passengerResult)) {
			return "user exist";
		}
		else{
			int result = passengerService.registerPassenger(passenger.getName(),passenger.getEmail(),passenger.getPassword());
			if(result > 0){
				return "register success";
			}
			else{
				return "register error";
			}
		}
	}
	
	@RequestMapping("userQuit")
	@ResponseBody
	public String userQuit(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", null);
		return "";
	}
	
	@RequestMapping("showPassengerInfomation")
	public String showPassengerInfomation(HttpServletRequest request,Model model){
		Passenger passenger = (Passenger) request.getSession().getAttribute("loginUser");
		model.addAttribute("passenger", passenger);
		return "my/show_passenger_infomation/jsp/show_passenger_infomation";
	}
	
}

package com.nanjingsubway.passenger.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nanjingsubway.passenger.dao.PassengerDao;
import com.nanjingsubway.passenger.model.Passenger;

@Service
public class PassengerService {
	@Autowired
	PassengerDao passengerDao = null;
	public List<Passenger> selectPassengerAll(){
		return passengerDao.selectPassengerAll();
	}
	public Passenger selectByName(String name){
		return passengerDao.selectByName(name);
	}
	
	public int registerPassenger(String name,String email,String password){
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("name", name);
		paramMap.put("email", email);
		paramMap.put("password", password);
		return passengerDao.registerPassenger(paramMap);
	}
}

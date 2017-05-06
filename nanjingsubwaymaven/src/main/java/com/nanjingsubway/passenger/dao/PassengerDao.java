package com.nanjingsubway.passenger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nanjingsubway.passenger.model.Passenger;

public interface PassengerDao {
	List<Passenger> selectPassengerAll();
	Passenger selectByName(@Param("name") String name);
	int registerPassenger(Map<String, String> paramMap);
}

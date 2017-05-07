package com.nanjingsubway.admin.controller;

import com.nanjingsubway.passenger.model.Passenger;
import com.nanjingsubway.passenger.service.PassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by destinys on 2017/5/7.
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private PassengerService passengerService;

    @RequestMapping("admin")
    public String admin(){

        return "admin/jsp/index";
    }

    @RequestMapping("showPassenger")
    public String showPassenger(){
        return "admin/jsp/passenger_manage";
    }

    @RequestMapping("showView")
    public String showView(){

        return "";
    }
    @RequestMapping("showAllPassenger")
    @ResponseBody
    public List<Passenger> showAllPassenger(){
        List<Passenger>passengerList = passengerService.selectPassengerAll();
        return passengerList;
    }

}

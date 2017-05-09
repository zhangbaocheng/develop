package com.nanjingsubway.admin.controller;

import com.nanjingsubway.admin.dao.AdminDao;
import com.nanjingsubway.admin.model.News;
import com.nanjingsubway.admin.service.AdminService;
import com.nanjingsubway.passenger.model.Passenger;
import com.nanjingsubway.passenger.service.PassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by destinys on 2017/5/7.
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private PassengerService passengerService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private AdminDao adminDao;

    @RequestMapping("index")
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
    public Map<String, Object> showAllPassenger(Integer page,Integer rows){
        Map<String,Object> resultMap = new HashMap<>();
        List<Passenger>passengerList = adminService.showAllPassenger(page,rows);
        List<Passenger>queryAllPassenger = passengerService.selectPassengerAll();
        resultMap.put("total",queryAllPassenger.size());
        resultMap.put("rows",passengerList);
        return resultMap;
    }

    @RequestMapping("showNews")
    public String showNews(){
        return "admin/jsp/news_manage";
    }

    @RequestMapping("showAllNews")
    @ResponseBody
    public Map<String,Object> showAllNews(Integer page,Integer rows){
        Map<String,Object> resultMap = new HashMap<>();
        Integer newsCount = adminDao.selectNewsCount();

        resultMap.put("total",newsCount);
        resultMap.put("rows",adminService.showAllNews(page,rows));
        return  resultMap;
    }

    @RequestMapping("releaseNews")
    @ResponseBody
    public String releaseNews(News news){

        return adminService.releaseNews(news);
    }

}

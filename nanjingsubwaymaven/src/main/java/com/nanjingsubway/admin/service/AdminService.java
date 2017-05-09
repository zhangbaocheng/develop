package com.nanjingsubway.admin.service;

import com.nanjingsubway.admin.dao.AdminDao;
import com.nanjingsubway.admin.model.News;
import com.nanjingsubway.passenger.model.Passenger;
import com.nanjingsubway.utils.NanjingSubwayUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by destinys on 2017/5/7.
 */
@Service
public class AdminService {

    @Autowired
    private  AdminDao adminDao;

    public List<Passenger> showAllPassenger(Integer page, Integer rows){
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("limit",rows);
        paramMap.put("offset",(page-1)*rows);

        return adminDao.showAllPassenger(paramMap);
    }

    public List<News> showAllNews(Integer page,Integer rows){
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("limit",rows);
        paramMap.put("offset",(page-1)*rows);
        return adminDao.showAllNews(paramMap);
    }


    public String releaseNews(News news){
        Map<String,Object> paramMap = new HashMap<>();
        paramMap = NanjingSubwayUtils.convertObjToMap(news);
        paramMap.put("newsReleaseDate",new Date());
        Integer result = adminDao.releaseNews(paramMap);
        if(result > 0){
            return "success";
        }
        else{
            return "error";
        }
    }
}

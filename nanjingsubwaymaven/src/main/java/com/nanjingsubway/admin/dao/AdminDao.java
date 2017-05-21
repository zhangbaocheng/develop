package com.nanjingsubway.admin.dao;

import com.nanjingsubway.admin.model.News;
import com.nanjingsubway.passenger.model.Passenger;
import com.nanjingsubway.subway_lines.model.SubwayLineSite;

import java.util.List;
import java.util.Map;

/**
 * Created by destinys on 2017/5/7.
 */
public interface AdminDao {

    List<Passenger> showAllPassenger(Map<String,Object> paramMap);

    List<News> showAllNews(Map<String,Object> paramMap);

    Integer selectNewsCount();

    Integer releaseNews(Map<String,Object> paramMap);

    Integer selectSitesCount();

    List<SubwayLineSite> showAllSites(Map<String,Object> paramMap);
}

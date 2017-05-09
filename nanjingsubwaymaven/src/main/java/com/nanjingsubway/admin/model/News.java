package com.nanjingsubway.admin.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by destinys on 2017/5/9.
 */
public class News {
    private Integer newsId;
    private String newsTheme;
    private String newsContent;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date newsReleaseDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date newsDate;

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getNewsTheme() {
        return newsTheme;
    }

    public void setNewsTheme(String newsTheme) {
        this.newsTheme = newsTheme;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    public Date getNewsReleaseDate() {
        return newsReleaseDate;
    }

    public void setNewsReleaseDate(Date newsReleaseDate) {
        this.newsReleaseDate = newsReleaseDate;
    }

    public Date getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(Date newsDate) {
        this.newsDate = newsDate;
    }
}

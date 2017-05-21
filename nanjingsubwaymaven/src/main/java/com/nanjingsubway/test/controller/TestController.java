package com.nanjingsubway.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;

/**
 * Created by destinys on 2017/5/18.
 */
@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/t1")
    @ResponseBody
    public String t1(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        Writer out = response.getWriter();
//        out.write("hello world");
//        return null;
        return "/test";
    }
    @RequestMapping("/t2")
    @ResponseBody
    public void t2(HttpServletRequest request,HttpServletResponse response) throws Exception{
    }
    @RequestMapping("/t3")
    public String t3(HttpServletRequest request, HttpServletResponse response, RedirectAttributes attr,Model model) throws Exception{
        model.addAttribute("name","zhangbaocheng");

        return "redirect:/test.jsp";
    }

    @RequestMapping("/t4")
    public String t4(HttpServletRequest request, HttpServletResponse response, RedirectAttributes attr, Model model) throws Exception{
//        model.addAttribute("name","zhangbaocheng");
        return "forward:/test.jsp";
    }
    @RequestMapping("/t5")
    public String t5(HttpServletRequest request, HttpServletResponse response, RedirectAttributes attr, Model model) throws Exception{
        model.addAttribute("name","zhangbaocheng");
        return "/test";
    }

}

package com.hqyj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hqyj.pojo.Station;
import com.hqyj.service.StationService;

@Controller
@RequestMapping("stationController")
public class StationController {

    @Autowired
    private StationService stationService;

    @RequestMapping("list")
    public String list(Integer pageno, Model model) { //参数名必须和前台变量统一，叫做pageno
        List<Station> list = stationService.query(pageno);
        model.addAttribute("LIST", list);
        return "stationList";
    }
}
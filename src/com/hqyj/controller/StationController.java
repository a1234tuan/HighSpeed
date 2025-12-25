package com.hqyj.controller;

import java.util.List;
// 补充以下核心引用
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.github.pagehelper.PageInfo;
import com.hqyj.service.StationService;
import com.hqyj.pojo.Station;

@Controller
@RequestMapping("stationController")
public class StationController {

    @Autowired
    private StationService stationService;

    @RequestMapping("list")
    public String list(Integer pageno,String searchname, Model model) {// 参数名必须和前台变量统一，叫做pageno
        PageInfo<Station> page = stationService.query(pageno,searchname);
        model.addAttribute("PAGE", page);
        return "stationList";
    }
}
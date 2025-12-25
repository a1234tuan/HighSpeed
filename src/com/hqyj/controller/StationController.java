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
        
    	if(pageno == null){
    		pageno = 1;
    	}
    	PageInfo<Station> page = stationService.query(pageno,searchname);
        model.addAttribute("PAGE", page);
        return "stationList";
    }
 // 在列表 stationList 页面点击增加按钮触发
    @RequestMapping("preAdd")
    public String preAdd() {
        // 返回逻辑视图名，转发至 WEB-INF/jsp/stationAdd.jsp
        return "stationAdd";
    }
    
    
    //在stationAdd页面，输入信息后，点击增加按钮触发
    @RequestMapping("add")
    public String add(Station s, Model model) {
        int result = 0;
        try {
            result = stationService.add(s);
        } catch (Exception e) {
            result = 0;
            e.printStackTrace();
        }
        
        if (result > 0) {
            // 添加成功，转发到列表 action 重新查询
            return "forward:list.action";
        } else {
            // 添加失败，携带错误信息返回添加页
            model.addAttribute("MSG", "增加失败，请检查站点名称是否重复");
            return "stationAdd";
        }
    }
}
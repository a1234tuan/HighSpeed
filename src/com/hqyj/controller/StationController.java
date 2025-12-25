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
    
    @RequestMapping("delete")
    public String delete(Integer sid, Model model) {
        int result = 0;
        try {
            // 调用业务层执行删除操作
            result = stationService.delete(sid);
        } catch (Exception e) {
            result = 0;
            e.printStackTrace();
        }
        
        // 无论成功失败，都将结果提示存入 Model
        if (result > 0) {
            model.addAttribute("MSG", "删除成功");
        } else {
            model.addAttribute("MSG", "删除失败");
        }
        
        // 转发回列表页面重新查询数据
        return "forward:list.action";
    }
    
    @RequestMapping("preUpdate")
    public String preUpdate(Integer sid, Model model) {
        // 1. 调用 service，根据 sid 获取数据库中对应的 Station 对象
        Station s = stationService.getBySid(sid);
        
        // 2. 将 station 对象存入 Model，传递给前端页面进行回显
        model.addAttribute("STATION", s);
        
        // 3. 跳转到修改页面 (stationUpdate.jsp)
        return "stationUpdate";
    }
    
    
    @RequestMapping("update")
    public String update(Station s, Model model) {
        int result = 0;
        try {
            // 调用 service 执行数据库更新操作
            result = stationService.update(s);
        } catch (Exception e) {
            result = 0;
            e.printStackTrace(); // 将异常信息打印到控制台
        }
        
        if (result > 0) {
            // 修改成功，转发至列表页面重新加载数据
            return "forward:list.action";
        } else {
            // 修改失败，返回修改页面并显示错误信息
            model.addAttribute("MSG", "修改失败");
            return "stationUpdate";
        }
    }
}
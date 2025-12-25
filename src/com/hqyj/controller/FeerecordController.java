package com.hqyj.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hqyj.pojo.Car;
import com.hqyj.pojo.Feerecord;
import com.hqyj.pojo.Station;
import com.hqyj.service.CarService;
import com.hqyj.service.FeerecordService;
import com.hqyj.service.StationService;
import com.hqyj.vo.FeerecordVO;

@Controller
@RequestMapping("/feerecord")
public class FeerecordController {

    @Autowired
    private FeerecordService feerecordService;
    @Autowired
    private CarService carService;       // 用于获取车辆下拉列表
    @Autowired
    private StationService stationService; // 用于获取站点下拉列表

    // 1. 列表页
    @RequestMapping("/list.action")
    public String list(FeerecordVO vo, Model model) {
        List<FeerecordVO> list = feerecordService.getList(vo);
        model.addAttribute("list", list);
        model.addAttribute("searchCno", vo.getCno());
        return "feerecordList";
    }

    // 2. 去添加页面 (准备下拉框数据)
    @RequestMapping("/toAdd.action")
    public String toAdd(Model model) {
        // 获取所有车辆 (衔接你之前做的Car模块)
        List<Car> carList = carService.getList(null);
        model.addAttribute("carList", carList);

        // 获取所有站点 (用于选择入口和出口)
        // 注意：如果你之前StationService没有写getList(null)，可能需要补一个无参查询或传空对象
        // 假设StationService.getList用法和Car类似
        List<Station> stationList = stationService.getAll(); 
        model.addAttribute("stationList", stationList);

        return "feerecordAdd";
    }

    // 3. 执行添加
    @RequestMapping("/add.action")
    public String add(Feerecord feerecord, Model model) {
        int num = feerecordService.add(feerecord);
        if(num > 0) {
            return "redirect:/feerecord/list.action";
        } else {
            return "redirect:/feerecord/toAdd.action";
        }
    }
}

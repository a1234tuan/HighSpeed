package com.hqyj.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hqyj.pojo.Car;
import com.hqyj.pojo.Driver;
import com.hqyj.service.CarService;
import com.hqyj.service.DriverService;

@Controller
@RequestMapping("/car")
public class CarController {

    @Autowired
    private CarService carService;
    
    @Autowired
    private DriverService driverService; // 注入驾驶员Service，为了获取下拉列表

    // 1. 车辆列表
    @RequestMapping("/list.action")
    public String list(Car car, Model model) {
        List<Car> list = carService.getList(car);
        model.addAttribute("list", list);
        model.addAttribute("searchCno", car.getCno());
        return "carList";
    }

    // 2. 去添加页面（这里是关键！需要先把驾驶员列表查出来传给页面）
    @RequestMapping("/toAdd.action")
    public String toAdd(Model model) {
        // 查询所有驾驶员（传入null即无条件查询所有）
        List<Driver> driverList = driverService.getList(null);
        // 将驾驶员列表放入Model，供JSP下拉框使用
        model.addAttribute("driverList", driverList);
        return "carAdd";
    }

    // 3. 执行添加
    @RequestMapping("/add.action")
    public String add(Car car, Model model) {
        try {
            int num = carService.add(car);
            if(num > 0) {
                return "redirect:/car/list.action";
            } else {
                model.addAttribute("MSG", "添加失败");
                // 如果失败留在当前页，还需要重新查一遍驾驶员列表，否则下拉框会空
                model.addAttribute("driverList", driverService.getList(null));
                return "carAdd";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("MSG", "添加失败，可能是车牌号重复");
            model.addAttribute("driverList", driverService.getList(null));
            return "carAdd";
        }
    }
}

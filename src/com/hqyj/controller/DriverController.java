package com.hqyj.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hqyj.pojo.Driver;
import com.hqyj.service.DriverService;

@Controller
@RequestMapping("/driver")
public class DriverController {

    @Autowired
    private DriverService driverService;

    // 跳转到列表页面
    @RequestMapping("/list.action")
    public String list(Driver driver, Model model) {
        List<Driver> list = driverService.getList(driver);
        model.addAttribute("list", list);
        // 回显查询条件
        model.addAttribute("searchName", driver.getName()); 
        return "driverList"; // 返回对应jsp的名字
    }

    // 跳转到添加页面
    @RequestMapping("/toAdd.action")
    public String toAdd() {
        return "driverAdd";
    }

    // 执行添加操作
    @RequestMapping("/add.action")
    public String add(Driver driver, Model model) {
        // 因为dno是主键，理论上应该判断是否存在，这里简化直接添加
        try {
            int num = driverService.add(driver);
            if(num > 0) {
                return "redirect:/driver/list.action"; // 添加成功跳回列表
            } else {
                model.addAttribute("MSG", "添加失败");
                return "driverAdd";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("MSG", "添加失败，可能是驾驶证号重复");
            return "driverAdd";
        }
    }
}

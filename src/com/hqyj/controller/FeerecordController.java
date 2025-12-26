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
    private CarService carService;
    @Autowired
    private StationService stationService;

    // 1. 收费记录列表页
    @RequestMapping("/list.action")
    public String list(FeerecordVO vo, Model model) {
        // 分页逻辑暂时忽略，先保证能查出来
        List<FeerecordVO> list = feerecordService.getList(vo);
        model.addAttribute("list", list);
        // 用于回显查询条件
        model.addAttribute("vo", vo);
        return "feerecordList"; // 对应下面我们要重写的jsp
    }

    // 2. 去进站页面 (准备下拉框数据)
    @RequestMapping("/toIn.action")
    public String toIn(Model model) {
        // 【关键修改】这里不调用 getList(null)，而是调用 getAvailableCarList
        // 这样下拉框里就不会出现已经进站的车了
        List<Car> carList = carService.getAvailableCarList();
        model.addAttribute("carList", carList);
        
        // 获取所有站点 (作为入口站)
        List<Station> stationList = stationService.getAll();
        model.addAttribute("stationList", stationList);
        
        return "feerecordIn"; 
    }

    // 3. 执行进站动作
    @RequestMapping("/in.action")
    public String in(Feerecord feerecord, Model model) {
        // 设置进站状态
        feerecord.setState(1); // 【约定】 1 代表 正在行驶/进站状态
        feerecord.setPrice(null); // 进站还没算钱
        feerecord.setEndid(null); // 还没出站
        
        // 执行添加
        int num = feerecordService.add(feerecord);
        
        if (num > 0) {
            return "redirect:/feerecord/list.action";
        } else {
            return "redirect:/feerecord/toIn.action";
        }
    }
    
    // 出站功能(out.action) 这里暂时先不做，先把进站理顺
}

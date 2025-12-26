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
import com.hqyj.pojo.Driver; 
import com.hqyj.dao.DriverDao; // 注入这个去查余额
import org.springframework.web.bind.annotation.ResponseBody; // AJAX用

@Controller
@RequestMapping("/feerecord")
public class FeerecordController {
	@Autowired
    private DriverDao driverDao; // 暂时直接在这里用dao查余额，或者封装到service
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
    
    // 出站功能(out.action) 
 // 1. 跳转到出站页面 (toOut.action)
    @RequestMapping("/toOut.action")
    public String toOut(Integer fid, Model model) {
        // A. 查询当前的行驶记录
        FeerecordVO vo = feerecordService.getById(fid);
        model.addAttribute("record", vo);
        
        // B. 查询该车的驾驶员余额
        // 注意：vo里面应该通过Car关联出了dno（在Dao的SQL里写的）
        // 如果VO里没有dno属性，请去FeerecordVO加一个 private String dno;
        Driver driver = driverDao.getDriverByDno(vo.getDno()); 
        model.addAttribute("driverMoney", driver.getMoney());
        // C. 查询可用的出站站点 (所有站点排除掉进站站点)
        List<Station> allStations = stationService.getAll();
        // 在页面上做排除，或者这里移除，为了简单，页面判断即可
        model.addAttribute("stationList", allStations);
        return "feerecordOut"; // 跳转到出站JSP
    }
    // 2. AJAX 计算费用接口
	    @RequestMapping("/calcPrice.action")
	    @ResponseBody // 返回内容给JS，不跳页面
	    public int calcPrice(Integer beginid, Integer endid) {
	        return stationService.calculatePrice(beginid, endid);
	    }
	    // 3. 确认出站 (执行扣费和更新)
	    @RequestMapping("/out.action")
	    public String out(Feerecord feerecord, String dno, Double currentMoney, Model model) {
	        try {
	            // feerecord 中包含了 fid, endid, price, backup
	            // dno 和 currentMoney 是页面传来的，用于扣费
	            feerecordService.outStation(feerecord, dno, currentMoney);
	            return "redirect:/feerecord/list.action";
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute("msg", "出站失败：" + e.getMessage());
	            return "forward:/feerecord/toOut.action?fid=" + feerecord.getFid();
	        }
	    }
}

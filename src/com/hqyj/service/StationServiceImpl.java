package com.hqyj.service;

import java.util.List;
// 补充以下核心引用
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.dao.StationDao;
import com.hqyj.pojo.Station;

@Service
@Transactional
public class StationServiceImpl implements StationService {

    // @Value依赖注入，注入的是properties配置文件中的值，是配置文件中等号左边的值page.pageSize
    @Value("${page.pagesize}")
    public Integer pageSize;

    @Autowired
    private StationDao stationDao;    
    public PageInfo<Station> query(Integer pageno) {
        // 告诉PageHelper获取的是第pageno页，每页是pageSize条记录
        System.out.println("====" + pageSize);
        PageHelper.startPage(pageno, pageSize);
        
        // PageHelper.startPage(pageno, Integer.parseInt(pageSize));
        
        List<Station> list = stationDao.queryAll();
        PageInfo<Station> pageInfo = new PageInfo<Station>(list);
        return pageInfo;
    }
}
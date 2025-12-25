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
    public PageInfo<Station> query(Integer pageno,String name) {
        // 告诉PageHelper获取的是第pageno页，每页是pageSize条记录
        System.out.println("====" + pageSize);
        PageHelper.startPage(pageno, pageSize);
        
        // PageHelper.startPage(pageno, Integer.parseInt(pageSize));
        
        List<Station> list = stationDao.query(name);
        PageInfo<Station> pageInfo = new PageInfo<Station>(list);
        return pageInfo;
    }
    
    @Override
    public List<Station> getAll() {
        // 直接调用DAO查询，不要加PageHelper，传入null表示没有模糊查询条件，查所有
        // 假设你的dao.query支持null参数（通常MyBatis xml里会有 <if test="name!=null"> 的判断）
        return stationDao.query(null); 
    }
    @Override
    public int add(Station s){
    	return stationDao.add(s);
    }
    
    @Override
    public int delete(Integer sid){
    	return stationDao.delete(sid);
    }
    
    @Override 
    public Station getBySid(Integer sid){
    	return stationDao.getBySid(sid);
    }
    
    @Override 
    public int update(Station s){
    	return stationDao.update(s);
    }
}
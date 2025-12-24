package com.hqyj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hqyj.dao.StationDao;
import com.hqyj.pojo.Station;

@Service
@Transactional
public class StationServiceImpl implements StationService{
    @Autowired
    private StationDao stationDao;
    
    public List<Station> query(Integer pageno) {
        return stationDao.queryAll();
    }
}
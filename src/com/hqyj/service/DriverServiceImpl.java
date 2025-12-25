package com.hqyj.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.dao.DriverDao;
import com.hqyj.pojo.Driver;
import com.hqyj.service.DriverService;

@Service
public class DriverServiceImpl implements DriverService {

    @Autowired
    private DriverDao driverDao;

    @Override
    public List<Driver> getList(Driver driver) {
        return driverDao.getList(driver);
    }

    @Override
    public int add(Driver driver) {
        return driverDao.add(driver);
    }
}

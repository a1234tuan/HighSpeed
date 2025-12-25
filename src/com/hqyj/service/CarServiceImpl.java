package com.hqyj.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.dao.CarDao;
import com.hqyj.pojo.Car;
import com.hqyj.service.CarService;

@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarDao carDao;

    @Override
    public List<Car> getList(Car car) {
        return carDao.getList(car);
    }

    @Override
    public int add(Car car) {
        return carDao.add(car);
    }
}

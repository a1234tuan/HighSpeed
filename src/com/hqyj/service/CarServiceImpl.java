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
    
    @Override
    public int delete(String cno) {
        return carDao.delete(cno);
    }

    @Override
    public Car getCar(String cno) {
        return carDao.getCar(cno);
    }

    @Override
    public int update(Car car) {
        return carDao.update(car);
    }

}

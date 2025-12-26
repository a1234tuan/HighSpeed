package com.hqyj.service;

import java.util.List;
import com.hqyj.pojo.Car;

public interface CarService {
    public List<Car> getList(Car car);
    public int add(Car car);
    public int delete(String cno);
    public Car getCar(String cno);
    public int update(Car car);

}

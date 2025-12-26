package com.hqyj.dao;

import java.util.List;
import com.hqyj.pojo.Car;

public interface CarDao {
    // 查询车辆列表
    public List<Car> getList(Car car);
    
    // 添加车辆
    public int add(Car car);
    
    public int delete(String cno);
    
    public Car getCar(String cno);

    public int update(Car car);
    
    // 【新增】查询所有不在行驶中的车辆（可进站车辆）
    public List<Car> getAvailableCarList();
    

}

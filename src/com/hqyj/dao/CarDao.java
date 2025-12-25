package com.hqyj.dao;

import java.util.List;
import com.hqyj.pojo.Car;

public interface CarDao {
    // 查询车辆列表
    public List<Car> getList(Car car);
    
    // 添加车辆
    public int add(Car car);
}

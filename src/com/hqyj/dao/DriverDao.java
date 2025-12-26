package com.hqyj.dao;

import java.util.List;
import com.hqyj.pojo.Driver;

public interface DriverDao {
    // 根据条件查询驾驶员列表（如果条件为空则查询所有）
    public List<Driver> getList(Driver driver);
    
    // 添加驾驶员
    public int add(Driver driver);
    
    public int delete(String dno);
    
    public Driver getDriver(String dno);
    
    public int update(Driver driver);

}

package com.hqyj.service;

import java.util.List;
import com.hqyj.pojo.Driver;

public interface DriverService {
    public List<Driver> getList(Driver driver);
    public int add(Driver driver);
    public int delete(String dno);
}

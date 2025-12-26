package com.hqyj.vo;

import com.hqyj.pojo.Feerecord;

public class FeerecordVO extends Feerecord {
    
    // 原有的扩展属性
    private String carName;       // 车辆品牌
    private String driverName;    // 驾驶员姓名 
    private String beginStation;  // 入口站点名称
    private String endStation;    // 出口站点名称
    
    // 【新增】必须补上这个字段，用来接收 SQL 中的 c.dno
    private String dno;           // 驾驶证号

    // Getters and Setters
    public String getCarName() { return carName; }
    public void setCarName(String carName) { this.carName = carName; }
    
    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }
    
    public String getBeginStation() { return beginStation; }
    public void setBeginStation(String beginStation) { this.beginStation = beginStation; }
    
    public String getEndStation() { return endStation; }
    public void setEndStation(String endStation) { this.endStation = endStation; }

    // 【新增】对应的 get/set 方法
    public String getDno() { return dno; }
    public void setDno(String dno) { this.dno = dno; }
}

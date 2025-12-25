package com.hqyj.vo;

import com.hqyj.pojo.Feerecord;

public class FeerecordVO extends Feerecord {
    // 扩展显示的属性
    private String carName;       // 车辆品牌
    private String driverName;    // 驾驶员姓名 (通过Car关联查出来的)
    private String beginStation;  // 入口站点名称
    private String endStation;    // 出口站点名称

    // Getters and Setters
    public String getCarName() { return carName; }
    public void setCarName(String carName) { this.carName = carName; }
    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }
    public String getBeginStation() { return beginStation; }
    public void setBeginStation(String beginStation) { this.beginStation = beginStation; }
    public String getEndStation() { return endStation; }
    public void setEndStation(String endStation) { this.endStation = endStation; }
}

package com.hqyj.pojo;

import java.util.Date;

public class Car {
    private String cno;      // 车牌号
    private String name;     // 车辆品牌
    private String dno;      // 关联的驾驶证号
    private String backup;   // 备用字段
    private Date createtime; // 创建时间
    
    // 为了方便后面显示，我们可以追加一个Driver属性（关联查询用），但基础部分先不动
    // 下面是Get和Set方法

    public String getCno() {
        return cno;
    }
    public void setCno(String cno) {
        this.cno = cno;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDno() {
        return dno;
    }
    public void setDno(String dno) {
        this.dno = dno;
    }
    public String getBackup() {
        return backup;
    }
    public void setBackup(String backup) {
        this.backup = backup;
    }
    public Date getCreatetime() {
        return createtime;
    }
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}

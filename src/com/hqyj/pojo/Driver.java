package com.hqyj.pojo;

import java.util.Date;

public class Driver {
    private String dno;      // 驾驶证号
    private String name;     // 驾驶员姓名
    private Date createtime; // 创建时间

    //以此处为界，下面是Get和Set方法
    //你可以手动生成：右键 -> Source -> Generate Getters and Setters -> Select All -> OK

    public String getDno() {
        return dno;
    }
    public void setDno(String dno) {
        this.dno = dno;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Date getCreatetime() {
        return createtime;
    }
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}

package com.hqyj.pojo;
import java.util.Date;

public class Feerecord {
    private Integer fid;
    private String cno;
    private Integer beginid;
    private Integer endid;
    private Double price;
    private Integer state; // 0或1
    private String backup;
    private Date createtime;

    // 请务必通过右键 -> Source -> Generate Getters and Setters 生成所有方法
    // 为节省篇幅，此处省略get/set代码
    public Integer getFid() { return fid; }
    public void setFid(Integer fid) { this.fid = fid; }
    public String getCno() { return cno; }
    public void setCno(String cno) { this.cno = cno; }
    public Integer getBeginid() { return beginid; }
    public void setBeginid(Integer beginid) { this.beginid = beginid; }
    public Integer getEndid() { return endid; }
    public void setEndid(Integer endid) { this.endid = endid; }
    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }
    public Integer getState() { return state; }
    public void setState(Integer state) { this.state = state; }
    public String getBackup() { return backup; }
    public void setBackup(String backup) { this.backup = backup; }
    public Date getCreatetime() { return createtime; }
    public void setCreatetime(Date createtime) { this.createtime = createtime; }
}

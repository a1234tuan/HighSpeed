package com.hqyj.pojo;

import java.util.Date;

public class Driver {
    private String dno;      // 驾驶证号
    private String name;     // 驾驶员姓名
    private Date createtime; // 创建时间
    private String idcard;      // 身份证
    private Integer sex;        // 性别 (1男 0女)
    private Integer score;      // 积分 (通常初始12分)
    private String tel;         // 电话
    private Double money;      // 余额 (初始0)
    private String backup;      // 备注

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
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getBackup() {
		return backup;
	}
	public void setBackup(String backup) {
		this.backup = backup;
	}
}

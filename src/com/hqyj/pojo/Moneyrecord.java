package com.hqyj.pojo;

import java.util.Date;

public class Moneyrecord {
    private Integer mrid;
    private String dno;
    private Double money; // 注意：为了配合你的Service，这里改为Integer。如果数据库是Decimal，这里建议用Double，请保持一致
    private Integer type; 
    private Date createtime;
	public Integer getMrid() {
		return mrid;
	}
	public void setMrid(Integer mrid) {
		this.mrid = mrid;
	}
	public String getDno() {
		return dno;
	}
	public void setDno(String dno) {
		this.dno = dno;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

    // --- 必须生成以下方法，否则 Service 会报 undefined ---


}

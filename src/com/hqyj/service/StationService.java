package com.hqyj.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.hqyj.pojo.Station;

public interface StationService {
	public PageInfo<Station> query(Integer pageno,String name);
}

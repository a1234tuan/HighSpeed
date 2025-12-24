package com.hqyj.service;

import java.util.List;

import com.hqyj.pojo.Station;

public interface StationService {
	public List<Station> query(Integer pageno);
}
